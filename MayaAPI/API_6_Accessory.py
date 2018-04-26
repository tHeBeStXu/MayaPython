"""
Accessory Object/Node: It is a optional or additional node created with Deformer node, and it is required by deformer
                       node to drive the deformation. Properties: 1. it should help deformer to derive the deformation
                       2. When you delete the accessory object/node, the relative deformer node should delete as well.
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
from maya import cmds
import math
import maya.OpenMaya as openmaya
import maya.OpenMayaMPx as openmayampx

nodeName = "AccessoryDeformer"
nodeID = openmaya.MTypeId(0x102fff)


class Ripple(openmayampx.MPxDeformerNode):
    """
    Commands  ---->  MPxCommand
    Custom Node -->  MPxNode
    Deformer ----->  MPxDeformerNode
    """
    mObj_Amplitude = openmaya.MObject()
    mObj_Displace = openmaya.MObject()
    mObj_Matrix = openmaya.MObject()

    def __init__(self):
        super(Ripple, self).__init__()
        # openmayampx.MPxDeformerNode.__init__(self)

    def deform(self, dataBlock, geoIterator, matrix, geometryIndex):

        # 0. Grab the input Attribute come with the deformer node
        # input = openmayampx.cvar.MPxDeformerNode_input
        input = openmayampx.cvar.MPxGeometryFilter_input

        # 1. Attach a handle to input Array Attribute
        # Whenever using MDatablock.inputValue, it will check the Dependency Node plugs are clean or dirty.
        # If the plugs are dirty, it will starting evaluating the whole linked Dependency Graph.
        # The complete Dependency Graph will be evaluated, it will return the clean values.
        # Then it will start compute() i.e deform() method.
        # To prevent the re-computation of the mesh, we need to replace the inputArrayValue with outputArrayValue.
        dataHandleInputArray = dataBlock.outputArrayValue(input)

        # 2. Jump to particular element in array
        dataHandleInputArray.jumpToElement(geometryIndex)

        # 3. Attach a handle to specific data block
        # To prevent the re-computation of the mesh, we need to replace the inputValue with outputValue.
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

        # Matrix
        dataHandleMatrix = dataBlock.inputValue(Ripple.mObj_Matrix)
        matrixValue = dataHandleMatrix.asMatrix()

        # Read the transition from matrix
        mTransMatrix = openmaya.MTransformationMatrix(matrixValue)
        translationValue = mTransMatrix.getTranslation(openmaya.MSpace.kObject)


        mFloatVectorArray_normal = openmaya.MFloatVectorArray()
        mFnMesh = openmaya.MFnMesh(inMesh)
        mFnMesh.getVertexNormals(False, mFloatVectorArray_normal, openmaya.MSpace.kObject)

        # store the vertex positions of the mesh.
        mPointArray_meshVert = openmaya.MPointArray()

        while (not geoIterator.isDone()):
            pointPosition = geoIterator.position()

            # Read the weight value. weightValue(MDatablock, geometryIndex, vertexIndex)
            weight = self.weightValue(dataBlock, geometryIndex, geoIterator.index())

            pointPosition.x = pointPosition.x + math.sin(geoIterator.index() + disPlaceValue + translationValue[0]) * amplitudeValue * mFloatVectorArray_normal[geoIterator.index()].x * weight * envelopeValue
            pointPosition.y = pointPosition.y + math.sin(geoIterator.index() + disPlaceValue + translationValue[0]) * amplitudeValue * mFloatVectorArray_normal[geoIterator.index()].y * weight * envelopeValue
            pointPosition.z = pointPosition.z + math.sin(geoIterator.index() + disPlaceValue + translationValue[0]) * amplitudeValue * mFloatVectorArray_normal[geoIterator.index()].z * weight * envelopeValue

            #geoIterator.setPosition(pointPosition)
            mPointArray_meshVert.append(pointPosition)

            geoIterator.next()
        # Set all the Position at once.
        geoIterator.setAllPositions(mPointArray_meshVert)

    def accessoryNodeSetup(self, dagModifier):
        # 1. Create Accessory Object.
        mObj_Locator = dagModifier.createNode("locator")

        # 2. Establish Connection
        mFnDependLocator = openmaya.MFnDependencyNode(mObj_Locator)
        mPlugWorldMatrix = mFnDependLocator.findPlug("worldMatrix")
        mObj_WorldAttr = mPlugWorldMatrix.attribute()

        mStatusConnect = dagModifier.connect(mObj_Locator, mObj_WorldAttr, self.thisMObject(), Ripple.mObj_Matrix)

        return mStatusConnect

    def accessoryAttribute(self):
        return Ripple.mObj_Matrix

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

    # 1.1 Create Matrix Attribute
    mFnMatrixAttr = openmaya.MFnMatrixAttribute()
    Ripple.mObj_Matrix = mFnMatrixAttr.create("MatrixAttribute", "matter")
    mFnMatrixAttr.setStorable(0)
    mFnMatrixAttr.setConnectable(1)

    # 2. Attach Attributes
    Ripple.addAttribute(Ripple.mObj_Amplitude)
    Ripple.addAttribute(Ripple.mObj_Displace)

    # 2.1 Connect with Deformer Node
    Ripple.addAttribute(Ripple.mObj_Matrix)

    """
    SWIG - Simplified Wrapper Interface Generator
    """
    # outputGeom = openmayampx.cvar.MPxDeformerNode_outputGeom
    outputGeom = openmayampx.cvar.MPxGeometryFilter_outputGeom

    # 3. Design Circuitry
    Ripple.attributeAffects(Ripple.mObj_Amplitude, outputGeom)
    Ripple.attributeAffects(Ripple.mObj_Displace, outputGeom)

    Ripple.attributeAffects(Ripple.mObj_Matrix, outputGeom)

# 3. initialize Plugin
def initializePlugin(mObj):
    # Because mayaCore has already prepared a handle(named mObj here, which is in form of MObject)
    # for the Pointer above, define a plugin function set and pass the handle to it.
    mplugin = openmayampx.MFnPlugin(mObj, "Yixiong Xu", "1.0")
    try:
        mplugin.registerNode(nodeName, nodeID, deformerCreator, nodeInitializer, openmayampx.MPxNode.kDeformerNode)

        ''' This is to explicitly define that weights attribute of the deformer is paintable'''
        # openmaya.MGlobal.executeCommand("makePaintable -attrType \"multiFloat\" -sm deformer \"" + nodeName + "\" \"weights\";")
        cmds.makePaintable(nodeName, 'weights', at='multiFloat', sm='deformer')

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

