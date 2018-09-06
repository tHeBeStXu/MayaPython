import maya.cmds as cmds
from ..utils import name


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
