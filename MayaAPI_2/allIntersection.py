import maya.api.OpenMaya as om2
import maya.OpenMaya as om
import maya.OpenMayaMPx as ompx

nodeName = 'RayTracer'
nodeID = om.MTypeId(0X100fff)


class MeshIntersectionNode(ompx.MPxNode):
    # Class Attrs
    # INPUT
    Loc_1_Pos = om.MObject()
    Loc_2_Pos = om.MObject()

    meshWorldMatrix = om.MObject()

    def __init__(self):
        ompx.MPxNode.__init__(self)

    def compute(self, plug, dataBlock):
        pass


def nodeCreator():
    return ompx.asMPxPtr(MeshIntersectionNode())


def nodeInitializer():
    MFnNumericAttr = om.MFnNumericAttribute()
    MFnMatrixAttr = om.MFnMatrixAttribute()

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

    MeshIntersectionNode.meshWorldMatrix = MFnMatrixAttr.create('WorldMatrix', 'WorldMat')
    MFnMatrixAttr.setWritable(1)
    MFnMatrixAttr.setKeyable(1)
    MeshIntersectionNode.addAttribute(MeshIntersectionNode.meshWorldMatrix)

    # output





