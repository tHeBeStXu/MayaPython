import maya.OpenMaya as openmaya
import maya.OpenMayaMPx as openmayampx
import maya.OpenMayaRender as openmayarender
import maya.OpenMayaUI as openmayaui
import math
import sys


kPluginNodeTypeName = "foot"
footPrintNodeId = openmaya.MTypeId(0x87010)
glRenderer = openmayarender.MHardwareRenderer.theRenderer()
glFuncTable = glRenderer.glFunctionTable()

sole = ([0.00, 0.0, -0.70],
        [0.04, 0.0, -0.69],
        [0.09, 0.0, -0.65],
        [0.13, 0.0, -0.61],
        [0.16, 0.0, -0.54],
        [0.17, 0.0, -0.46],
        [0.17, 0.0, -0.35],
        [0.16, 0.0, -0.25],
        [0.15, 0.0, -0.14],
        [0.13, 0.0, 0.00],
        [0.00, 0.0, 0.00],
        [-0.13, 0.0, 0.00],
        [-0.15, 0.0, -0.14],
        [-0.16, 0.0, -0.25],
        [-0.17, 0.0, -0.35],
        [-0.17, 0.0, -0.46],
        [-0.16, 0.0, -0.54],
        [-0.13, 0.0, -0.61],
        [-0.09, 0.0, -0.65],
        [-0.04, 0.0, -0.69],
        [-0.00, 0.0, -0.70])

class footPrintNode(openmayampx.MPxLocatorNode):
    size = openmaya.MObject()

    def __init__(self):
        super(footPrintNode, self).__init__()

    def compute(self, plug, dataBlock):
        return openmaya.kUnknownParameter

    def draw(self, view, path, style, status):
        thisNode = self.thisMObject()

        plug = openmaya.MPlug(thisNode, self.size)

        sizeVal = plug.asMDistance()

        multiplier = sizeVal.asCentimeters()

        view.beginGL()

        if style == openmayaui.M3dView.kFlatShaded or style==openmayaui.M3dView.kGouraudShaded:
            glFuncTable.glPushAttrib(openmayarender.MGL_CURRENT_BIT)

            if status ==openmayaui.M3dView.kActive:
                view.setDrawColor(13, openmayaui.M3dView.kActiveColors)
            else:
                view.setDrawColor(13, openmayaui.M3dView.kDormantColors)

            last = len(sole)-1

            glFuncTable.glBegin(openmayarender.MGL_TRIANGLE_FAN)

            for i in range(last):
                glFuncTable.glVertex3f(sole[i][0] * multiplier, sole[i][1] * multiplier, sole[i][2] * multiplier)

            glFuncTable.glEnd()
            glFuncTable.glPopAttrib()

        glFuncTable.glBegin(openmayarender.MGL_LINES)

        last = len(sole) - 1
        for i in range(last):
            glFuncTable.glVertex3f(sole[i][0] * multiplier, sole[i][1] * multiplier, sole[i][2] * multiplier)
            glFuncTable.glVertex3f(sole[i+1][0] * multiplier, sole[i+1][1] * multiplier, sole[i+2][2] * multiplier)

        glFuncTable.glEnd()
        view.endGL()

    def isBounded(self):
        return True

    def boundingBox(self):
        thisNode = self.thisMObject()
        plug = openmaya.MPlug(thisNode, self.size)

        sizeVal = plug.asMDistance()

        multiplier = sizeVal.asCentimeters()

        corner1 = openmaya.MPoint(-0.17, 0.0, -0.7)
        corner2 = openmaya.MPoint(0.17, 0.0, 0.3)

        corner1 *= multiplier
        corner2 *= multiplier

        boundedBox = openmaya.MBoundingBox(corner1, corner2)
        return boundedBox


def nodeCreator():
    return openmayampx.asMPxPtr(footPrintNode())

def nodeInitializer():
    unitFn = openmaya.MFnUnitAttribute()
    footPrintNode.size = unitFn.create("size", "in", openmaya.MFnUnitAttribute.kDistance)

    unitFn.setDefault(1.0)

    footPrintNode.addAttribute(footPrintNode.size)

def initializePlugin(mobject):

    mplugin = openmayampx.MFnPlugin(mobject)

    try:
        mplugin.registerNode(kPluginNodeTypeName, footPrintNodeId, nodeCreator, nodeInitializer, openmayampx.MPxNode.kLocatorNode)
    except:
        sys.stderr.write("Failed to register node: %s" % kPluginNodeTypeName)
        raise

def uninitializePlugin(mobject):
    mplugin = openmayampx.MFnPlugin(mobject)
    try:
        mplugin.deregisterNode(footPrintNodeId)
    except:
        sys.stderr.write("Failed to deregister node: &s" % kPluginNodeTypeName)
        raise

