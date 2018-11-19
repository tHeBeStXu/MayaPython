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


def getGlobalTransform(objectName):
    mSel = om2.MSelectionList()
    mSel.add(objectName)

    mOjb = mSel.getDependNode(0)

    transformNode = om2.MFnTransform(mOjb)

    transformationMatrix = transformNode.transformation().asMatrix()

    return transformationMatrix






