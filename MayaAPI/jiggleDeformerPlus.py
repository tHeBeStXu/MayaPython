import maya.OpenMaya as om
import maya.OpenMayaMPx as ompx
import maya.cmds as cmds

nodeName = 'CustomJiggleDeformer'
nodeID = om.MTypeId(0xBEEF6)


class JiggleDeformerNode(ompx.MPxDeformerNode):
    # input
    dampingVal = om.MObject()
    stiffVal = om.MObject()
    goalPos = om.MObject()

    jiggleMap = om.MObject()
    stiffMap = om.MObject()
    dampMap = om.MObject()

    perGeo = om.MObject()

    worldMatrix = om.MObject()

    # make ture to connect 'time1.outTime' to 'CustomJiggleDeformer#.time' for stable simulation.
    time = om.MObject()

    def __init__(self):
        ompx.MPxDeformerNode.__init__(self)

        self.curPosDict = dict()
        self.prePosDict = dict()

        self.initialFlagDict = dict()

        self.preTimeDict = dict()

        self.weightMapDict = dict()
        self.jiggleMapDict = dict()
        self.stiffMapDict = dict()
        self.dampMapDict = dict()

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
        dampMagnitude = dataHandleDamping.asFloat()

        # stiffness
        dataHandleStiff = dataBlock.inputValue(JiggleDeformerNode.stiffVal)
        stiffMagnitude = dataHandleStiff.asFloat()

        # time
        dataHandleTime = dataBlock.inputValue(JiggleDeformerNode.time)
        currentTime = dataHandleTime.asTime()

        # points' positions in local space
        points = om.MPointArray()
        geoIterator.allPositions(points)

        # test initialize flag for the first time
        self.initialFlagDict[str(geoIndex)] = False
        self.preTimeDict[str(geoIndex)] = om.MTime()

        if not self.initialFlagDict[str(geoIndex)]:
            self.preTimeDict[str(geoIndex)] = currentTime

            self.curPosDict[str(geoIndex)] = om.MPointArray()
            self.prePosDict[str(geoIndex)] = om.MPointArray()

            self.curPosDict[str(geoIndex)].setLength(geoIterator.count())
            self.prePosDict[str(geoIndex)].setLength(geoIterator.count())

            for i in range(points.length()):
                self.curPosDict[str(geoIndex)].set(points[i] * local2WorldMatrix, i)
                self.prePosDict[str(geoIndex)].set(self.curPosDict[str(geoIndex)][i], i)

            self.preTimeDict[str(geoIndex)] = currentTime

            self.initialFlagDict[str(geoIndex)] = True

        # for stable simulation, check the time difference whether it is 1 frame or not
        timeDiff = currentTime.value() - self.preTimeDict[str(geoIndex)].value()

        if timeDiff > 1.0 or timeDiff < 0.0:
            self.initialFlagDict[str(geoIndex)] = False
            self.preTimeDict[str(geoIndex)] = om.MTime(currentTime)
            return

        # perGeometry
        hGeo = dataBlock.inputArrayValue(JiggleDeformerNode.perGeo)

        self.jump2Element(hGeo, geoIndex)
        hGeo.jumpToElement(geoIndex)

        hPerGeo = hGeo.inputValue()

        hJiggleMap = om.MArrayDataHandle(hPerGeo.child(JiggleDeformerNode.jiggleMap))
        hStiffMap = om.MArrayDataHandle(hPerGeo.child(JiggleDeformerNode.stiffMap))
        hDampMap = om.MArrayDataHandle(hPerGeo.child(JiggleDeformerNode.dampMap))

        matrix = hPerGeo.child(JiggleDeformerNode.worldMatrix).asMatrix()

        self.weightMapDict[str(geoIndex)] = om.MFloatArray()
        self.jiggleMapDict[str(geoIndex)] = om.MFloatArray()
        self.stiffMapDict[str(geoIndex)] = om.MFloatArray()
        self.dampMapDict[str(geoIndex)] = om.MFloatArray()

        self.weightMapDict[str(geoIndex)].setLength(geoIterator.count())
        self.jiggleMapDict[str(geoIndex)].setLength(geoIterator.count())
        self.stiffMapDict[str(geoIndex)].setLength(geoIterator.count())
        self.dampMapDict[str(geoIndex)].setLength(geoIterator.count())

        # loop through the geoIterator.count() (i.e. mesh geometry) for getting the jiggleMap Value.
        ii = 0
        # geoIterator.reset()
        while not geoIterator.isDone():
            index = geoIterator.index()

            self.jump2Element(hJiggleMap, index)
            hJiggleMap.jumpToElement(index)
            self.jiggleMapDict[str(geoIndex)].set(hJiggleMap.inputValue().asFloat(), ii)

            self.jump2Element(hStiffMap, index)
            hStiffMap.jumpToElement(index)
            self.stiffMapDict[str(geoIndex)].set(hStiffMap.inputValue().asFloat(), ii)

            self.jump2Element(hDampMap, index)
            hDampMap.jumpToElement(index)
            self.dampMapDict[str(geoIndex)].set(hDampMap.inputValue().asFloat(), ii)

            self.weightMapDict[str(geoIndex)].set(self.weightValue(dataBlock, geoIndex, geoIterator.index()), ii)

            ii += 1
            geoIterator.next()

        # calculate positions
        for i in range(points.length()):
            goal = points[i] * local2WorldMatrix

            damping = dampMagnitude * self.dampMapDict[str(geoIndex)][i]
            stiff = stiffMagnitude * self.stiffMapDict[str(geoIndex)][i]

            # velocity
            velocity = (self.curPosDict[str(geoIndex)][i] - self.prePosDict[str(geoIndex)][i]) * (1.0 - damping)
            newPos = self.curPosDict[str(geoIndex)][i] + velocity

            goalForce = (goal - newPos) * stiff

            newPos += goalForce

            # store for next time computing
            self.prePosDict[str(geoIndex)].set(self.curPosDict[str(geoIndex)][i], i)
            self.curPosDict[str(geoIndex)].set(newPos, i)

            # multi with weight map and envelope
            points.set(points[i] + ((newPos * local2WorldMatrix.inverse()) - points[i]) * self.weightMapDict[str(geoIndex)][i] * envelopeValue * self.jiggleMapDict[str(geoIndex)][i], i)

        self.preTimeDict[str(geoIndex)] = om.MTime(currentTime)

        # set positions
        geoIterator.setAllPositions(points)

    def jump2Element(self, arrayHandle, index):

        # if not arrayHandle.jumpToElement(index):
        if index not in xrange(arrayHandle.elementCount()):

            builder = arrayHandle.builder()

            builder.addElement(index)

            arrayHandle.set(builder)


