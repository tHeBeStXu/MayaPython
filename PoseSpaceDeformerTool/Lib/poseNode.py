import maya.OpenMaya as om
import maya.OpenMayaMPx as ompx
import sys
import math

nodeName = 'poseNode'
nodeID = om.MTypeId(0x100fff)


class poseReaderNode(ompx.MPxNode):

    locatorWorldMatrix = om.MObject()

    poseReaderWorldMatrix = om.MObject()

    coneAngle = om.MObject()

    output = om.MObject()

    def __init__(self):
        ompx.MPxNode.__init__(self)

    def compute(self, plug, dataBlock):
        if plug != poseReaderNode.output:
            return om.kUnknownParameter

        coneAngleDH = dataBlock.inputValue(poseReaderNode.coneAngle)
        coneAngleAttr = coneAngleDH.asFloat()

        # pose reader world matrix attribute
        poseReaderWorldMatrixDH = dataBlock.inputValue(poseReaderNode.poseReaderWorldMatrix)
        poseReaderWorldMatrixAttr = poseReaderWorldMatrixDH.asMatrix()

        poseReaderWorldMatrixAttrMTrans = om.MTransformationMatrix(poseReaderWorldMatrixAttr)

        poseReaderTranslation = poseReaderWorldMatrixAttrMTrans.getTranslation(om.MSpace.kWorld)

        # locator world matrix attribute
        locatorWorldMatrixDH = dataBlock.inputValue(poseReaderNode.locatorWorldMatrix)
        locatorWorldMatrixAttr = locatorWorldMatrixDH.asMatrix()

        locatorWorldMatrixAttrMTrans = om.MTransformationMatrix(locatorWorldMatrixAttr)

        locatorTranslation = locatorWorldMatrixAttrMTrans.getTranslation(om.MSpace.kWorld)

        pose2locatorWorldVector = locatorTranslation - poseReaderTranslation

        # get world Z axis of pose reader
        poseReaderZAxisWorldVector = om.MVector(0.0, 0.0, 1.0) * poseReaderWorldMatrixAttr

        vec1Normal = pose2locatorWorldVector.normal()

        vec2Normal = poseReaderZAxisWorldVector.normal()

        dotProduct = vec1Normal * vec2Normal

        angleInRadius = math.acos(dotProduct)

        angleInEuler = angleInRadius / math.pi * 180

        outputRange = angleInEuler / coneAngleAttr

        outputValue = 1 - max(min(outputRange, 1), 0)

        outputDH = dataBlock.outputValue(poseReaderNode.output)
        outputDH.setFloat(outputValue)

        # print outputValue

        dataBlock.setClean(plug)


def nodeCreator():
    return ompx.asMPxPtr(poseReaderNode())


def nodeInitializer():

    # input inverse world matrix (pose)
    matrixAttr1 = om.MFnMatrixAttribute()
    poseReaderNode.poseReaderWorldMatrix = matrixAttr1.create('poseReaderWorldMatrix', 'poseReaderWorldMatrix', om.MFnMatrixAttribute.kDouble)
    matrixAttr1.setKeyable(1)
    matrixAttr1.setStorable(1)
    matrixAttr1.setReadable(0)
    matrixAttr1.setWritable(1)
    poseReaderNode.addAttribute(poseReaderNode.poseReaderWorldMatrix)

    matrixAttr2 = om.MFnMatrixAttribute()
    poseReaderNode.locatorWorldMatrix = matrixAttr2.create('locatorWorldMatrix', 'locatorWorldMatrix', om.MFnMatrixAttribute.kDouble)
    matrixAttr2.setKeyable(1)
    matrixAttr2.setStorable(1)
    matrixAttr2.setReadable(0)
    matrixAttr2.setWritable(1)
    poseReaderNode.addAttribute(poseReaderNode.locatorWorldMatrix)

    # create attribute
    MFnNumericAttr = om.MFnNumericAttribute()

    poseReaderNode.coneAngle = MFnNumericAttr.create('coneAngle', 'coneAngle', om.MFnNumericData.kFloat, 1.0)
    MFnNumericAttr.setMin(0.0)
    MFnNumericAttr.setMax(180.0)
    MFnNumericAttr.setWritable(1)
    MFnNumericAttr.setKeyable(1)
    poseReaderNode.addAttribute(poseReaderNode.coneAngle)

    # output
    poseReaderNode.output = MFnNumericAttr.create('outputRange', 'output', om.MFnNumericData.kFloat, 0.0)
    MFnNumericAttr.setWritable(0)
    MFnNumericAttr.setReadable(1)
    poseReaderNode.addAttribute(poseReaderNode.output)

    # attribute affects
    poseReaderNode.attributeAffects(poseReaderNode.locatorWorldMatrix, poseReaderNode.output)
    poseReaderNode.attributeAffects(poseReaderNode.poseReaderWorldMatrix, poseReaderNode.output)


# 3. initialize Plugin
def initializePlugin(mObj):
    # Because mayaCore has already prepared a handle(named mObj here, which is in form of MObject)
    # for the Pointer above, define a plugin function set and pass the handle to it.
    mPlugin = ompx.MFnPlugin(mObj, 'Yixiong Xu', '1.0')
    try:
        mPlugin.registerNode(nodeName, nodeID, nodeCreator, nodeInitializer)
    except:
        sys.stderr.write("Failed to register Node: " + nodeName)


# 4. unitialize Plugin
def uninitializePlugin(mObj):
    mplugin = ompx.MFnPlugin(mObj)
    try:
        # For de-registering NODE, we just need the NodeID and the Pointer is already in Maya Core
        mplugin.deregisterNode(nodeID)
    except:
        sys.stderr.write("Failed to de-register Node: " + nodeName)
