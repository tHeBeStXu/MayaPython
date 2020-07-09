"""
Node:
Usage:  1. Load the Plug-in with maya.cmds.loadPlugin(r"X:\THE\PATH\TO\THE\FILE\API_7.py")
        2. Run: maya.cmds.createNode('LeftFoot')
"""

# OpenMayaMPx is MAYA Proxy API, which is used for users to define their own objects,
# such as commands, nodes and any other plugins

import maya.OpenMaya as openmaya
import maya.OpenMayaMPx as openmayampx
import maya.OpenMayaRender as openmayarender
import sys

nodeName = 'LeftFoot'
nodeID = openmaya.MTypeId(0x100fff)

glRender = openmayarender.MHardwareRenderer.theRenderer()
glFuncTable = glRender.glFunctionTable()


class locatorNode(openmayampx.MPxLocatorNode):

    def __init__(self):
        super(locatorNode, self).__init__()

    def compute(self, plug, dataBlock):
        return openmaya.kUnknownParameter

    def draw(self, view, path, style, status):

        view.beginGL()
        # Push the current state
        glFuncTable.glPushAttrib(openmayarender.MGL_CURRENT_BIT)
        # Enable Blend mode(to enable transparency)
        glFuncTable.glEnable(openmayarender.MGL_BLEND)
        # Defined Blend function
        glFuncTable.glBlendFunc(openmayarender.MGL_SRC_ALPHA, openmayarender.MGL_ONE_MINUS_SRC_ALPHA)

        if status == view.kActive:
            glFuncTable.glColor4f(0.0, 0.0, 1.0, 0.8)
        elif status == view.kLead:
            glFuncTable.glColor4f(1.0, 0.0, 0.0, 0.5)
        elif status == view.kDormant:
            glFuncTable.glColor4f(0.0, 1.0, 0.0, 0.5)

        # Draw Polygon shape
        glFuncTable.glBegin(openmayarender.MGL_POLYGON)
        glFuncTable.glVertex3f(-0.031, 0, -2.875)
        glFuncTable.glVertex3f(-0.939, 0.1, -2.370)
        glFuncTable.glVertex3f(-1.175, 0.2, -1.731)
        glFuncTable.glVertex3f(-0.603, 0.3, 1.060)
        glFuncTable.glVertex3f(0.473, 0.3, 1.026)
        glFuncTable.glVertex3f(0.977, 0.2, -1.731)
        glFuncTable.glVertex3f(0.809, 0.1, -2.337)
        glFuncTable.glVertex3f(0.035, 0, -2.807)

        glFuncTable.glEnd()
        # Disable blend shape
        glFuncTable.glDisable(openmayarender.MGL_BLEND)
        # Restore the state
        glFuncTable.glPopAttrib()

        view.endGL()

        view.setDrawColor(openmaya.MColor(1, 1, 1, 1.0))
        view.drawText("Left Foot", openmaya.MPoint(0, 0, 0), view.kLeft)


# 1. Creator Function step
def nodeCreator():
    return openmayampx.asMPxPtr(locatorNode())

# 2. Initialize step
def nodeInitializer():
    pass

# 3. initialize Plugin
def initializePlugin(mObj):
    # Because mayaCore has already prepared a handle(named mObj here, which is in form of MObject)
    # for the Pointer above, define a plugin function set and pass the handle to it.
    mplugin = openmayampx.MFnPlugin(mObj)
    try:

        mplugin.registerNode(nodeName, nodeID, nodeCreator, nodeInitializer, openmayampx.MPxNode.kLocatorNode)
    except:
        sys.stderr.write("Failed to register Node: " + nodeName)


# 4. unitialize Plugin
def uninitializePlugin(mObj):
    mplugin = openmayampx.MFnPlugin(mObj)
    try:
        # For de-registering NODE, we just need the NodeID and the Pointer is already in Maya Core
        mplugin.deregisterNode(nodeID)
    except:
        sys.stderr.write("Failed to de-register Node: " + nodeName)