import maya.api.OpenMaya as om2


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





