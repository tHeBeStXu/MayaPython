import cPickle as pickle
import maya.cmds as cmds
import maya.OpenMaya as openmaya
import maya.OpenMayaUI as openmayaui
import maya.OpenMayaAnim as openmayaanim


def getShape(node, intermediate=False):
    """
    Get the shape from specified node.

    :param node: node Name of a transform or shape node.
    :param intermediate: intermediate True to get the intermediate shape, False to get the visible shape
    :return: the name of the desired shape node
    """
    if cmds.nodeType(node) == 'transform':
        shapes = cmds.listRelatives(node, shapes=1, path=1)

        # from transform node to get the shape node
        if not shapes:
            shapes = []
        for shape in shapes:
            isIntermediate = cmds.getAttr('%s.intermediateObject' % shape)
            # Sometimes there are left over intermediate shapes that are not used to(the duplicated deformed shape)
            # check the connections to make sure we get the one that is used
            if intermediate and isIntermediate and cmds.listConnections(shape, source=0):
                return shape
            elif not intermediate and not isIntermediate:
                return shape

        if shapes:
            return shape[0]

    elif cmds.nodeType(node) in ['mesh', 'nurbsCurve', 'nurbsSurface']:
        return node

    return None




class SkinCluster(object):

    kFileExtension = '.skin'

    def __init__(self, shape=None):
        if not shape:
            try:
                shape = cmds.ls(sl=1)[0]

            except:
                raise RuntimeError('No shape selected')

        self.shape = getShape(shape)

        if not self.shape:
            raise RuntimeError('No shape connected to %s' % shape)

        # Get the skinCluster node attached to the shape
        self.node = SkinCluster.getSkinCluster(self.shape)

        # Get the skinCluster MObject
        selectionList = openmaya.MSelectionList()
        selectionList.add(self.node)
        self.mobj = openmaya.MObject()
        selectionList.getDependNode(0, self.mobj)
        self.fn = openmayaanim.MFnSkinCluster(self.mobj)
        self.data = {'weight': {},
                     'blendWeights': [],
                     'name': self.node}

    def gatherData(self):
        dagPath, components = self._getGeometryComponents()
        self.gatherInfluenceWeights(dagPath, components)
        self.gatherBlendWeights(dagPath, components)

        for attr in ['skinningMethod', 'normalizeWeights']:
            self.data[attr] = cmds.getAttr('%s.%s' % (self.node, attr))


    @classmethod
    def export(cls, filePath=None, shape=None):
        skin = SkinCluster(shape)
        skin.exportSkin(filePath)

    @classmethod
    def createAndImport(cls, filePath=None, shape=None):
        """
        Create a skinCluster on the specified shape if one does not already exist
        and then import the weight data.
        :param filePath:
        :param shape:
        :return:
        """

        if not shape:
            try:
                shape = cmds.ls(sl=1)[0]

            except:
                raise RuntimeError('No shape selected')

        if filePath == None:
            startDir = cmds.workspace(q=1, rootDirectory=1)
            filePath = cmds.fileDialog2(dialogStyle=2, fileMode=1, startingDirectory=startDir,
                                        fileFilter='Skin Files (*%s)' % SkinCluster.kFileExtension)

            if not filePath:
                return
            if not isinstance(filePath, basestring):
                filePath = filePath[0]


    @classmethod
    def getSkinCluster(cls, shape):
        """
        Get the skinCluster node attached to the specified shape.
        :param shape: Shape node name
        :return: The attached skinCluster name or None if no skinCluster is attached
        """
        shape = getShape(shape)
        history = cmds.listHistory(shape, pruneDagObjects=1, interestLevel=2)

        if not history:
            return None
        skins = [x for x in history if cmds.nodeType(x) == 'skinCluster']

        if skins:
            return skins[0]
        return None

    @classmethod
    def removeNamespaceFromString(cls, influenceName):
        """
        Remove namespaces from a string
        CHANGES NAMESPACE:  joint1 | NAMESAPCE:joint2 -> joint1 | joint2
        :param influenceName: string, name with a namespace
        :return: string ,name without a namespace
        """
        tokens = influenceName.split('|')
        result = ''

        for i, tokens in enumerate(tokens):
            if i > 0:
                result += '|'

            result += tokens.split(':')[-1]

        return result

    def _getGeometryComponents(self):
        # get dagPath and member components of skined shape
        fnSet = openmaya.MFnSet(self.fn.deformerSet())
        members = openmaya.MSelectionList()
        fnSet.getMembers(members, False)

        dagPath = openmaya.MDagPath()
        components = openmaya.MObject()
        members.getDagPath(0, dagPath, components)

        return dagPath, components

    def gatherInfluenceWeights(self, dagPath, components):
        # Gathers all the influence weights
        weights = self._getCurrentWeights(dagPath, components)

        influencePaths = openmaya.MDagPathArray()
        numInfluences = self.fn.influenceObjects(influencePaths)
        numComponentsPerInfluence = weights.length() / numInfluences

        for ii in range(influencePaths.length()):
            influenceName = influencePaths[ii].partialPathName()

            # we want to store the weights by influence without the namespace so it is easier
            # to import if the namespace is different
            influenceWithoutNamespace = SkinCluster.removeNamespaceFromString(influenceName)
            self.data['weight'][influenceWithoutNamespace] = [weights[jj * numInfluences + ii] for jj in range(numComponentsPerInfluence)]

    def gatherBlendWeights(self, dagPath, components):
        """Gather the BlendWeights"""
        weights = openmaya.MDoubleArray()
        self.fn.getBlendWeights(dagPath, components, weights)
        self.data['blendWeights'] = [weights[i] for i in range(weights.lengh())]

    def _getCurrentWeights(self, dagPath, components):
        """Get the current weight array"""
        weights = openmaya.MDoubleArray()
        util = openmaya.MScriptUtil()

        util.createFromInt(0)

        pUInt = util.asUintPtr()

        self.fn.getWeights(dagPath, components, weights, pUInt)

        return weights

    def exportSkin(self, filePath=None):
        """
        Export the skinCluster data to disk
        :param filePath: File Path
        :return:
        """
        if filePath == None:
            startDir = cmds.workspace(q=1, rootDirectory=1)
            filePath = cmds.fileDialog2(dialogStyle=2, fileMode=0, startingDirectory=startDir,
                                        fileFilter='Skin Files(*%s)' % SkinCluster.kFileExtension)

        if not filePath:
            return

        filePath = filePath[0]

        if not filePath.endswith(SkinCluster.kFileExtension):
            filePath += SkinCluster.kFileExtension

        self.gatherData()

        fh = open(filePath, 'wb')
        pickle.dump(self.data, fh, pickle.HIGHEST_PROTOCOL)

        fh.close()
        print "Exported skinCluster (%d influences, %d vertices) %s" % (len(self.data['weight'].keys()), len(self.data['blendWeights']), filePath)










