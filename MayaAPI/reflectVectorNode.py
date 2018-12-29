"""
http://fevsy.blogspot.com/2016/05/reflecting-vector.html
"""
import maya.OpenMaya as om
import maya.OpenMayaMPx as ompx


nodeName = 'reflectVector'
nodeID = om.MTypeId(0x100fff)


class reflectVectorNode(ompx.MPxNode):
    outputPoint = om.MObject()
    inputVector = om.MObject()
    inputMatrix = om.MObject()

    def __init__(self):
        ompx.MPxNode.__init__(self)

    def compute(self, plug, dataBlock):
        if plug != reflectVectorNode.outputPoint:
            return om.kUnknownParameter

        inputVector = om.MVector(dataBlock.inputValue(reflectVectorNode.inputVector).asFloatVector())
        inputMatrix = dataBlock.inputValue(reflectVectorNode.inputMatrix).asMatrix()

        inputVector = om.MVector(inputVector)

        planeNormal = om.MVector(inputMatrix(1, 0),
                                 inputMatrix(1, 1),
                                 inputMatrix(1, 2)).normal()

        planePoint = om.MVector(inputMatrix(3, 0),
                                inputMatrix(3, 1),
                                inputMatrix(3, 2))

        # calculate vector
        inVector = inputVector - planePoint

        reflectVec = inVector * (-1.0)

        projectVec = planeNormal * (inVector * planeNormal)

        projectVec *= 2.0

        outputVec = reflectVec + projectVec

        finalVec = planePoint + outputVec

        outputPoint = dataBlock.outputValue(reflectVectorNode.outputPoint)
        finalMVector = om.MFloatVector(finalVec.x, finalVec.y, finalVec.z)

        outputPoint.setMFloatVector(finalMVector)

        dataBlock.setClean(plug)


def nodeCreator():
    return ompx.asMPxPtr(reflectVectorNode())


def nodeInitializer():
    # create MFN: MATRIX FUNCTION SET
    MFnNumericAttr = om.MFnNumericAttribute()
    MFnMatrixAttr = om.MFnMatrixAttribute()

    # Create attribute
    # input vector
    reflectVectorNode.inputVector = MFnNumericAttr.createPoint('InputPosition', 'InPos')
    MFnNumericAttr.setWritable(True)
    MFnNumericAttr.setKeyable(True)
    reflectVectorNode.addAttribute(reflectVectorNode.inputVector)

    # input matrix
    reflectVectorNode.inputMatrix = MFnMatrixAttr.create('InputMatrix', 'InMat')
    MFnMatrixAttr.setWritable(True)
    MFnMatrixAttr.setKeyable(True)
    reflectVectorNode.addAttribute(reflectVectorNode.inputMatrix)
    # output vector
    reflectVectorNode.outputPoint = MFnNumericAttr.createPoint('OutputPosition', 'OutPos')
    MFnNumericAttr.setReadable(True)
    MFnNumericAttr.setWritable(False)
    # MFnNumericAttr.setStorable(False)
    reflectVectorNode.addAttribute(reflectVectorNode.outputPoint)

    # affect attr
    reflectVectorNode.attributeAffects(reflectVectorNode.inputMatrix, reflectVectorNode.outputPoint)
    reflectVectorNode.attributeAffects(reflectVectorNode.inputVector, reflectVectorNode.outputPoint)


def initializePlugin(mObj):
    mPlugin = ompx.MFnPlugin(mObj, 'Yixiong Xu', '1.0')

    try:
        mPlugin.registerNode(nodeName, nodeID, nodeCreator, nodeInitializer)
    except:
        raise RuntimeError
        print 'Failed to register node.'


def uninitializePlugin(mObj):
    mPlugin = ompx.MFnPlugin(mObj)

    try:
        mPlugin.deregisterNode(nodeID)
    except:
        raise RuntimeError
        print 'Failed to deregister node.'
