import maya.OpenMaya as om
import maya.OpenMayaMPx as ompx
import maya.cmds as cmds

nodeName = 'CustomJiggleDeformer'
nodeID = om.MTypeId(0xBEEF6)


class JiggleDeformerNode(ompx.MPxDeformerNode):
    dampingVal = om.MObject()
    stiffVal = om.MObject()
    goalPos = om.MObject()
    jiggleAmountVal = om.MObject()

    worldMatrix = om.MObject()

    time = om.MObject()

    def __init__(self):
        ompx.MPxDeformerNode.__init__(self)

        self.currentPositions = om.MPointArray()
        self.previousPositions = om.MPointArray()

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

        # MFnMesh
        inputMFnMesh = om.MFnMesh(inputMesh)

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

        # points' positions
        points = om.MPointArray()
        geoIterator.allPositions(points)

        # test initialize flag
        if not self.initializeFlag:
            self.currentPositions.setLength(geoIterator.count())
            self.previousPositions.setLength(geoIterator.count())

            for i in range(points.length()):
                self.currentPositions.set(points[i] * local2WorldMatrix, i)
                self.previousPositions.set(self.currentPositions[i], i)

            self.previousTime = currentTime

            self.initializeFlag = True

        # check the time difference whether it is 1 frame or not
        timeDiff = currentTime.value() - self.previousTime.value()

        if timeDiff > 1.0 or timeDiff < 0.0:
            self.initializeFlag = False
            self.previousTime = currentTime
            # dataBlock.setClean()
            return

        while not geoIterator.isDone():
            goal = points[geoIterator.index()] * local2WorldMatrix

            velocity = (self.currentPositions[geoIterator.index()] - self.previousPositions[geoIterator.index()]) * (1.0 - damping)
            newPos = self.currentPositions[geoIterator.index()] + velocity
            goalVector = (goal - newPos) * stiff
            newPos += goalVector

            # store value for next computing
            self.previousPositions.set(self.currentPositions[geoIterator.index()], geoIterator.index())
            self.currentPositions.set(newPos, geoIterator.index())
            self.previousTime = om.MTime(currentTime)

            # weight and envelope
            weight = self.weightValue(dataBlock, geoIndex, geoIterator.index())

            points.set(points[geoIterator.index()] + ((newPos * local2WorldMatrix.inverse()) - points[geoIterator.index()]) * weight * envelopeValue * jiggleAmount, geoIterator.index())

            geoIterator.next()

        geoIterator.setAllPositions(points)


def deformerCreator():
    return ompx.asMPxPtr(JiggleDeformerNode())


def nodeInitializer():
    MFnNumericAttr = om.MFnNumericAttribute()
    MFnUnitAttr = om.MFnUnitAttribute()
    MFnMatrixAttr = om.MFnMatrixAttribute()

    # Create Attributes
    # damping
    JiggleDeformerNode.dampingVal = MFnNumericAttr.create('damping', 'damp', om.MFnNumericData.kFloat, 0.1)
    MFnNumericAttr.setKeyable(1)
    MFnNumericAttr.setMin(0.0)
    MFnNumericAttr.setMax(1.0)

    # stiffness
    JiggleDeformerNode.stiffVal = MFnNumericAttr.create('stiffness', 'stiff', om.MFnNumericData.kFloat, 0.1)
    MFnNumericAttr.setKeyable(1)
    MFnNumericAttr.setMin(0.0)
    MFnNumericAttr.setMax(1.0)

    # jiggle amount
    JiggleDeformerNode.jiggleAmountVal = MFnNumericAttr.create('jiggle', 'jig', om.MFnNumericData.kFloat, 1)
    MFnNumericAttr.setKeyable(1)
    MFnNumericAttr.setMin(0.0)
    MFnNumericAttr.setMax(1.0)

    # time
    JiggleDeformerNode.time = MFnUnitAttr.create('time', 'time', om.MFnUnitAttribute.kTime, 0.0)
    MFnUnitAttr.setWritable(1)
    MFnUnitAttr.setKeyable(1)

    # world Matrix for trigger the deorm
    JiggleDeformerNode.worldMatrix = MFnMatrixAttr.create('worldMatrix', 'worldMat')

    # outputGeom
    outputGeom = ompx.cvar.MPxGeometryFilter_outputGeom

    # Attach Attributes
    JiggleDeformerNode.addAttribute(JiggleDeformerNode.dampingVal)
    JiggleDeformerNode.addAttribute(JiggleDeformerNode.stiffVal)
    JiggleDeformerNode.addAttribute(JiggleDeformerNode.jiggleAmountVal)
    JiggleDeformerNode.addAttribute(JiggleDeformerNode.time)
    JiggleDeformerNode.addAttribute(JiggleDeformerNode.worldMatrix)

    # Design Circuitry
    JiggleDeformerNode.attributeAffects(JiggleDeformerNode.dampingVal, outputGeom)
    JiggleDeformerNode.attributeAffects(JiggleDeformerNode.stiffVal, outputGeom)
    JiggleDeformerNode.attributeAffects(JiggleDeformerNode.time, outputGeom)
    JiggleDeformerNode.attributeAffects(JiggleDeformerNode.worldMatrix, outputGeom)


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
