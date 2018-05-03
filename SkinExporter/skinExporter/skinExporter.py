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
            # return intermediate shape which has incoming objects
            if intermediate and isIntermediate and cmds.listConnections(shape, source=0, destination=1):
                return shape

            # return visible shape
            elif not intermediate and not isIntermediate:
                return shape

        if shapes:
            return shapes[0]
    # return the shape which just is a Shape Node
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

            # Read the data from the file
            fh = open(filePath, 'rb')
            data = pickle.load(fh)
            fh.close()

            # Make sure the vertex count is the same
            meshVertices = cmds.polyEvaluate(shape, vertex=1)

            importedVertices = len(data['blendWeights'])
            if meshVertices != importedVertices:
                raise RuntimeError('Vertex counts do not match. %d != %d' % (meshVertices, importedVertices))

            # check if the shape already has a skinCluster
            if SkinCluster.getSkinCluster(shape):
                skinCluster = SkinCluster(shape)
            else:
                # create a new skinCluster
                joints = data['weights'].key()

                # Make sure all the joints exist
                unusedImports = []
                noMatch = set([SkinCluster.removeNamespaceFromString(x) for x in cmds.ls(type='joint')])

                for j in joints:
                    if j in noMatch:
                        noMatch.remove(j)
                    else:
                        unusedImports.append(j)

                # Remapping the joints
                # if there were unmapped influences ask the user to map them
                if unusedImports and noMatch:
                    mappingDialog = WeightRemapDialog(getMayaWindow())
                    mappingDialog.setInfluences(unusedImports, noMatch)
                    mappingDialog.exec_()

                    for src, dst in mappingDialog.mapping.items():
                        # swap the mapping
                        data['weights'][dst] = data['weights'][src]
                        del data['weights'][src]

                # Create the skinCluster with post normalization so setting the weights does not
                # normalize all weights
                joints = data['weights'].keys()
                skinCluster = cmds.skinCluster(joints, shape, tsb=1, nw=2, n=data['name'])
                skinCluster = SkinCluster(shape)

            skinCluster.setData(data)
            print "Imported %s" % filePath



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

    def setData(self, data):
        """
        Sets the data and stores it in the Maya skinCluster node.
        :return:
        """
        self.data = data
        dagPath, components =self._getGeometryComponents()
        self.setInfluenceWeights(dagPath, components)
        self.setBlendWeights(dagPath, components)

        for attr in ['skinningMethod', 'normalizeWeights']:
            cmds.setAttr('%s.%s' % (self.node, attr), self.data[attr])


    def setInfluenceWeights(self, dagPath, components):
        """

        :param dagPath:
        :param components:
        :return:
        """
        weights = self._getCurrentWeights(dagPath, components)
        influencePaths = openmaya.MDagPathArray()
        numInfluences = self.fn.influenceObjects(influencePaths)
        numComponentsPerInfluence = weights.length() / numInfluences



        # Keep track of which imported influences aren't used
        unusedImports = []
        # Keep track of which existing influences don't get anything imported
        noMatch = [influencePaths[ii].partialPathName() for ii in range(influencePaths.length())]

        for importedInfluence, importedWeights in self.data['weight'].items():
            for ii in range(influencePaths.length()):
                # partialPathName used to return exclusive partial path name of the object
                influenceName = influencePaths[ii].partialPathName()
                influenceWithoutNamespace = SkinCluster.removeNamespaceFromString(influenceName)

                if influenceWithoutNamespace == importedInfluence:
                    # Store the imported weights into the MDoubeArray
                    for jj in range(numComponentsPerInfluence):
                        weights.set(importedWeights[jj], jj * numInfluences + ii)

                    noMatch.remove(influenceName)
                    break
            else:
                unusedImports.append(importedInfluence)

        influenceIndics = openmaya.MIntArray()
        for ii in range(numInfluences):
            influenceIndics.set(ii, ii)
        self.fn.setWeights(dagPath, components, influenceIndics, weights, False)

    def setBlendWeights(self, dagPath, components):
        """
        Set BlendWeights
        :param dagPath:
        :param components:
        :return:
        """
        blendWeights = openmaya.MDoubleArray(len(self.data['blendWeights']))
        for i, w in enumerate(self.data['blendWeights']):
            blendWeights.set(w, i)

        self.fn.setBlendWeights(dagPath, components, blendWeights)










