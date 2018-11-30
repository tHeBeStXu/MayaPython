import maya.api.OpenMaya as om2
import maya.cmds as cmds
from itertools import combinations


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


def getTransformLimits(primaryJoints,
                       defaultAngle=180):
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
                    iterAngle=20):

    sampleList = []
    for key in transformLimits.keys():
        tempList = []

        i = 0
        while transformLimits[key][0] + iterAngle * i < transformLimits[key][-1]:
            tempList.append(transformLimits[key][0] + iterAngle * i)
            i += 1

        tempList.append(transformLimits[key][-1])

        sampleList.append(tempList)

    finalList = combinationLists(sampleList)

    for iterList in finalList:
        if len(transformLimits.keys) == len(iterList):
            pass

    pass


def combinationLists(lists):
    total = reduce(lambda x, y: x*y, map(len, lists))

    finalList = []

    for i in range(0, total):
        step = total

        tempItem = []

        for l in lists:
            step /= len(l)

            tempItem.append(l[i/step % len(l)])

        finalList.append(tuple(tempItem))

    return finalList

