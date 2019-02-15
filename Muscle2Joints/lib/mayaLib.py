import maya.api.OpenMaya as om2
import maya.api.OpenMayaAnim as oma2
import maya.cmds as cmds
import cPickle as pickle
from ..utils import name


def getWorldMatrix(objectName):
    """
    Get the world Matrix of an object based on name
    :param objectName: str, joint node name
    :return: matrix, world matrix
    """
    mSel = om2.MSelectionList()
    mSel.add(objectName)

    mObjA = mSel.getDependNode(0)

    mFnDependNode = om2.MFnDependencyNode(mObjA)

    worldMatrixAttr = mFnDependNode.attribute('worldMatrix')

    matrixPlug = om2.MPlug(mObjA, worldMatrixAttr)
    matrixPlug = matrixPlug.elementByLogicalIndex(0)

    matrixObj = matrixPlug.asMObject()

    worldMatrixData = om2.MFnMatrixData(matrixObj)
    worldMatrix = worldMatrixData.matrix()

    return worldMatrix


def getLocalMatrix(objectName):
    """
    get local matrix of an object based on name
    :param objectName: str, joint node name
    :return: matrix, local matrix
    """
    mSel = om2.MSelectionList()
    mSel.add(objectName)

    mObjA = mSel.getDependNode(0)

    mFnDependNode = om2.MFnDependencyNode(mObjA)

    localMatrixAttr = mFnDependNode.attribute('matrix')

    matrixPlug = om2.MPlug(mObjA, localMatrixAttr)

    matrixObj = matrixPlug.asMObject()

    localMatrixData = om2.MFnMatrixData(matrixObj)
    localMatrix = localMatrixData.matrix()

    return localMatrix


def getBindPoseMatrix(objectName):
    """
    get joint bind matrix
    :param objectName: str, joint name
    :return: matrix, bind matrix
    """
    mSel = om2.MSelectionList()
    mSel.add(objectName)

    mObj = mSel.getDependNode(0)

    mFnDependNode = om2.MFnDependencyNode(mObj)

    bindPoseAttr = mFnDependNode.attribute('bindPose')

    matrixPlug = om2.MPlug(mObj, bindPoseAttr)

    matrixObj = matrixPlug.asMObject()

    bindPoseMatrixData = om2.MFnMatrixData(matrixObj)

    bindPoseMatrix = bindPoseMatrixData.matrix()

    return bindPoseMatrix


def getInverseMatrix(MMatrix):
    """
    get inverse matrix of input MMatrix
    :param MMatrix: MMatrix, input matrix
    :return:MMatrix, inverse matrix
    """
    return MMatrix.inverse()


def getNodeOrDagPath(name):
    """
    get the node(MObject) or MDagPath of the specified string
    :param name: str, name string
    :return: Node(MObject) or MDagPath
    """
    selectionList = om2.MGlobal.getSelectionListByName(name)

    try:
        return selectionList.getDagPath(0)
    except:
        return selectionList.getDependNode(0)


def getSkinWeights(meshDagPath, skinNode):
    """
    get skin weight per vertex for each joint
    :param meshDagPath: MDagPath, MDagPath of mesh shape node
    :param skinNode:MObject, MObject of skinCluster node
    :return: dict, mesh skin weight for each joint Per vertex.
             dict={0:{joint1:0.1, ..., jointX: 0.0}, ..., x:{joint1:0.03, ..., jointX:0.2}}
    """
    meshNode = meshDagPath.node()

    skinFn = oma2.MFnSkinCluster(skinNode)

    meshVertIterFn = om2.MItMeshVertex(meshNode)
    indices = range(meshVertIterFn.count())

    data = {}
    for i in indices:

        singleIDComponent = om2.MFnSingleIndexedComponent()
        vertexComponent = singleIDComponent.create(om2.MFn.kMeshVertComponent)
        singleIDComponent.addElement(indices[i])

        rawWeightDataPerVertex = skinFn.getWeights(meshDagPath, vertexComponent)

        influecesObjs = skinFn.influenceObjects()

        data[i] = {}

        for j in xrange(influecesObjs.__len__()):
            data[i][influecesObjs[j].fullPathName()] = rawWeightDataPerVertex[0][j]

    return data