def deformerCreator():
    return ompx.asMPxPtr(JiggleDeformerNode())


def nodeInitializer():
    MFnNumericAttr = om.MFnNumericAttribute()
    MFnUnitAttr = om.MFnUnitAttribute()
    MFnMatrixAttr = om.MFnMatrixAttribute()
    MFnCompoundAttr = om.MFnCompoundAttribute()

    # Create Attributes
    # damping
    JiggleDeformerNode.dampingVal = MFnNumericAttr.create('damping', 'damping', om.MFnNumericData.kFloat, 0.05)
    MFnNumericAttr.setKeyable(1)
    MFnNumericAttr.setMin(0.0)
    MFnNumericAttr.setMax(1.0)

    # stiffness
    JiggleDeformerNode.stiffVal = MFnNumericAttr.create('stiffness', 'stiffness', om.MFnNumericData.kFloat, 0.05)
    MFnNumericAttr.setKeyable(1)
    MFnNumericAttr.setMin(0.0)
    MFnNumericAttr.setMax(1.0)

    # time
    JiggleDeformerNode.time = MFnUnitAttr.create('time', 'time', om.MFnUnitAttribute.kTime, 0.0)
    MFnUnitAttr.setWritable(1)
    MFnUnitAttr.setKeyable(1)

    # world Matrix for trigger the deform when user is dragging the geometry
    # it is useless for the basic algorithm
    JiggleDeformerNode.worldMatrix = MFnMatrixAttr.create('worldMatrix', 'worldMat')

    # jiggle map
    JiggleDeformerNode.jiggleMap = MFnNumericAttr.create('jiggleMap', 'jiggleMap', om.MFnNumericData.kFloat, 0.3)
    MFnNumericAttr.setMin(0.0)
    MFnNumericAttr.setMax(1.0)
    MFnNumericAttr.setArray(True)
    MFnNumericAttr.setUsesArrayDataBuilder(True)

    JiggleDeformerNode.stiffMap = MFnNumericAttr.create('stiffMap', 'stiffMap', om.MFnNumericData.kFloat, 0.3)
    MFnNumericAttr.setMin(0.0)
    MFnNumericAttr.setMax(1.0)
    MFnNumericAttr.setArray(True)
    MFnNumericAttr.setUsesArrayDataBuilder(True)

    JiggleDeformerNode.dampMap = MFnNumericAttr.create('dampMap', 'dampMap', om.MFnNumericData.kFloat, 0.3)
    MFnNumericAttr.setMin(0.0)
    MFnNumericAttr.setMax(1.0)
    MFnNumericAttr.setArray(True)
    MFnNumericAttr.setUsesArrayDataBuilder(True)

    # perGeometry
    JiggleDeformerNode.perGeo = MFnCompoundAttr.create('perGeometry', 'perGeo')
    MFnCompoundAttr.setArray(True)
    MFnCompoundAttr.addChild(JiggleDeformerNode.worldMatrix)
    MFnCompoundAttr.addChild(JiggleDeformerNode.jiggleMap)
    MFnCompoundAttr.addChild(JiggleDeformerNode.stiffMap)
    MFnCompoundAttr.addChild(JiggleDeformerNode.dampMap)
    MFnCompoundAttr.setUsesArrayDataBuilder(True)

    # outputGeom
    outputGeom = ompx.cvar.MPxGeometryFilter_outputGeom

    # Attach Attributes
    JiggleDeformerNode.addAttribute(JiggleDeformerNode.dampingVal)
    JiggleDeformerNode.addAttribute(JiggleDeformerNode.stiffVal)
    JiggleDeformerNode.addAttribute(JiggleDeformerNode.time)
    # JiggleDeformerNode.addAttribute(JiggleDeformerNode.worldMatrix)
    JiggleDeformerNode.addAttribute(JiggleDeformerNode.perGeo)

    # Design Circuitry
    JiggleDeformerNode.attributeAffects(JiggleDeformerNode.dampingVal, outputGeom)
    JiggleDeformerNode.attributeAffects(JiggleDeformerNode.stiffVal, outputGeom)
    JiggleDeformerNode.attributeAffects(JiggleDeformerNode.time, outputGeom)
    JiggleDeformerNode.attributeAffects(JiggleDeformerNode.worldMatrix, outputGeom)
    JiggleDeformerNode.attributeAffects(JiggleDeformerNode.jiggleMap, outputGeom)
    JiggleDeformerNode.attributeAffects(JiggleDeformerNode.stiffMap, outputGeom)
    JiggleDeformerNode.attributeAffects(JiggleDeformerNode.dampMap, outputGeom)


def initializePlugin(MObj):
    MPlugin = ompx.MFnPlugin(MObj, 'Yixiong Xu', '1.0')

    try:
        MPlugin.registerNode(nodeName, nodeID, deformerCreator, nodeInitializer, ompx.MPxNode.kDeformerNode)
        # paint default weights
        cmds.makePaintable(nodeName, 'weights', at='multiFloat', sm='deformer')
        cmds.makePaintable(nodeName, 'jiggleMap', at='multiFloat', sm='deformer')
        cmds.makePaintable(nodeName, 'stiffMap', at='multiFloat', sm='deformer')
        cmds.makePaintable(nodeName, 'dampMap', at='multiFloat', sm='deformer')

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
