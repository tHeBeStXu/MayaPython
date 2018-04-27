"""
Node:
Usage:  1. Load the Plug-in with maya.cmds.loadPlugin(r"X:\THE\PATH\TO\THE\FILE\API_7.py")
        2. Run:

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
glFT = glRender.glFunctionTable()




class locatorNode(openmayampx.MPxLocatorNode):
    def __init__(self):
        super(locatorNode, self).__init__()

    def compute(self, plug, dataBlock):
        return openmaya.kUnknownParameter

    def draw(self, view, dagPath, style, status):

        view.beginGL()
        # Push the current state
        glFT.glPushAttrib(openmayarender.MGL_CURRENT_BIT)
        # Enable Blend mode(to enable transparency)
        glFT.glEnable(openmayarender.MGL_BLEND)
        # Defined Blend function
        glFT.glBlendFunc(openmayarender.MGL_SRC_ALPHA, openmayarender.MGL_ONE_MINUS_SRC_ALPHA)

        if status == view.kActive:
            glFT.glColor4f(0.2, 0.5, 0.1, 0.3)
        elif status == view.kLead:
            glFT.glColor4f(0.5, 0.2, 0.1, 0.3)
        elif status == view.kDormant:
            glFT.glColor4f(0.1, 0.1, 0.1, 0.3)

        # Draw shape
        glFT.glBegin(openmayarender.MGL_POLYGON)
        glFT.glVertex3f()



        glFT.glEnd()
        # Disable blend shape
        glFT.glDisable(openmayarender.MGL_BLEND)
        # Restore the state
        glFT.glPopAttrib()

        view.endGL()









# 1. Creator Function step
def nodeCreator():
    return openmayampx.asMPxPtr(locatorNode())


# 2. Initialize step
def nodeInitializer():
    # 1. creating a functionSet for numeric attributes
    mFnAttr = openmaya.MFnNumericAttribute()

    # 2. create the attributes
    # 2.1 create the attributes, return MObject handle

    wheelNode.inRadius = mFnAttr.create('radius', 'r', openmaya.MFnNumericData.kFloat, 0.0)
    # 2.2 set the properties
    # readable -> source , output
    # writable -> destination, input
    # storable -> store with file
    # keyable -> can be key or not
    mFnAttr.setReadable(1)
    mFnAttr.setWritable(1)
    mFnAttr.setStorable(1)
    mFnAttr.setKeyable(1)

    # 3. attach attributes to the node:
    wheelNode.addAttribute(wheelNode.inRadius)
    wheelNode.addAttribute(wheelNode.inTranslate)
    wheelNode.addAttribute(wheelNode.outRotate)

    # 4. design circuitry
    wheelNode.attributeAffects(wheelNode.inRadius, wheelNode.outRotate)


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