def getTransformLimits(primaryJoints,
                       defaultAngle=90):
    """
    get transform Limits for uniform sampling
    :param primaryJoints: list(str), primary joint list
    :return:dict, joints transform limits
    """
    transformLimits = {}

    for joint in primaryJoints:
        transformLimits[joint] = {}
        transformLimits[joint]['.rx'] = []
        transformLimits[joint]['.ry'] = []
        transformLimits[joint]['.rz'] = []

        # rotate X
        attrList = cmds.transformLimits(joint, q=1, erx=1)
        for i in range(len(attrList)):
            if attrList[i]:
                transformLimits[joint]['.rx'].append(cmds.transformLimits(joint, q=1, rx=1)[i])
            else:
                if not i:
                    transformLimits[joint]['.rx'].append(-defaultAngle)
                else:
                    transformLimits[joint]['.rx'].append(defaultAngle)

        # rotate Y
        attrList = cmds.transformLimits(joint, q=1, ery=1)
        for i in range(len(attrList)):
            if attrList[i]:
                transformLimits[joint]['.ry'].append(cmds.transformLimits(joint, q=1, ry=1)[i])
            else:
                if not i:
                    transformLimits[joint]['.ry'].append(-defaultAngle)
                else:
                    transformLimits[joint]['.ry'].append(defaultAngle)

        # rotate Z
        attrList = cmds.transformLimits(joint, q=1, erz=1)
        for i in range(len(attrList)):
            if attrList[i]:
                transformLimits[joint]['.rz'].append(cmds.transformLimits(joint, q=1, rz=1)[i])
            else:
                if not i:
                    transformLimits[joint]['.rz'].append(-defaultAngle)
                else:
                    transformLimits[joint]['.rz'].append(defaultAngle)

    return transformLimits


def uniformSampling(transformLimits,
                    jointsOrder,
                    progressBar,
                    iterAngle=10):
    """
    uniformly generating different poses
    :param transformLimits: dict, transform limits of each bone
    :param jointsOrder: list, primary bones correct order
    :param iterAngle: int, iter angle for each poses
    :return: None
    """
    # check dict and clean 0 keys
    for joint in transformLimits.keys():
        for rot in transformLimits[joint].keys():
            if transformLimits[joint][rot][0] == transformLimits[joint][rot][-1]:
                del transformLimits[joint][rot]

    # build lists for combinations
    # ['joint1':{'.rx': [-30, -20, ..., 30]}, 'jointX':{'.rx': [-30, ..30]}]
    for joint in transformLimits.keys():
        for rot in transformLimits[joint].keys():

            i = 1
            while transformLimits[joint][rot][0] + iterAngle * i < transformLimits[joint][rot][-1]:
                transformLimits[joint][rot].insert(-1, transformLimits[joint][rot][0] + iterAngle * i)
                i += 1

    # generate final list
    # interList = [[{u'joint1.ry': -30}, {u'joint1.ry': -20}], ... , [{u'joint4.rx': -10}, {u'joint4.rx': 0.0}]]
    #                             [joint1.ry]                ......                  [jointX.rx]

    interList = []
    for joint in jointsOrder:
        for rot in transformLimits[joint].keys():
            tempList = []
            for attr in transformLimits[joint][rot]:
                tempDict = {}
                tempDict[joint + rot] = attr

                tempList.append(tempDict)

            interList.append(tempList)

    # check interList and delete None list
    for item in interList:
        if len(item) < 1:
            interList.remove(item)

    # bind pose keyFrame
    cmds.currentTime(0)
    for joint in jointsOrder:
        cmds.setKeyframe(joint, time=cmds.currentTime(q=1))

    # generate keyFrames
    generatePoses(interList, progressBar=progressBar)

    # set back to bind pose
    cmds.currentTime(0)


def generatePoses(lists, progressBar):
    """
    generate different poses
    :param lists:list of lists for each joint rotations
    :return: None
    """
    total = reduce(lambda x, y: x*y, map(len, lists))

    startTime = 1
    endTime = startTime + total
    cmds.playbackOptions(min=startTime - 1)
    cmds.playbackOptions(max=endTime)

    prePercentage = 0

    for i in range(0, total):
        step = total

        tempItem = []

        for l in lists:
            step /= len(l)

            tempItem.append(l[i/step % len(l)])

        for dict in tempItem:
            cmds.currentTime(startTime)
            cmds.setAttr(dict.keys()[0], dict[dict.keys()[0]])
            cmds.setKeyframe(name.removeSuffix(dict.keys()[0]), time=startTime)

        percentage = round((float(i) / float(total)) * 100)

        if percentage != prePercentage:
            progressBar.setValue(percentage)
            prePercentage = percentage

        startTime += 1


