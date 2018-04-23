"""
Dirty Propagation :
Push & Pull Mechanism: Sceen Mechanism. First from Input_Side to the Destination_Side, Push by the Dirty Propagation.
                       Then, from the Destination_Side to Input_Side, Pull by the Updation Request
Lazy Evaluation : maya does evaluation(compute()) action in Dependency node unless updating the Updation Request!
Updation Request : ViewPort change, attribute Editor, Channel Box, cmds.getAttr()
"""
"""
Basic command structure
"""
# OpenMayaMPx is MAYA Proxy API, which is used for users to define their own objects,
# such as commands, nodes and any other plugins

import maya.OpenMaya as openmaya
import maya.OpenMayaMPx as openmayampx
import sys

nodeName = 'WheelNode'
nodeID = openmaya.MTypeId(0x100fff)

class wheelNode(openmayampx.MPxNode):

    inRadius = openmaya.MObject()
    inTranslate = openmaya.MObject()
    outRotate = openmaya.MObject()

    def __init__(self):
        openmayampx.MPxNode.__init__(self)
        # super(wheelNode, self).__init__()

    def compute(self):
        pass


def nodeCreator():
    return openmayampx.asMPxPtr(wheelNode())


def nodeInitializer():
    # 1. creating a function set for numeric attributes
    mFnAttr = openmaya.MFnNumericAttribute()

    # 2. create the attributes
    wheelNode.inRadius = mFnAttr.create('radius', 'r', openmaya.MFnNumericData.kFloat, 0.0)

    mFnAttr.setReadable(1)
    mFnAttr.setWritable(1)
    mFnAttr.setStorable(1)
    mFnAttr.setKeyable(1)

    wheelNode.inTranslate = mFnAttr.create('translate', 't', openmaya.MFnNumericData.kFloat, 0.0)

    mFnAttr.setReadable(1)
    mFnAttr.setWritable(1)
    mFnAttr.setStorable(1)
    mFnAttr.setKeyable(1)

    wheelNode.outRotate = mFnAttr.create('rotate', 'rot', openmaya.MFnNumericData.kFloat)

    mFnAttr.setReadable(1)
    mFnAttr.setWritable(0)
    mFnAttr.setStorable(0)
    mFnAttr.setKeyable(0)

    # 3. attach attributes to the node:
    wheelNode.addAttributes(wheelNode.inRadius)
    wheelNode.addAttributes(wheelNode.inTranslate)
    wheelNode.addAttributes(wheelNode.outRotate)

    # 4. design circuitry
    wheelNode.attributeAffects(wheelNode.inRadius, wheelNode.outRotate)
    wheelNode.attributeAffects(wheelNode.inTranslate, wheelNode.outRotate)


def initializePlugin(mObj):
    # Because mayaCore has already prepared a handle(named mObj here, which is in form of MObject)
    # for the Pointer above, define a plugin function set and pass the handle to it.
    mplugin = openmayampx.MFnPlugin(mObj)
    try:
        # register the command by the nodeName and the Pointer(Pull the Pointer into the Maya Core)
        mplugin.registerNode(nodeName, nodeID, nodeCreator, nodeInitializer)
    except:
        sys.stderr.write("Failed to register command: " + nodeName)

# Be careful of with the FUNCTION NAME and the CAPITALS
def uninitializePlugin(mObj):
    mplugin = openmayampx.MFnPlugin(mObj)
    try:
        # For de-registering command, we just need the nodeName and the Pointer is already in Maya Core
        mplugin.deregisterCommand(nodeName)
    except:
        sys.stderr.write("Failed to de-register command: " + nodeName)

