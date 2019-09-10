"""
Note:
    This node is used for Legacy 1.0 renderer
How to use:
1. download the python file to your disk and remember the directory
2. Run Maya and select the legacy renderer.
3. Input the following command:
    import maya.cmds as cmds
    cmds.loadPlugin(r'X:WHERE\YOU\PUT\THE\FILE')
    cmds.createNode('PoseReader')
4. Select the target object and connect its worldMatrix attribute to the PoseReader's inputWorldMatrix attribute
5. Connect PoseReader's worldMatrix attribute to the selfWorldMatrix attribute
"""
import maya.OpenMaya as om
import maya.OpenMayaMPx as ompx
import maya.OpenMayaRender as omrd

import sys
import math

nodeName = 'PoseReader'
nodeID = om.MTypeId(0x100fff)

glRender = omrd.MHardwareRenderer.theRenderer()
glFuncTable = glRender.glFunctionTable()


class poseReaderNode(ompx.MPxLocatorNode):
    rho = om.MObject()
    coneAngle = om.MObject()

    segments = om.MObject()

    inputWorldMatrix = om.MObject()
    selfWorldMatrix = om.MObject()

    output = om.MObject()

    def __init__(self):
        super(poseReaderNode, self).__init__()

    def compute(self, plug, dataBlock):
        if plug != poseReaderNode.output:
            return om.kUnknownParameter
        # Phi attribute
        coneAngleDH = dataBlock.inputValue(poseReaderNode.coneAngle)
        coneAngleAttr = coneAngleDH.asFloat()

        # Rho attribute
        rhoDH = dataBlock.inputValue(poseReaderNode.rho)
        rhoAttr = rhoDH.asFloat()

        # segments attribute
        segmentDH = dataBlock.inputValue(poseReaderNode.segments)
        segmentAttr = segmentDH.asInt()

        # custom locator world matrix
        selfWorldMatrixDH = dataBlock.inputValue(poseReaderNode.selfWorldMatrix)

        selfWorldMatrixAttr = selfWorldMatrixDH.asMatrix()

        selfWorldMatrixMTrans = om.MTransformationMatrix(selfWorldMatrixAttr)

        # input world matrix
        inputWorldMatrixDH = dataBlock.inputValue(poseReaderNode.inputWorldMatrix)
        inputworldMatrixAttr = inputWorldMatrixDH.asMatrix()
        inputworldMatrixMTrans = om.MTransformationMatrix(inputworldMatrixAttr)

        # get reader2inputObj MVector in world space and normalized it
        selfWorldTransMVector = selfWorldMatrixMTrans.getTranslation(om.MSpace.kWorld)
        inputWorldTransMVector = inputworldMatrixMTrans.getTranslation(om.MSpace.kWorld)

        pose2InputobjectMVector = inputWorldTransMVector - selfWorldTransMVector

        vec1Normal = pose2InputobjectMVector.normal()

        # get poseReader local Z Axis in world space and normalized it
        poseReaderNodeZAxisWorldMVector = om.MVector(0.0, 0.0, 1.0) * selfWorldMatrixAttr

        vec2Normal = poseReaderNodeZAxisWorldMVector.normal()

        # use the dot product to get the angle between the vector in Euler
        dotProduct = vec1Normal * vec2Normal

        angleInEuler = math.acos(dotProduct) / math.pi * 180

        # output value between 0 to 1
        outputRange = angleInEuler / (coneAngleAttr / 2.0)

        outputValue = 1 - max(min(outputRange, 1), 0)

        outputDH = dataBlock.outputValue(poseReaderNode.output)
        outputDH.setFloat(outputValue)

        dataBlock.setClean(plug)

    def draw(self, view, path, style, status):
        # get the input and output value
        thisNode = self.thisMObject()
        outputValue = om.MPlug(thisNode, poseReaderNode.output).asFloat()

        # reference:
        # Sphere coordinate: http://mathinsight.org/spherical_coordinates
        rhoValue = om.MPlug(thisNode, poseReaderNode.rho).asFloat()
        phiValue = om.MPlug(thisNode, poseReaderNode.coneAngle).asFloat()
        phiValue = (phiValue / 2.0) / 180 * math.pi
        segmentsValue = om.MPlug(thisNode, poseReaderNode.segments).asInt()

        view.beginGL()
        glFuncTable.glPushAttrib(omrd.MGL_CURRENT_BIT)
        glFuncTable.glEnable(omrd.MGL_BLEND)
        glFuncTable.glBlendFunc(omrd.MGL_SRC_ALPHA, omrd.MGL_ONE_MINUS_SRC_ALPHA)

        if status == view.kActive:
            glFuncTable.glColor4f(0.8 * (1 - outputValue), 0.8 * outputValue, 0.0, 0.8)
        elif status == view.kLead:
            glFuncTable.glColor4f(0.8 * (1 - outputValue), 0.8 * outputValue, 0.0, 0.8)
        elif status == view.kDormant:
            glFuncTable.glColor4f(0.8 * (1 - outputValue), 0.8 * outputValue, 0.0, 0.8)

        # Draw Shape
        glFuncTable.glBegin(omrd.MGL_TRIANGLE_FAN)

        for i in range(segmentsValue):

            perSeg = (2 * math.pi) / segmentsValue
            thetaValue1 = i * perSeg

            x1 = rhoValue * math.sin(phiValue) * math.cos(thetaValue1)
            y1 = rhoValue * math.sin(phiValue) * math.sin(thetaValue1)
            z1 = rhoValue * math.cos(phiValue)

            if i == segmentsValue - 1:
                thetaValue2 = 0 * perSeg
            else:
                thetaValue2 = (i + 1) * perSeg

            x2 = rhoValue * math.sin(phiValue) * math.cos(thetaValue2)
            y2 = rhoValue * math.sin(phiValue) * math.sin(thetaValue2)
            z2 = rhoValue * math.cos(phiValue)

            # draw each triangle
            glFuncTable.glVertex3f(0.0, 0.0, 0.0)

            glFuncTable.glVertex3f(x1, y1, z1)

            glFuncTable.glVertex3f(x2, y2, z2)

        # Disable blend shape
        glFuncTable.glDisable(omrd.MGL_BLEND)
        # Restore the state
        glFuncTable.glPopAttrib()
        # draw end
        glFuncTable.glEnd()

        # draw Text
        view.setDrawColor(om.MColor(1.0, 1.0, 1.0, 1.0))
        view.drawText('Output: %s' % outputValue, om.MPoint(0, 0, 0), view.kLeft)