def getAllInputData(mesh, primaryJoints):
    """
    get all necessary input data for calculating regression
    :param mesh: str, TransformNode name of bind mesh
    :param primaryJoints: list(str), list of name of primary joints
    :return: dict, all data for export
    """
    inputData = {}
    # {v j}
    vertexTransBindPose = {}
    # {B d}
    primaryJntsBindPose = {}
    # {v d,n}
    vertexTransAtDiffPoses = {}
    # {G d,n}
    primaryJntsWorldTransAtDiffPoses = {}

    #############
    # Bind Pose #
    #############

    # {v j}
    cmds.currentTime(0)

    meshShapeName = cmds.listRelatives(mesh, p=0, c=0, s=1)[0]
    meshSelList = om2.MSelectionList()
    meshSelList.add(meshShapeName)

    meshDagPath = meshSelList.getDagPath(0)
    meshMFn = om2.MFnMesh(meshDagPath)
    meshVertIterFn = om2.MItMeshVertex(meshDagPath.node())
    indices = range(meshVertIterFn.count())

    for vertexIndex in indices:
        vertexTransBindPose[vertexIndex] = list(meshMFn.getPoint(vertexIndex, om2.MSpace.kWorld))

    # {B d}
    for joint in primaryJoints:
        primaryJntsBindPose[joint] = list(getBindPoseMatrix(joint))

    ###################
    # Different Poses #
    ###################

    # {v d,n}
    startFrame = 1
    endFrame = cmds.playbackOptions(max=1, q=1)

    for frame in range(int((endFrame-startFrame)+1)):
        cmds.currentTime(startFrame + frame)
        vertexTransAtDiffPoses[startFrame + frame] = {}

        for vertexIndex in indices:
            vertexPoint = meshMFn.getPoint(vertexIndex, om2.MSpace.kWorld)
            vertexTransAtDiffPoses[startFrame + frame][vertexIndex] = [vertexPoint.x, vertexPoint.y, vertexPoint.z, vertexPoint.w]

        # {G d,n}
        primaryJntsWorldTransAtDiffPoses[startFrame + frame] = {}

        for joint in primaryJoints:
            primaryJntsWorldTransAtDiffPoses[startFrame + frame][joint] = list(getWorldMatrix(joint))

    # input data
    inputData['vertexTransBindPose'] = vertexTransBindPose
    inputData['primaryJntsBindPose'] = primaryJntsBindPose
    inputData['vertexWorldTransAtDiffPoses'] = vertexTransAtDiffPoses
    inputData['primaryJntsWorldTransAtDiffPoses'] = primaryJntsWorldTransAtDiffPoses

    return inputData


def exportData(mesh,
               primaryJoints,
               filePath=None):
    """
    Export All input Data for further calculating
    :param mesh: skin mesh
    :param primaryJoints: list, primary joints list in correct order.
    :param filePath: str, file path
    :return: filePath: str, export data full file path.
    """
    kFileExtension = '.data'
    if not filePath:
        startDir = cmds.workspace(q=1, rootDirectory=1)
        filePath = cmds.fileDialog2(dialogStyle=2, fileMode=0, startingDirectory=startDir,
                                    fileFilter='Input Data(*%s)' % kFileExtension)

    if not filePath:
        return
    filePath = filePath[0]

    if not filePath.endswith(kFileExtension):
        filePath += kFileExtension

    data = getAllInputData(mesh=mesh, primaryJoints=primaryJoints)

    fh = open(filePath, 'wb')

    pickle.dump(data, fh, pickle.HIGHEST_PROTOCOL)

    fh.close()

    # delete the ROMs
    endTime = cmds.playbackOptions(max=1, q=1)
    startTime = 1

    for i in primaryJoints:
        cmds.cutKey(i, time=(endTime, startTime))

    cmds.currentTime(0)
    for i in primaryJoints:
        cmds.cutKey(i, time=(0, 0))

    return filePath
