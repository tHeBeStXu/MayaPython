import maya.OpenMaya as om
import maya.OpenMayaMPx as ompx
import maya.OpenMayaAnim as omanim
import maya.cmds as cmds

nodeName = 'JiggleDeformer'
nodeID = om.MTypeId(0xBEEF6)


class JiggleDeformerNode(ompx.MPxDeformerNode):
    dampingAttr = om.MObject()
    stiffAttr = om.MObject()
    animTime = om.MObject()

    def __init__(self):
        ompx.MPxDeformerNode.__init__(self)

    def deform(self, dataBlock, geoIterator, local2WorldMatrix, geoIndex):

        input = ompx.cvar.MPxGeometryFilter_input

        dataHandleInputArray = dataBlock.outputArrayValue(input)

        dataHandleInputArray.jumpToElement(geoIndex)

        dataHandleInputElement = dataHandleInputArray.outputValue()

        # inputMesh
        inputGeom = ompx.cvar.MPxGeometryFilter_inputGeom
        dataHandleInputGeom = dataHandleInputElement.child(inputGeom)
        inputMesh = dataHandleInputGeom.asMesh()

        # Envelope
        envelope = ompx.cvar.MPxGeometryFilter_envelope
        dataHandleEnvolope = dataBlock.inputValue(envelope)
        envelopeValue = dataHandleEnvolope.asFloat()

        # damping
        dataHandleDamping = dataBlock.inputValue(JiggleDeformerNode.dampingAttr)
        dampingValue = dataHandleDamping.asFloat()

        # stiffness
        dataHandleStiff = dataBlock.inputValue(JiggleDeformerNode.stiffAttr)
        stiffValue = dataHandleStiff.asFloat()

        # MFnMesh
        inputMFnMesh = om.MFnMesh(inputMesh)

        # current time
        currentTime = omanim.MAnimControl.currentTime()


        while not geoIterator.isDone():
            pointPosition_Local = geoIterator.position()
            pointPosition_World = pointPosition_Local * local2WorldMatrix

            self.currentPosition = pointPosition_Local * local2WorldMatrix
            self.previousPosition = self.currentPosition


            #
            velocity = (self.currentPosition - self.previousPosition) * (1 - dampingValue)

            newPosition = self.currentPosition + velocity

            # goalForce = (goalPoint - newPosition) * stiffValue

            # newPosition = newPosition + goalForce


            weight = self.weightValue(dataBlock, geoIndex, geoIterator.index())



def deformerCreator():
    return ompx.asMPxPtr(JiggleDeformerNode())


def nodeInitializer():
    MFnNumericAttr = om.MFnNumericAttribute()
    MFnUnitAttr = om.MFnUnitAttribute()

    # input
    JiggleDeformerNode.dampingAttr = MFnNumericAttr.create('damping', 'damp', om.MFnNumericData.kFloat, 0.0)
    MFnNumericAttr.setKeyable(1)
    MFnNumericAttr.setMin(0.0)
    MFnNumericAttr.setMax(1.0)
    JiggleDeformerNode.addAttribute(JiggleDeformerNode.dampingAttr)

    JiggleDeformerNode.stiffAttr = MFnNumericAttr.create('stiffness', 'stiff', om.MFnNumericData.kFloat, 0.0)
    MFnNumericAttr.setKeyable(1)
    MFnNumericAttr.setMin(0.0)
    MFnNumericAttr.setMax(10.0)
    JiggleDeformerNode.addAttribute(JiggleDeformerNode.stiffAttr)

    JiggleDeformerNode.animTime = MFnUnitAttr.create('animTime', 'time', om.MFnUnitAttribute.kTime, 0.0)
    JiggleDeformerNode.addAttribute(JiggleDeformerNode.animTime)

    outputGeom = ompx.cvar.MPxGeometryFilter_outputGeom

    JiggleDeformerNode.attributeAffects(JiggleDeformerNode.dampingAttr, outputGeom)
    JiggleDeformerNode.attributeAffects(JiggleDeformerNode.stiffAttr, outputGeom)
    JiggleDeformerNode.attributeAffects(JiggleDeformerNode.animTime, outputGeom)


def initializePlugin(MObj):
    MPlugin = ompx.MFnPlugin(MObj, 'Yixiong Xu', '1.0')

    try:
        MPlugin.registerNode(nodeName, nodeID, deformerCreator, nodeInitializer, ompx.MPxNode.kDeformerNode)
        cmds.makePaintable(nodeName, 'jiggleWeights', at='multiFloat', sm='deformer')

    except:
        raise RuntimeError
        print 'Failed to register command: %s .\n' % nodeName


def uninitializePlugin(MObj):
    MPlugin = ompx.MFnPlugin(MObj)
    try:
        MPlugin.deregisterNode(nodeID)

    except:
        raise RuntimeError
        print 'Failed to de-register command: %s .\n' % nodeName



