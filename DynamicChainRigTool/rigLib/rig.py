import maya.cmds as cmds
from ..utils import name
from ..base import control
reload(name)
reload(control)


def createSplineIK(jointList, curve=None):
    """
    create Spline IK whether curve is given or not
    :param jointList: list(str), list of joint chain
    :param curve: str, curve name
    :return: list(str), IK_Handle = [ikh, effector, crv]
    """
    prefixName = name.removeSuffix(jointList[0])
    if not curve:
        # create IK Spline
        IK_Handle = cmds.ikHandle(n=prefixName + '_ikh', sj=jointList[0],
                                  ee=jointList[-1], sol='ikSplineSolver', ns=4, pcv=0)
        IK_Handle[-1] = cmds.rename(IK_Handle[-1], prefixName + '_Crv')

    else:
        # add jointList to exists curve
        IK_Handle = cmds.ikHandle(n=prefixName + '_ikh', sj=jointList[0], ee=jointList[-1],
                                  sol='ikSplineSolver', c=curve, ccv=0, roc=0, pcv=0, snc=1, ns=4)
        IK_Handle.append(curve)

    return IK_Handle


def createCtrlSystem(jointList, numCtrl, curve, upAxis='y'):
    """
    create
    :param jointList:
    :param numCtrl:
    :param curve:
    :param upAxis:
    :return:
    """
    cmds.select(cl=1)

    prefixName = name.removeSuffix(jointList[0])

    if upAxis in ['y', 'Y']:
        worldUpVector = (0, 1, 0)
    elif upAxis in ['z', 'Z']:
        worldUpVector = (0, 0, 1)

    eachADD = 1.0 / (len(range(numCtrl)) - 1)

    fkJntList = []

    for i in range(numCtrl):
        fkJnt = cmds.joint(n='FK_' + prefixName + '_' +str(i))

        cmds.delete(cmds.parentConstraint(jointList[0], fkJnt, mo=0))

        motionPath = cmds.pathAnimation(curve, fkJnt, n=fkJnt + '_motionPath', fractionMode=1, follow=1,
                                        followAxis='x', upAxis='y', worldUpType='Vector',
                                        worldUpVector=worldUpVector, inverseUp=0, inverseFront=0, bank=0)
        cmds.cutKey(motionPath + '.u', time=())
        cmds.setAttr(motionPath + '.uValue', eachADD * float(i))

        for attr in ['t', 'r']:
            for axis in ['x', 'y', 'z']:
                cmds.delete(fkJnt + '.%s%s' % (attr, axis), icn=1)

        cmds.delete(motionPath)

        cmds.select(cl=1)

        fkJntList.append(fkJnt)

    cmds.delete(cmds.parentConstraint(jointList[-1], fkJntList[-1], mo=0))

    fkJntList_rev = []

    for i in fkJntList:
        fkJntList_rev.append(i)

    fkJntList_rev.reverse()

    for i in xrange(len(fkJntList_rev)-1):
        cmds.delete(cmds.aimConstraint(fkJntList_rev[i], fkJntList_rev[i+1], mo=0, weight=1, aimVector=(1, 0, 0),
                                upVector=(0, 1, 0), worldUpType='vector', worldUpVector=worldUpVector))

    cmds.delete(cmds.orientConstraint(jointList[-1], fkJntList_rev[0], mo=0))

    for i in xrange(len(fkJntList_rev)-1):
        cmds.parent(fkJntList_rev[i], fkJntList_rev[i+1])

    for i in fkJntList:
        cmds.setAttr(i + '.drawStyle', 2)

    cmds.makeIdentity(fkJntList[0], apply=1)

    cmds.select(cl=1)

    # FK Ctrls and CtrlGrps

    FK_CtrlGrp_List = []
    FK_Ctrl_List = []

    for i in xrange(len(fkJntList)):
        FK_Ctrl = control.Control(prefix='FK_' + prefixName,
                                  rigPartName=str(i),
                                  scale=5,
                                  translateTo=fkJntList[i],
                                  rotateTo=fkJntList[i],
                                  shape='circle',
                                  lockChannels=['t', 's', 'v'])

        cmds.orientConstraint(FK_Ctrl.C, fkJntList[i], mo=0)

        FK_CtrlGrp_List.append(FK_Ctrl.Off)
        FK_Ctrl_List.append(FK_Ctrl.C)

        cmds.select(cl=1)

    for i in xrange(len(FK_Ctrl_List) - 1):
        cmds.parent(FK_CtrlGrp_List[i+1], FK_Ctrl_List[i])

    cmds.select(cl=1)


def assignHairSys2Crv(jointList, curve):

    prefixName = name.removeSuffix(jointList[0])
    # follicle
    follicleShape = cmds.createNode('follicle', n=prefixName + '_follicleShape')
    follicleTransNode = cmds.listRelatives(follicleShape, p=1, c=0, s=0)[0]
    follicleTransNode = cmds.rename(follicleTransNode, prefixName + '_follicleNode')
    cmds.select(cl=1)


def createHairSys(jointList, nucleus=None):
    prefixName = name.removeSuffix(jointList[0])

    nucleus = nucleus or createNucleus(jointList)
    # hair System
    hairShape = cmds.createNode('hairSystem', n=prefixName + '_hairSysShape')
    hairTransNode = cmds.listRelatives(hairShape, p=1, c=0, s=0)[0]
    hairTransNode = cmds.rename(hairTransNode, prefixName + '_hairSysNode')
    cmds.select(cl=1)

    # connectAttr
    cmds.connectAttr('time1.outTime', hairShape + '.currentTime', f=1)
    index = cmds.getAttr(nucleus + '.inputActive', size=1)
    inputActive = '%s.inputActive[%s]' % (nucleus, index)
    inputStart = '%s.inputActiveStart[%s]' % (nucleus, index)
    output_object = '%s.outputObjects[%s]' % (nucleus, index)

    cmds.setAttr(hairShape + '.active', 1)

    cmds.connectAttr(hairShape + '.currentState', inputActive)
    cmds.connectAttr(hairShape + '.startState', inputStart)
    cmds.connectAttr(nucleus + '.')







def createNucleus(jointList):
    prefixName = name.removeSuffix(jointList[0])

    nucleus = cmds.createNode('nucleus', n=prefixName + '_nucleus')
    cmds.connectAttr('time1.outTime', nucleus + '.currentTime', f=1)

    return nucleus
