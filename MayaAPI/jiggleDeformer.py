import maya.OpenMaya as om
import maya.OpenMayaMPx as ompx
import maya.cmds as cmds

nodeName = 'JiggleDeformer'
nodeID = om.MTypeId(0xBEEF6)


class JiggleDeformerNode(ompx.MPxDeformerNode):
    dampingVal = om.MObject()
    stiffVal = om.MObject()
    goalPos = om.MObject()
    jiggleAmountVal = om.MObject()

    time = om.MObject()

    def __init__(self):
        ompx.MPxDeformerNode.__init__(self)
        self.currentPosition = om.MPoint()
        self.previousPosition = om.MPoint()

        self.initializeFlag = False

        self.previousTime = om.MTime()

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
        dataHandleDamping = dataBlock.inputValue(JiggleDeformerNode.dampingVal)
        damping = dataHandleDamping.asFloat()

        # stiffness
        dataHandleStiff = dataBlock.inputValue(JiggleDeformerNode.stiffVal)
        stiff = dataHandleStiff.asFloat()

        # time
        dataHandleTime = dataBlock.inputValue(JiggleDeformerNode.time)
        currentTime = dataHandleTime.asTime()

        # jiggle amount
        dataHandlejiggleAmount = dataBlock.inputValue(JiggleDeformerNode.jiggleAmountVal)
        jiggleAmount = dataHandlejiggleAmount.asFloat()

        # goal position
        goal = om.MPoint(dataBlock.inputValue(JiggleDeformerNode.goalPos).asFloatVector())

        # MFnMesh
        inputMFnMesh = om.MFnMesh(inputMesh)

        # test initialize flag
        if not self.initializeFlag:
            self.currentPosition = goal
            self.previousPosition = goal

            self.previousTime = currentTime

            self.initializeFlag = True

        timeDiff = currentTime.value() - self.previousTime.value()
        if timeDiff > 1.0 or timeDiff < 0.0:
            self.initializeFlag = False
            self.previousTime = currentTime
            dataBlock.setClean()
            return

        outputPosMPointArray = om.MPointArray()

        while not geoIterator.isDone():
            pointPosition_Local = geoIterator.position()
            pointPosition_World = pointPosition_Local * local2WorldMatrix

            velocity = (self.currentPosition - self.previousPosition) * (1.0 - damping)
            newPos = self.currentPosition + velocity
            goalVector = (goal - newPos) * stiff
            newPos = newPos + goalVector

            # store value for next computing
            self.previousPosition = om.MPoint(self.currentPosition)
            self.currentPosition = om.MPoint(newPos)
            self.previousTime = om.MTime(currentTime)

            newPos = goal + ((newPos - goal) * jiggleAmount)

            # put the output in the local space
            newPos = newPos * local2WorldMatrix.inverse()

            weight = self.weightValue(dataBlock, geoIndex, geoIterator.index())

            newPos = newPos * weight * envelope

            # vertex position
            outputPosMPointArray.append(newPos)

            geoIterator.next()

        geoIterator.setAllPositions(outputPosMPointArray)


def deformerCreator():
    return ompx.asMPxPtr(JiggleDeformerNode())


def nodeInitializer():
    MFnNumericAttr = om.MFnNumericAttribute()
    MFnUnitAttr = om.MFnUnitAttribute()

    # Create Attributes
    # damping
    JiggleDeformerNode.dampingVal = MFnNumericAttr.create('damping', 'damp', om.MFnNumericData.kFloat, 0.0)
    MFnNumericAttr.setKeyable(1)
    MFnNumericAttr.setMin(0.0)
    MFnNumericAttr.setMax(1.0)

    # stiffness
    JiggleDeformerNode.stiffVal = MFnNumericAttr.create('stiffness', 'stiff', om.MFnNumericData.kFloat, 0.0)
    MFnNumericAttr.setKeyable(1)
    MFnNumericAttr.setMin(0.0)
    MFnNumericAttr.setMax(1.0)

    # jiggle amount
    JiggleDeformerNode.jiggleAmountVal = MFnNumericAttr.create('jiggle', 'jig', om.MFnNumericData.kFloat, 0.0)
    MFnNumericAttr.setKeyable(1)
    MFnNumericAttr.setMin(0.0)
    MFnNumericAttr.setMax(1.0)

    # time
    JiggleDeformerNode.time = MFnUnitAttr.create('time', 'time', om.MFnUnitAttribute.kTime, 0.0)
    MFnUnitAttr.setWritable(1)
    MFnUnitAttr.setKeyable(1)

    # goalPosition
    JiggleDeformerNode.goalPos = MFnNumericAttr.createPoint('goalPostion', 'goal')
    MFnNumericAttr.setKeyable(1)
    MFnNumericAttr.setWritable(1)
    MFnNumericAttr.setWritable(1)

    # outputGeom
    outputGeom = ompx.cvar.MPxGeometryFilter_outputGeom

    # Attach Attributes
    JiggleDeformerNode.addAttribute(JiggleDeformerNode.dampingVal)
    JiggleDeformerNode.addAttribute(JiggleDeformerNode.stiffVal)
    JiggleDeformerNode.addAttribute(JiggleDeformerNode.jiggleAmountVal)
    JiggleDeformerNode.addAttribute(JiggleDeformerNode.time)
    JiggleDeformerNode.addAttribute(JiggleDeformerNode.goalPos)

    # Design Circuitry
    JiggleDeformerNode.attributeAffects(JiggleDeformerNode.dampingVal, outputGeom)
    JiggleDeformerNode.attributeAffects(JiggleDeformerNode.stiffVal, outputGeom)
    JiggleDeformerNode.attributeAffects(JiggleDeformerNode.time, outputGeom)
    JiggleDeformerNode.attributeAffects(JiggleDeformerNode.goalPos, outputGeom)


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



