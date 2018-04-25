"""
Deformer: Custom Ripple Deformer
Usage:  1. Load the Plug-in with maya.cmds.loadPlugin(r"X:\THE\PATH\TO\THE\FILE\API_6.py")
        2. Select a polygon mesh in the scene;
        3. Run: maya.cmds.deformer(type="Ripple") in python command

For some global variable differences between different MAYA API versions, we can check the link below:
https://knowledge.autodesk.com/search-result/caas/CloudHelp/cloudhelp/2016/ENU/Maya-SDK/files/GUID-10CE99A6-2C32-49E1-85ED-2E2F6782CF23-htm.html

if MAYA API 1.0 version < 201600 (i.e. MAYA 2016 Before):
    OpenMayaMPx.cvar.MPxDeformerNode_input
    OpenMayaMPx.cvar.MPxDeformerNode_inputGeom
    OpenMayaMPx.cvar.MPxDeformerNode_outputGeom
    OpenMayaMPx.cvar.MPxDeformerNode_envelope
else:
    OpenMayaMPx.cvar.MPxGeometryFilter_input
    OpenMayaMPx.cvar.MPxGeometryFilter_inputGeom
    OpenMayaMPx.cvar.MPxGeometryFilter_outputGeom
    OpenMayaMPx.cvar.MPxGeometryFilter_envelope
"""
import sys

import math
import maya.OpenMaya as openmaya
import maya.OpenMayaMPx as openmayampx

nodeName = "Ripple"
nodeID = openmaya.MTypeId(0x102fff)


class Ripple(openmayampx.MPxDeformerNode):
    """
    Commands  ---->  MPxCommand
    Custom Node -->  MPxNode
    Deformer ----->  MPxDeformerNode
    """
    mObj_Amplitude = openmaya.MObject()
    mObj_Displace = openmaya.MObject()

    def __init__(self):
        super(Ripple, self).__init__()
        # openmayampx.MPxDeformerNode.__init__(self)

    def deform(self, dataBlock, geoIterator, matrix, geometryIndex):

        # 0. Grab the input Attribute come with the deformer node
        # input = openmayampx.cvar.MPxDeformerNode_input
        input = openmayampx.cvar.MPxGeometryFilter_input

        # 1. Attach a handle to input Array Attribute
        dataHandleInputArray = dataBlock.outputArrayValue(input)

        # 2. Jump to particular element in array
        dataHandleInputArray.jumpToElement(geometryIndex)

        # 3. Attach a handle to specific data block
        dataHandleInputElement = dataHandleInputArray.outputValue()

        # 4. Reach to the child - inputGeom
        # inputGeom = openmayampx.cvar.MPxDeformerNode_inputGeom
        inputGeom = openmayampx.cvar.MPxGeometryFilter_inputGeom
        dataHandleInputGeom = dataHandleInputElement.child(inputGeom)
        inMesh = dataHandleInputGeom.asMesh()

        # Envelope
        # envelope = openmayampx.cvar.MPxDeformerNode_envelope
        envelope = openmayampx.cvar.MPxGeometryFilter_envelope
        dataHandleEnvolope = dataBlock.inputValue(envelope)
        envelopeValue = dataHandleEnvolope.asFloat()

        # Amplitude
        dataHandleAmplitude = dataBlock.inputValue(Ripple.mObj_Amplitude)
        amplitudeValue = dataHandleAmplitude.asFloat()

        # Displace
        dataHandleDisplace = dataBlock.inputValue(Ripple.mObj_Displace)
        disPlaceValue = dataHandleDisplace.asFloat()

        mFloatVectorArray_normal = openmaya.MFloatVectorArray()
        mFnMesh = openmaya.MFnMesh(inMesh)
        mFnMesh.getVertexNormals(False, mFloatVectorArray_normal, openmaya.MSpace.kObject)


        mPointArray_meshVert = openmaya.MPointArray()
        while (not geoIterator.isDone()):
            pointPosition = geoIterator.position()
            pointPosition.x = pointPosition.x + math.sin(geoIterator.index() + disPlaceValue) * amplitudeValue * mFloatVectorArray_normal[geoIterator.index()].x * envelopeValue
            pointPosition.y = pointPosition.y + math.sin(geoIterator.index() + disPlaceValue) * amplitudeValue * mFloatVectorArray_normal[geoIterator.index()].y * envelopeValue
            pointPosition.z = pointPosition.z + math.sin(geoIterator.index() + disPlaceValue) * amplitudeValue * mFloatVectorArray_normal[geoIterator.index()].z * envelopeValue

            #geoIterator.setPosition(pointPosition)
            mPointArray_meshVert.append(pointPosition)

            geoIterator.next()

        geoIterator.setAllPosition(mPointArray_meshVert)


# 1. Creator()
def deformerCreator():
    nodePtr = openmayampx.asMPxPtr(Ripple())
    return nodePtr


# 2. Initialize()
def nodeInitializer():
    """
    1. Create Attributes
    2. Attach Attributes
    3. Design Circuitry
    :return: None
    """
    # 1. Create Attributes
    mFnAttr = openmaya.MFnNumericAttribute()
    Ripple.mObj_Amplitude = mFnAttr.create("AmplitudeValue", "AmpliVal", openmaya.MFnNumericData.kFloat, 0.0)
    mFnAttr.setKeyable(1)
    mFnAttr.setMin(0.0)
    mFnAttr.setMax(1.0)

    Ripple.mObj_Displace = mFnAttr.create("DisplaceValue", "DispVal", openmaya.MFnNumericData.kFloat, 0.0)
    mFnAttr.setKeyable(1)
    mFnAttr.setMin(0.0)
    mFnAttr.setMax(10.0)

    # 2. Attach Attributes
    Ripple.addAttribute(Ripple.mObj_Amplitude)
    Ripple.addAttribute(Ripple.mObj_Displace)

    """
    SWIG - Simplified Wrapper Interface Generator
    """
    # outputGeom = openmayampx.cvar.MPxDeformerNode_outputGeom
    outputGeom = openmayampx.cvar.MPxGeometryFilter_outputGeom

    # 3. Design Circuitry
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
        sys.stderr.write("Failed to register command: %s .\n" % nodeName)


# 4. unitialize Plugin
def uninitializePlugin(mObj):
    mplugin = openmayampx.MFnPlugin(mObj)
    try:
        # For de-registering Node, we just need the NodeId and the Pointer is already in Maya Core
        mplugin.deregisterNode(nodeID)
    except:
        sys.stderr.write("Failed to de-register command: %s .\n" % nodeName)

