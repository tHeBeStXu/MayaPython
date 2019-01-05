"""
Just a practice of Method: MFnMesh.closestIntersection(MFnMesh.allIntersection, MFnMesh.anyIntersection),
Be sure that you must to connect the worldMesh[0] to the inMesh. It will works well.
"""
import maya.OpenMaya as om
import maya.OpenMayaMPx as ompx

nodeName = 'SingleRayTracer'
nodeID = om.MTypeId(0X100fff)


class MeshIntersectionNode(ompx.MPxNode):
    # Class Attrs
    # INPUT
    Loc_1_Pos = om.MObject()
    Loc_2_Pos = om.MObject()

    inMesh = om.MObject()

    # OUTPUT
    Loc_3_Pos = om.MObject()

    def __init__(self):
        ompx.MPxNode.__init__(self)

    def compute(self, plug, dataBlock):
        if plug != MeshIntersectionNode.Loc_3_Pos:
            return om.kUnknownParameter

        locator1Vector = om.MVector(dataBlock.inputValue(MeshIntersectionNode.Loc_1_Pos).asFloatVector())
        locator2Vector = om.MVector(dataBlock.inputValue(MeshIntersectionNode.Loc_2_Pos).asFloatVector())
        inputMeshObj = dataBlock.inputValue(MeshIntersectionNode.inMesh).asMesh()

        direction = om.MFloatVector(locator2Vector - locator1Vector)

        sourcePoint = om.MFloatPoint(dataBlock.inputValue(MeshIntersectionNode.Loc_1_Pos).asFloatVector())

        inputMeshMFn = om.MFnMesh(inputMeshObj)

        hitPoints = om.MFloatPoint()

        tolerance = float(0.0)

        inputMeshMFn.closestIntersection(sourcePoint, direction, None, None, False, om.MSpace.kWorld,
                                            10000.0, False, None, hitPoints, None, None, None, None, None, tolerance)

        outputPoint = dataBlock.outputValue(MeshIntersectionNode.Loc_3_Pos)

        if hitPoints[0]:
            outputVector = om.MFloatVector(hitPoints.x, hitPoints.y, hitPoints.z)
        else:
            outputVector = om.MFloatVector(0.0, 0.0, 0.0)

        outputPoint.setMFloatVector(outputVector)

        dataBlock.setClean(plug)


def nodeCreator():
    return ompx.asMPxPtr(MeshIntersectionNode())


def nodeInitializer():
    MFnNumericAttr = om.MFnNumericAttribute()
    MFnMeshAttribute = om.MFnTypedAttribute()

    # create attribute
    # input
    MeshIntersectionNode.Loc_1_Pos = MFnNumericAttr.createPoint('Locator1Position', 'Loc1Pos')
    MFnNumericAttr.setWritable(1)
    MFnNumericAttr.setKeyable(1)
    MeshIntersectionNode.addAttribute(MeshIntersectionNode.Loc_1_Pos)

    MeshIntersectionNode.Loc_2_Pos = MFnNumericAttr.createPoint('Locator2Position', 'Loc2Pos')
    MFnNumericAttr.setWritable(1)
    MFnNumericAttr.setKeyable(1)
    MeshIntersectionNode.addAttribute(MeshIntersectionNode.Loc_2_Pos)

    MeshIntersectionNode.inMesh = MFnMeshAttribute.create('inMesh', 'im', om.MFnData.kMesh)
    MFnMeshAttribute.setWritable(1)
    MFnMeshAttribute.setKeyable(1)
    MeshIntersectionNode.addAttribute(MeshIntersectionNode.inMesh)

    # output
    MeshIntersectionNode.Loc_3_Pos = MFnNumericAttr.createPoint('Locator3Position', 'Loc3Pos')
    MFnNumericAttr.setWritable(0)
    MFnNumericAttr.setReadable(1)
    MeshIntersectionNode.addAttribute(MeshIntersectionNode.Loc_3_Pos)

    # make influence
    MeshIntersectionNode.attributeAffects(MeshIntersectionNode.Loc_1_Pos, MeshIntersectionNode.Loc_3_Pos)
    MeshIntersectionNode.attributeAffects(MeshIntersectionNode.Loc_2_Pos, MeshIntersectionNode.Loc_3_Pos)
    MeshIntersectionNode.attributeAffects(MeshIntersectionNode.inMesh, MeshIntersectionNode.Loc_3_Pos)


def initializePlugin(mObj):
    mPlugin = ompx.MFnPlugin(mObj, 'Yixiong Xu', '1.0')

    try:
        mPlugin.registerNode(nodeName, nodeID, nodeCreator, nodeInitializer)
    except:
        raise RuntimeError
        print 'Failed to register node.'


def uninitializePlugin(mObj):
    mPlugin = ompx.MFnPlugin(mObj)

    try:
        mPlugin.deregisterNode(nodeID)
    except:
        raise RuntimeError
        print 'Failed to deregister node.'
