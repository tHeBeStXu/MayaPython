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

    maxVelocity = om.MObject()

    scale = om.MObject()

    directionBias = om.MObject()

    # make ture to connect 'time1.outTime' to 'CustomJiggleDeformer#.time' for stable simulation.
    time = om.MObject()

    def __init__(self):
        ompx.MPxDeformerNode.__init__(self)

        self.curPosDict = dict()
        self.prePosDict = dict()

        self.initialFlagDict = dict()

        self.dirtyMapDict = dict()

        self.preTimeDict = dict()

        self.weightMapDict = dict()
        self.jiggleMapDict = dict()
        self.stiffMapDict = dict()
        self.dampMapDict = dict()

        self.membershipDict = dict()

    def deform(self, dataBlock, geoIterator, local2WorldMatrix, geomIndex):

        inputAttr = ompx.cvar.MPxGeometryFilter_input

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

        # scale
        dataHandleScale = dataBlock.inputValue(JiggleDeformerNode.scale)
        scale = dataHandleScale.asFloat()

        # max velocity
        dataHandleVelocity = dataBlock.inputValue(JiggleDeformerNode.maxVelocity)
        maxVelocity = dataHandleVelocity.asFloat() * scale

        # direction bias
        dataHandleDirection = dataBlock.inputValue(JiggleDeformerNode.directionBias)
        directionBias = dataHandleDirection.asFloat()

        # points' positions in local space
        points = om.MPointArray()
        geoIterator.allPositions(points)

        # INITIALIZE ATTRIBUTES
        if geomIndex not in self.initialFlagDict.keys():
            self.initialFlagDict[geomIndex] = False

        if geomIndex not in self.dirtyMapDict.keys():
            self.dirtyMapDict[geomIndex] = False

        if geomIndex not in self.preTimeDict.keys():
            self.preTimeDict[geomIndex] = om.MTime()

        if geomIndex not in self.curPosDict.keys():
            self.curPosDict[geomIndex] = om.MPointArray()

        if geomIndex not in self.prePosDict.keys():
            self.prePosDict[geomIndex] = om.MPointArray()

        if geomIndex not in self.membershipDict.keys():
            self.membershipDict[geomIndex] = om.MIntArray()

        # Get normalsDict

        normals = om.MFloatVectorArray()
        if directionBias != 0.0:

            inputMesh = self.getInputMesh(dataBlock, geomIndex, inputAttr)

            MFnMesh = om.MFnMesh(inputMesh)

            MFnMesh.getVertexNormals(False, normals)

        # test initialize flag for the first time
        if not self.initialFlagDict[geomIndex]:
            self.preTimeDict[geomIndex] = currentTime

            self.curPosDict[geomIndex].setLength(geoIterator.count())
            self.prePosDict[geomIndex].setLength(geoIterator.count())

            for i in range(points.length()):
                self.curPosDict[geomIndex].set(points[i] * local2WorldMatrix, i)
                self.prePosDict[geomIndex].set(self.curPosDict[geomIndex][i], i)

            self.initialFlagDict[geomIndex] = True

            self.dirtyMapDict[geomIndex] = True

        # for stable simulation, check the time difference whether it is 1 frame or not
        timeDiff = currentTime.value() - self.preTimeDict[geomIndex].value()

        if timeDiff > 1.0 or timeDiff < 0.0:
            self.initialFlagDict[geomIndex] = False
            self.preTimeDict[geomIndex] = om.MTime(currentTime)
            return

        # perGeometry
        hGeo = dataBlock.inputArrayValue(JiggleDeformerNode.perGeo)

        self.jump2Element(hGeo, geomIndex)
        hGeo.jumpToElement(geomIndex)

        hPerGeo = hGeo.inputValue()

        hJiggleMap = om.MArrayDataHandle(hPerGeo.child(JiggleDeformerNode.jiggleMap))
        hStiffMap = om.MArrayDataHandle(hPerGeo.child(JiggleDeformerNode.stiffMap))
        hDampMap = om.MArrayDataHandle(hPerGeo.child(JiggleDeformerNode.dampMap))

        matrix = hPerGeo.child(JiggleDeformerNode.worldMatrix).asMatrix()

        if geomIndex not in self.weightMapDict.keys():
            self.weightMapDict[geomIndex] = om.MFloatArray()
            # self.weightMapDict[geomIndex].setLength(geoIterator.count())

        if geomIndex not in self.jiggleMapDict.keys():
            self.jiggleMapDict[geomIndex] = om.MFloatArray()
            # self.jiggleMapDict[geomIndex].setLength(geoIterator.count())

        if geomIndex not in self.stiffMapDict.keys():
            self.stiffMapDict[geomIndex] = om.MFloatArray()
            # self.stiffMapDict[geomIndex].setLength(geoIterator.count())

        if geomIndex not in self.dampMapDict.keys():
            self.dampMapDict[geomIndex] = om.MFloatArray()
            # self.dampMapDict[geomIndex].setLength(geoIterator.count())

        if self.dirtyMapDict[geomIndex] or geoIterator.count() != self.membershipDict[geomIndex].length():
            self.weightMapDict[geomIndex].setLength(geoIterator.count())
            self.jiggleMapDict[geomIndex].setLength(geoIterator.count())
            self.stiffMapDict[geomIndex].setLength(geoIterator.count())
            self.dampMapDict[geomIndex].setLength(geoIterator.count())
            self.membershipDict[geomIndex].setLength(geoIterator.count())

            # loop through the geoIterator.count() (i.e. mesh geometry) for getting the jiggleMap Value.
            ii = 0
            geoIterator.reset()
            while not geoIterator.isDone():
                index = geoIterator.index()

                # JIGGLE MAP
                self.jump2Element(hJiggleMap, index)
                hJiggleMap.jumpToElement(index)
                self.jiggleMapDict[geomIndex].set(hJiggleMap.inputValue().asFloat(), ii)

                # STIFF MAP
                self.jump2Element(hStiffMap, index)
                hStiffMap.jumpToElement(index)
                self.stiffMapDict[geomIndex].set(hStiffMap.inputValue().asFloat(), ii)

                # DAMP MAP
                self.jump2Element(hDampMap, index)
                hDampMap.jumpToElement(index)
                self.dampMapDict[geomIndex].set(hDampMap.inputValue().asFloat(), ii)

                # WEIGHT MAP
                self.weightMapDict[geomIndex].set(self.weightValue(dataBlock, geomIndex, geoIterator.index()), ii)

                # MEMBERSHIP
                self.membershipDict[geomIndex].set(geoIterator.index(), ii)

                ii += 1
                geoIterator.next()

            self.dirtyMapDict[geomIndex] = False

        #######################
        # CALCULATE POSITIONS #
        #######################

        i = 0
        geoIterator.reset()
        while not geoIterator.isDone():
            goal = points[i] * local2WorldMatrix

            damping = dampMagnitude * self.dampMapDict[geomIndex][i]
            stiff = stiffMagnitude * self.stiffMapDict[geomIndex][i]

            # velocity
            velocity = (self.curPosDict[geomIndex][i] - self.prePosDict[geomIndex][i]) * (1.0 - damping)
            newPos = self.curPosDict[geomIndex][i] + velocity

            goalForce = (goal - newPos) * stiff

            newPos = newPos + goalForce

            # clamp to the MAX velocity
            displacement = newPos - goal
            if displacement.length() > maxVelocity:
                displacement = displacement.normal() * maxVelocity
                newPos = goal + displacement

            # direction bias
            membership = self.membershipDict[geomIndex][i]

            displacement = om.MFloatVector(displacement)
            if directionBias > 0.0:
                normalDot = displacement.normal() * normals[membership]

                if normalDot < 0.0:
                    newPos += displacement * ((displacement * normals[membership]) * directionBias)

            elif directionBias < 0.0:
                normalDot = displacement.normal() * normals[membership]

                if normalDot > 0.0:
                    newPos += displacement * ((displacement * normals[membership]) * directionBias)

            # store for next time computing
            self.prePosDict[geomIndex].set(self.curPosDict[geomIndex][i], i)
            self.curPosDict[geomIndex].set(newPos, i)

            # multi with weight map and envelope
            newPosLoc = newPos * local2WorldMatrix.inverse()
            jiggle = self.jiggleMapDict[geomIndex][i]
            weight = self.weightMapDict[geomIndex][i]

            points.set((points[i] + (newPosLoc - points[i]) * weight * envelopeValue * jiggle), i)

            self.preTimeDict[geomIndex] = om.MTime(currentTime)

            i = i + 1
            geoIterator.next()

        # set positions
        geoIterator.setAllPositions(points)

    def jump2Element(self, arrayHandle, index):

        # if not arrayHandle.jumpToElement(index):
        if index not in xrange(arrayHandle.elementCount()):

            builder = arrayHandle.builder()

            builder.addElement(index)

            arrayHandle.set(builder)

    def setDependentsDirty(self, plug, plugArray):
        if plug == self.jiggleMap or plug == self.stiffMap or plug == self.dampMap or plug == self.weights:
            geomIndex = 0
            if plug.isArray():
                geomIndex = plug.parent().logicalIndex()
            else:
                geomIndex = plug.array().parent().logicalIndex()
            self.dirtyMapDict[geomIndex] = True

    def getInputMesh(self, dataBlock, geomIndex, input):
        dataHandleInputArray = dataBlock.outputArrayValue(input)

        dataHandleInputArray.jumpToElement(geomIndex)

        dataHandleInputElement = dataHandleInputArray.outputValue()

        # inputMesh
        inputGeom = ompx.cvar.MPxGeometryFilter_inputGeom
        dataHandleInputGeom = dataHandleInputElement.child(inputGeom)
        inputMesh = dataHandleInputGeom.asMesh()

        return inputMesh


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

    # max velocity
    JiggleDeformerNode.maxVelocity = MFnNumericAttr.create('maxVelocity', 'maxVelocity', om.MFnNumericData.kFloat, 1.0)
    MFnNumericAttr.setKeyable(1)
    MFnNumericAttr.setMin(0.0)

    # scale
    JiggleDeformerNode.scale = MFnNumericAttr.create('scale', 'scale', om.MFnNumericData.kFloat, 1.0)
    MFnNumericAttr.setKeyable(1)

    # direction bias
    JiggleDeformerNode.directionBias = MFnNumericAttr.create('directionBias', 'directionBias', om.MFnNumericData.kFloat, 0.0)
    MFnNumericAttr.setKeyable(1)
    MFnNumericAttr.setMin(-1.0)
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
    JiggleDeformerNode.addAttribute(JiggleDeformerNode.maxVelocity)
    JiggleDeformerNode.addAttribute(JiggleDeformerNode.scale)
    JiggleDeformerNode.addAttribute(JiggleDeformerNode.directionBias)

    # Design Circuitry
    JiggleDeformerNode.attributeAffects(JiggleDeformerNode.dampingVal, outputGeom)
    JiggleDeformerNode.attributeAffects(JiggleDeformerNode.stiffVal, outputGeom)
    JiggleDeformerNode.attributeAffects(JiggleDeformerNode.time, outputGeom)
    JiggleDeformerNode.attributeAffects(JiggleDeformerNode.worldMatrix, outputGeom)
    JiggleDeformerNode.attributeAffects(JiggleDeformerNode.jiggleMap, outputGeom)
    JiggleDeformerNode.attributeAffects(JiggleDeformerNode.stiffMap, outputGeom)
    JiggleDeformerNode.attributeAffects(JiggleDeformerNode.dampMap, outputGeom)
    JiggleDeformerNode.attributeAffects(JiggleDeformerNode.maxVelocity, outputGeom)
    JiggleDeformerNode.attributeAffects(JiggleDeformerNode.scale, outputGeom)
    JiggleDeformerNode.attributeAffects(JiggleDeformerNode.directionBias, outputGeom)


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
