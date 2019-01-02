"""
http://fevsy.blogspot.com/2016/05/line-plane-intersection.html
"""

import maya.OpenMaya as om
import maya.OpenMayaMPx as ompx

nodeName = 'LinePlaneIntersect'
nodeID = om.MTypeId(0X100fff)


class LinePlaneIntersectNode(ompx.MPxNode):
    # Class Attrs
    # input
    locator1Point = om.MObject()
    locator2Point = om.MObject()

    meshWorldMatrix = om.MObject()

    # output
    locator3Point = om.MObject()

    def __init__(self):
        ompx.MPxNode.__init__(self)

    def compute(self, plug, dataBlock):
        if plug != LinePlaneIntersectNode.locator3Point:
            return om.kUnknownParameter

        locator1Vector = om.MVector(dataBlock.inputValue(LinePlaneIntersectNode.locator1Point).asFloatVector())
        locator2Vector = om.MVector(dataBlock.inputValue(LinePlaneIntersectNode.locator2Point).asFloatVector())

        locator1Vector = om.MVector(locator1Vector)
        locator2Vector = om.MVector(locator2Vector)

        meshWorldMatrix = dataBlock.inputValue(LinePlaneIntersectNode.meshWorldMatrix).asMatrix()

        planeNormal = om.MVector(meshWorldMatrix(1, 0),
                                 meshWorldMatrix(1, 1),
                                 meshWorldMatrix(1, 2)).normal()

        planePivotPoint = om.MVector(meshWorldMatrix(3, 0),
                                     meshWorldMatrix(3, 1),
                                     meshWorldMatrix(3, 2))

        # calculating
        """
        P_x = P_0 + (Normal * (P_2 - P_0) / Normal * (P_1 - P_0)) * (P_1 - P_0)
                                             Denominator
        """
        P_2MinusP_0 = planePivotPoint - locator1Vector
        P_1MinusP_0 = locator1Vector - locator2Vector
        denominator = planeNormal * P_1MinusP_0

        outputPoint = dataBlock.outputValue(LinePlaneIntersectNode.locator3Point)

        if denominator > 0:
            P_x = locator1Vector + (P_1MinusP_0 * ((planeNormal * P_2MinusP_0) / denominator))
        else:
            P_x = om.MVector(0.0, 0.0, 0.0)

        P_x = om.MFloatVector(P_x.x, P_x.y, P_x.z)

        outputPoint.setMFloatVector(P_x)

        dataBlock.setClean(plug)


def nodeCreator():
    return ompx.asMPxPtr(LinePlaneIntersectNode())


def nodeInitializer():
    MFnNumericAttr = om.MFnNumericAttribute()
    MFnMatrixAttr = om.MFnMatrixAttribute()

    # create attribute
    # input
    LinePlaneIntersectNode.locator1Point = MFnNumericAttr.createPoint('Locator1Position', 'Loc1Pos')
    MFnNumericAttr.setWritable(1)
    MFnNumericAttr.setKeyable(1)
    LinePlaneIntersectNode.addAttribute(LinePlaneIntersectNode.locator1Point)

    LinePlaneIntersectNode.locator2Point = MFnNumericAttr.createPoint('Locator2Position', 'Loc2Pos')
    MFnNumericAttr.setWritable(1)
    MFnNumericAttr.setKeyable(1)
    LinePlaneIntersectNode.addAttribute(LinePlaneIntersectNode.locator2Point)

    LinePlaneIntersectNode.meshWorldMatrix = MFnMatrixAttr.create('WorldMatrix', 'WorldMat')
    MFnMatrixAttr.setWritable(1)
    MFnMatrixAttr.setKeyable(1)
    LinePlaneIntersectNode.addAttribute(LinePlaneIntersectNode.meshWorldMatrix)

    # output
    LinePlaneIntersectNode.locator3Point = MFnNumericAttr.createPoint('OutLocatorPosition', 'OutLocPos')
    MFnNumericAttr.setWritable(0)
    MFnNumericAttr.setReadable(1)
    # MFnNumericAttr.setKeyable(1)
    LinePlaneIntersectNode.addAttribute(LinePlaneIntersectNode.locator3Point)

    # make influence
    LinePlaneIntersectNode.attributeAffects(LinePlaneIntersectNode.locator1Point, LinePlaneIntersectNode.locator3Point)
    LinePlaneIntersectNode.attributeAffects(LinePlaneIntersectNode.locator2Point, LinePlaneIntersectNode.locator3Point)
    LinePlaneIntersectNode.attributeAffects(LinePlaneIntersectNode.meshWorldMatrix, LinePlaneIntersectNode.locator3Point)


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
