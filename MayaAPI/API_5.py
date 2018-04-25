"""
Node: custom Node for compute the rotation
Usage:  1. Load the Plug-in with maya.cmds.loadPlugin(r"X:\THE\PATH\TO\THE\FILE\API_5.py")
        2. Run: maya.cmds.createNode("wheelNode") in python command

Push & Pull Mechanism: Sceen Mechanism. First from Input_Side to the Destination_Side, Push by the Dirty Propagation.
                       Then, from the Destination_Side to Input_Side, Pull by the Updation Request
Lazy Evaluation : maya does evaluation(compute()) action in Dependency node unless updating the Updation Request!
Updation Request : ViewPort change, attribute Editor, Channel Box, cmds.getAttr()
Dependency Graph Node(DG Node): Any node of Dependency Graph that has ability to perform computation is DG Node,
                                it compose of Attributes(accessed by plug) and Data Block(accessed by Data Handle)
"""

# OpenMayaMPx is MAYA Proxy API, which is used for users to define their own objects,
# such as commands, nodes and any other plugins

import maya.OpenMaya as openmaya
import maya.OpenMayaMPx as openmayampx
import sys

nodeName = 'wheelNode'
nodeID = openmaya.MTypeId(0x100fff)


# 1. Creator Function step
def nodeCreator():
    return openmayampx.asMPxPtr(wheelNode())


class wheelNode(openmayampx.MPxNode):

    inRadius = openmaya.MObject()
    inTranslate = openmaya.MObject()
    outRotate = openmaya.MObject()

    def __init__(self):
        openmayampx.MPxNode.__init__(self)
        # super(wheelNode, self).__init__()

    # be careful about the name of the method, it must be "compute"
    def compute(self, plug, dataBlock):
        """
        rotate = translate / (2 * 3.14 * radius) * (-360)
        :param plug: a special handle to access the attributes
        :param dataBlock: holds all the data(inputs and outputs) for the nodes
        :return: None
        """
        if plug == wheelNode.outRotate:

            dataHandleRadius = dataBlock.inputValue(wheelNode.inRadius)
            dataHandleTranslate = dataBlock.inputValue(wheelNode.inTranslate)

            inRadiusVal = dataHandleRadius.asFloat()
            inTranslateVal = dataHandleTranslate.asFloat()

            outRotate = float(inTranslateVal) / float(2 * 3.14 * inRadiusVal) * (360)

            dataHandleRotate = dataBlock.outputValue(wheelNode.outRotate)

            dataHandleRotate.setFloat(outRotate)
            # this is important!~
            dataBlock.setClean(plug)

        else:
            return openmaya.kUnknownParameter()


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
    wheelNode.addAttribute(wheelNode.inRadius)
    wheelNode.addAttribute(wheelNode.inTranslate)
    wheelNode.addAttribute(wheelNode.outRotate)

    # 4. design circuitry
    wheelNode.attributeAffects(wheelNode.inRadius, wheelNode.outRotate)
    wheelNode.attributeAffects(wheelNode.inTranslate, wheelNode.outRotate)


# 3. initialize Plugin
def initializePlugin(mObj):
    # Because mayaCore has already prepared a handle(named mObj here, which is in form of MObject)
    # for the Pointer above, define a plugin function set and pass the handle to it.
    mplugin = openmayampx.MFnPlugin(mObj)
    try:

        mplugin.registerNode(nodeName, nodeID, nodeCreator, nodeInitializer, openmayampx.MPxNode.kDependNode)
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