def nodeCreator():
    return ompx.asMPxPtr(poseReaderNode())


def nodeInitializer():
    MFnNumericAttr = om.MFnNumericAttribute()

    # create attribute
    poseReaderNode.coneAngle = MFnNumericAttr.create('coneAngle', 'coneAngle', om.MFnNumericData.kFloat, 60.0)
    MFnNumericAttr.setMin(0.0)
    MFnNumericAttr.setMax(360.0)
    MFnNumericAttr.setWritable(1)
    MFnNumericAttr.setKeyable(1)
    poseReaderNode.addAttribute(poseReaderNode.coneAngle)

    poseReaderNode.rho = MFnNumericAttr.create('Rho', 'Rho', om.MFnNumericData.kFloat, 3.0)
    MFnNumericAttr.setMin(0.5)
    MFnNumericAttr.setWritable(1)
    MFnNumericAttr.setKeyable(1)
    poseReaderNode.addAttribute(poseReaderNode.rho)

    poseReaderNode.segments = MFnNumericAttr.create('segments', 'segs', om.MFnNumericData.kInt, 6)
    MFnNumericAttr.setMin(6)
    MFnNumericAttr.setWritable(1)
    MFnNumericAttr.setKeyable(1)
    poseReaderNode.addAttribute(poseReaderNode.segments)

    # input world matrix
    MFnMatrixAttr = om.MFnMatrixAttribute()
    poseReaderNode.inputWorldMatrix = MFnMatrixAttr.create('inputWorldMatrix', 'inputWorldMatrix',
                                                           om.MFnMatrixAttribute.kDouble)
    MFnMatrixAttr.setKeyable(1)
    MFnMatrixAttr.setStorable(1)
    MFnMatrixAttr.setReadable(0)
    MFnMatrixAttr.setWritable(1)
    poseReaderNode.addAttribute(poseReaderNode.inputWorldMatrix)

    poseReaderNode.selfWorldMatrix = MFnMatrixAttr.create('selfWorldMatrix', 'selfWorldMatrix',
                                                          om.MFnMatrixAttribute.kDouble)
    MFnMatrixAttr.setKeyable(1)
    MFnMatrixAttr.setStorable(1)
    MFnMatrixAttr.setReadable(0)
    MFnMatrixAttr.setWritable(1)
    poseReaderNode.addAttribute(poseReaderNode.selfWorldMatrix)


    # output
    poseReaderNode.output = MFnNumericAttr.create('outputRange', 'output', om.MFnNumericData.kFloat, 0.0)
    MFnNumericAttr.setWritable(0)
    MFnNumericAttr.setReadable(1)
    poseReaderNode.addAttribute(poseReaderNode.output)

    # attribute affects
    poseReaderNode.attributeAffects(poseReaderNode.rho, poseReaderNode.output)
    poseReaderNode.attributeAffects(poseReaderNode.coneAngle, poseReaderNode.output)
    poseReaderNode.attributeAffects(poseReaderNode.segments, poseReaderNode.output)
    poseReaderNode.attributeAffects(poseReaderNode.inputWorldMatrix, poseReaderNode.output)
    poseReaderNode.attributeAffects(poseReaderNode.selfWorldMatrix, poseReaderNode.output)


# 3. initialize Plugin
def initializePlugin(mObj):
    # Because mayaCore has already prepared a handle(named mObj here, which is in form of MObject)
    # for the Pointer above, define a plugin function set and pass the handle to it.
    mplugin = ompx.MFnPlugin(mObj)
    try:
        mplugin.registerNode(nodeName, nodeID, nodeCreator, nodeInitializer, ompx.MPxNode.kLocatorNode)
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
