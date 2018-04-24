"""
Deformer:
"""
import sys
import maya.OpenMaya as openmaya
import maya.OpenMayaMPx as openmayampx

nodeName = "Ripple"
nodeID = openmaya.MTypeId(0x102fff)

class Ripple(openmayampx.MPxDeformerNode):
    """
    Commands  ---->  MPxCommand
    Custom  ------>  MPxNode
    Deformer ----->  MPxDeformerNode
    """
    mObj_Amplitude = openmaya.MObject()
    mObj_Displace = openmaya.MObject()

    def __init__(self):
        super(Ripple, self).__init__()


def deformerCreator():
    nodePtr = openmayampx.asMPxPtr(Ripple())
    return nodePtr

def nodeInitializer():
    """
    1. Create Attributes
    2. Attach Attributes
    3. Design Circuitry
    :return: None
    """
    mFnAttr = openmaya.MFnNumericAttribute()
    Ripple.mObj_Amplitude = mFnAttr.create("AttributeValue", "AttrVal", openmaya.MFnNumericData.kFloat, 0.0)
    mFnAttr.setKeyable(1)
    mFnAttr.setMin(0.0)
    mFnAttr.setMax(1.0)

    Ripple.mObj_Displace = mFnAttr.create("DisplaceValue", "DispVal", openmaya.MFnNumericData.kFloat, 0.0)
    mFnAttr.setKeyable(1)
    mFnAttr.setMin(0.0)
    mFnAttr.setMax(10.0)

    Ripple.addAttribute(Ripple.mObj_Amplitude)
    Ripple.addAttribute(Ripple.mObj_Displace)

    """
    SWIG - Simplified Wrapper Interface Generator
    """

    outputGeom = openmayampx.cvar.MPxDeformerNode_outputGeom
    Ripple.attributeAffects(Ripple.mObj_Amplitude, outputGeom)
    Ripple.attributeAffects(Ripple.mObj_Displace, outputGeom)




# 3. initialize Plugin
def initializePlugin(mObj):
    # Because mayaCore has already prepared a handle(named mObj here, which is in form of MObject)
    # for the Pointer above, define a plugin function set and pass the handle to it.
    mplugin = openmayampx.MFnPlugin(mObj, "Yixiong Xu", "1.0")
    try:

        mplugin.registerNode(nodeName, nodeID, deformerCreator, nodeInitializer, openmayampx.MPxNode.kDeformerNode)
    except:
        sys.stderr.write("Failed to register command: " + nodeName)


# 4. unitialize Plugin
def uninitializePlugin(mObj):
    mplugin = openmayampx.MFnPlugin(mObj)
    try:
        # For de-registering command, we just need the nodeName and the Pointer is already in Maya Core
        mplugin.deregisterCommand(nodeName)
    except:
        sys.stderr.write("Failed to de-register command: " + nodeName)

