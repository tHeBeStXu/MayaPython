import maya.api.OpenMaya as om2
import maya.cmds as cmds
import numpy as np
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


def getMatrixAsNpArray(objectName, matrixType):
    """
    get the target matrix data and return as a npArray
    :param objectName: str,
    :param matrixType:str, matrix type string(worldMatrix, matrix, bindPose)
    :return: matrix in npArray
    """
    tempMatrix = cmds.getAttr(objectName + '.' + matrixType)
    npArray = np.array([
                        [tempMatrix[0], tempMatrix[1], tempMatrix[2], tempMatrix[3]],
                        [tempMatrix[4], tempMatrix[5], tempMatrix[6], tempMatrix[7]],
                        [tempMatrix[8], tempMatrix[9], tempMatrix[10], tempMatrix[11]],
                        [tempMatrix[12], tempMatrix[13], tempMatrix[14], tempMatrix[15]]
                       ])
    return npArray


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
    generatePoses(interList)


def generatePoses(lists):
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
        startTime += 1
