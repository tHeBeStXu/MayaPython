"""
This script is the math application of the jiggling effect.
"""
import maya.OpenMaya as om
import maya.OpenMayaMPx as ompx

nodeName = 'JigglePoint'
nodeID = om.MTypeId(0x100fff)


class JigglePointNode(ompx.MPxNode):
    dampingVal = om.MObject()
    stiffVal = om.MObject()
    goalPos = om.MObject()
    timeVal = om.MObject()
    parentInverseMatrix = om.MObject()
    jiggleAmount = om.MObject()

    outputPoint = om.MObject()

    def __init__(self):
        ompx.MPxNode.__init__(self)

        self.currentPos = om.MPoint()
        self.previousPos = om.MPoint()

        # create initialize flag for the first time compute
        self.initializeFlag = False

        # previous time for checking time difference is 1 frame
        self.previousTime = om.MTime()

    def compute(self, plug, dataBlock):
        if plug != JigglePointNode.outputPoint:
            return om.kUnknownParameter
        # get input values
        damping = dataBlock.inputValue(JigglePointNode.dampingVal).asFloat()
        stiff = dataBlock.inputValue(JigglePointNode.stiffVal).asFloat()
        goal = om.MPoint(dataBlock.inputValue(JigglePointNode.goalPos).asFloatVector())
        currentTime = dataBlock.inputValue(JigglePointNode.timeVal).asTime()
        parentInvMat = dataBlock.inputValue(JigglePointNode.parentInverseMatrix).asMatrix()
        jiggleAmount = dataBlock.inputValue(JigglePointNode.jiggleAmount).asFloat()

        # test initialize flag
        if not self.initializeFlag:
            self.currentPos = goal
            self.previousPos = goal

            self.previousTime = currentTime

            self.initializeFlag = True

        # Check if the time step is just 1 frame since we want a stable simulation
        timeDiff = currentTime.value() - self.previousTime.value()
        if timeDiff > 1.0 or timeDiff < 0.0:
            self.initializeFlag = False
            self.previousTime = currentTime
            dataBlock.setClean(plug)
            return

        # Algorithm
        velocity = (self.currentPos - self.previousPos) * (1.0 - damping)
        # get P_n
        newPos = self.currentPos + velocity
        # get goal vector
        goalVector = (goal - newPos) * stiff

        newPos = newPos + goalVector

        # store value for next computing
        self.previousPos = om.MPoint(self.currentPos)
        self.currentPos = om.MPoint(newPos)
        self.previousTime = om.MTime(currentTime)

        newPos = goal + ((newPos - goal) * jiggleAmount)

        # put in the output local space
        newPos = newPos * parentInvMat

        outputPoint = dataBlock.outputValue(JigglePointNode.outputPoint)
        outputVector = om.MFloatVector(newPos.x, newPos.y, newPos.z)
        outputPoint.setMFloatVector(outputVector)
        outputPoint.setClean()
        dataBlock.setClean(plug)


def nodeCreator():
    return ompx.asMPxPtr(JigglePointNode())


def nodeInitializer():
    # create attribute
    MFnNumericAttr = om.MFnNumericAttribute()
    MFnUnitAttr = om.MFnUnitAttribute()
    MFnMatrixAttr = om.MFnMatrixAttribute()

    JigglePointNode.dampingVal = MFnNumericAttr.create('Damping', 'damp', om.MFnNumericData.kFloat, 0.5)
    MFnNumericAttr.setReadable(1)
    MFnNumericAttr.setWritable(1)
    MFnNumericAttr.setKeyable(1)
    MFnNumericAttr.setStorable(1)
    MFnNumericAttr.setMax(1.0)
    MFnNumericAttr.setMin(0.0)

    JigglePointNode.stiffVal = MFnNumericAttr.create('Stiffness', 'stiff', om.MFnNumericData.kFloat, 0.5)
    MFnNumericAttr.setReadable(1)
    MFnNumericAttr.setWritable(1)
    MFnNumericAttr.setKeyable(1)
    MFnNumericAttr.setStorable(1)
    MFnNumericAttr.setMax(1.0)
    MFnNumericAttr.setMin(0.0)

    JigglePointNode.outputPoint = MFnNumericAttr.createPoint('OutputPosition', 'outPos')
    MFnNumericAttr.setReadable(1)
    MFnNumericAttr.setWritable(0)
    MFnNumericAttr.setStorable(0)

    JigglePointNode.goalPos = MFnNumericAttr.createPoint('GoalPosition', 'goal')
    MFnNumericAttr.setKeyable(1)
    MFnNumericAttr.setWritable(1)
    MFnNumericAttr.setReadable(1)

    JigglePointNode.timeVal = MFnUnitAttr.create('Time', 'time', om.MFnUnitAttribute.kTime, 0.0)
    MFnUnitAttr.setKeyable(1)
    MFnUnitAttr.setWritable(1)

    JigglePointNode.parentInverseMatrix = MFnMatrixAttr.create('ParentInverseMatrix', 'parentInvMat')
    MFnMatrixAttr.setWritable(1)
    MFnMatrixAttr.setKeyable(1)

    JigglePointNode.jiggleAmount = MFnNumericAttr.create('JiggleAmount', 'jiggleAm', om.MFnNumericData.kFloat, 1.0)
    MFnNumericAttr.setReadable(1)
    MFnNumericAttr.setWritable(1)
    MFnNumericAttr.setKeyable(1)
    MFnNumericAttr.setStorable(1)
    MFnNumericAttr.setMax(1.0)
    MFnNumericAttr.setMin(0.0)

    # attach attribute
    JigglePointNode.addAttribute(JigglePointNode.dampingVal)
    JigglePointNode.addAttribute(JigglePointNode.stiffVal)
    JigglePointNode.addAttribute(JigglePointNode.outputPoint)
    JigglePointNode.addAttribute(JigglePointNode.goalPos)
    JigglePointNode.addAttribute(JigglePointNode.timeVal)
    JigglePointNode.addAttribute(JigglePointNode.parentInverseMatrix)
    JigglePointNode.addAttribute(JigglePointNode.jiggleAmount)

    # design circuitry
    JigglePointNode.attributeAffects(JigglePointNode.dampingVal, JigglePointNode.outputPoint)
    JigglePointNode.attributeAffects(JigglePointNode.stiffVal, JigglePointNode.outputPoint)
    JigglePointNode.attributeAffects(JigglePointNode.goalPos, JigglePointNode.outputPoint)
    JigglePointNode.attributeAffects(JigglePointNode.timeVal, JigglePointNode.outputPoint)
    JigglePointNode.attributeAffects(JigglePointNode.jiggleAmount, JigglePointNode.outputPoint)

# 3. initialize Plugin
def initializePlugin(MObj):
    # Because mayaCore has already prepared a handle(named MObj here, which is in form of MObject)
    # for the Pointer above, define a plugin function set and pass the handle to it.
    mplugin = ompx.MFnPlugin(MObj)
    try:

        mplugin.registerNode(nodeName, nodeID, nodeCreator, nodeInitializer, ompx.MPxNode.kDependNode)
    except:
        raise RuntimeError
        print 'Failed to register Node: %s' % nodeName


# 4. unitialize Plugin
def uninitializePlugin(mObj):
    mplugin = ompx.MFnPlugin(mObj)
    try:
        # For de-registering NODE, we just need the NodeID and the Pointer is already in Maya Core
        mplugin.deregisterNode(nodeID)
    except:
        raise RuntimeError
        print 'Failed to de-register node: %s' % nodeName
