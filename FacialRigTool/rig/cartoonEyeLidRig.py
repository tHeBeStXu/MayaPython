import maya.cmds as cmds
from ..rigLib import lib
from ..utils import name
from ..base import control
from ..base import module

reload(lib)
reload(name)
reload(control)
reload(module)


def createRig(vertexList,
              prefix='L_',
              rigPartName='EyeLid',
              rigScale=1.0,
              eyeJoint='',
              numCtrl=5,
              insertJnt=[]
              ):

    if numCtrl < 3:
        cmds.error('numCtrl must bigger than 3!')
        return
    cmds.select(cl=1)

    # create eyelid Module
    rigModule = module.Module(prefix=prefix, rigPartName=rigPartName)

    # create eyelid joint for each vertex
    eyeLidJointList = lib.vertex2Joints(vertexList=vertexList, prefix=prefix, rigPartName=rigPartName)

    # create eyelid parent joint for each eyelid joint
    eyeLidParentJntList = []
    for i in eyeLidJointList:
        cmds.select(cl=1)

        parentJoint = cmds.joint(n=i + '_Parent')

        cmds.delete(cmds.pointConstraint(eyeJoint, parentJoint, mo=0))

        cmds.delete(cmds.aimConstraint(i, parentJoint, aimVector=(1, 0, 0), upVector=(0, -1, 0),
                                       worldUpType='scene', weight=1, offset=(0, 0, 0), mo=0))
        cmds.parent(i, parentJoint)

        cmds.joint(i, e=1, oj='none', ch=1, zso=1)

        cmds.makeIdentity(parentJoint, apply=1, t=1, r=1, s=1)

        eyeLidParentJntList.append(parentJoint)

    cmds.select(cl=1)

    eyelidLocList = []
    # create locator for each eyelid joint
    for i in eyeLidParentJntList:

        cmds.select(cl=1)

        eyelidJoint = cmds.listRelatives(i, c=1, type='joint', shapes=0)[0]

        ikHandle = cmds.ikHandle(n=eyelidJoint + '_IK', sj=i, ee=eyelidJoint, sol='ikSCsolver')

        eyelidLoc = cmds.spaceLocator(n=eyelidJoint + '_LOC')

        cmds.delete(cmds.parentConstraint(eyelidJoint, eyelidLoc, mo=0))

        cmds.select(cl=1)
        cmds.parent(ikHandle[0], eyelidLoc)

        eyelidLocList.append(eyelidLoc)

    cmds.select(cl=1)

    # create high definition curve
    posList = []
    for i in eyelidLocList:
        pos = cmds.xform(i, q=1, ws=1, t=1)
        posList.append(tuple(pos))

    kList = []
    for i in xrange(len(posList)):
        kList.append(i)

    highDefCurve = cmds.curve(n=prefix + rigPartName + '_HD_Crv', p=posList, k=kList, d=1)
    lowDefCurve = cmds.duplicate(highDefCurve, n=prefix + rigPartName + '_LD_Crv')

    highDefCurveShape = cmds.listRelatives(highDefCurve, p=0, c=0, s=1, path=1)[0]
    cmds.select(cl=1)

    # make each locator attach to the curve

    for i in eyelidLocList:
        pos = cmds.xform(i, q=1, ws=1, t=1)
        uParam = lib.getUParam(pos, highDefCurveShape)

        PCI = cmds.createNode('pointOnCurveInfo', n=name.removeSuffix(i) + '_PCI')

        cmds.connectAttr(highDefCurveShape + '.worldSpace', PCI + '.inputCurve', f=1)

        cmds.setAttr(PCI + '.parameter', uParam)

        cmds.connectAttr(PCI + '.position', i + '.t')

        cmds.select(cl=1)
"""
    # make HD curve deformed by LD curve
    lowDefCurve = cmds.rebuildCurve(lowDefCurve, ch=0, rpo=1, rt=0, end=1, kr=0, kcp=0, kep=1, kt=0, s=3, d=3)
    cmds.select(cl=1)

    wireDefomer = cmds.wire(highDefCurve, gw=0, en=1, ce=0, li=0, w=lowDefCurve)
    print wireDefomer
    cmds.select(cl=1)

    # create control joint and controls for the LD curve
    controlJointList = []

    eachADD = 1.0 / (numCtrl - 1)

    for i in xrange(numCtrl):
        newJnt = cmds.joint(n=prefix + rigPartName + '_CtrlJnt_' + str(i))
        cmds.select(cl=1)
        motionPath = cmds.pathAnimation(lowDefCurve, newJnt, n=prefix + rigPartName + '_MP_' + str(i), fractionMode=1,
                                        follow=1, followAxis='x', upAxis='z', worldUpType='scene',
                                        inverseUp=0, inverseFront=0, bank=0)

        cmds.cutKey(motionPath + '.u', time=())

        cmds.setAttr(motionPath + '.uValue', eachADD * float(i))

        for attr in ['t', 'r']:
            for axis in ['x', 'y', 'z']:
                cmds.delete(newJnt + '%s%s' % (attr, axis), icn=1)

        cmds.delete(motionPath)
        cmds.select(cl=1)

        controlJointList.append(newJnt)

        cmds.setAttr(newJnt + '.r', 0, 0, 0)
        cmds.select(cl=1)

    if insertJnt:
        controlJointList = controlJointList[1:-1]
        controlJointList.insert(0, insertJnt[0])
        controlJointList.append(insertJnt[-1])

    # bind LD curve by control joint
    cmds.skinCluster(controlJointList[:], lowDefCurve)
    cmds.select(cl=1)

    # create control for each control joint
    if insertJnt:
        controlJointList = controlJointList[1:-1]

    jntCtrlGrpList = []
    for i in xrange(len(controlJointList)):
        ctrl = control.Control(prefix=prefix,
                               rigPartName=rigPartName,
                               scale=rigScale * 0.1,
                               shape='circleY',
                               translateTo=controlJointList[i],
                               rotateTo=controlJointList[i])

        cmds.pointConstraint(ctrl.C, controlJointList[i], mo=0)
        cmds.orientConstraint(ctrl.C, controlJointList[i], mo=0)

        jntCtrlGrpList.append(ctrl.Off)

    cmds.select(cl=1)

    # clean hierarchy
    parentJntGrp = cmds.group(n=prefix + rigPartName + '_skinJnt_Grp', em=1)
    locGrp = cmds.group(n=prefix + rigPartName + '_LOC_Grp', em=1)
    curveGrp = cmds.group(n=prefix + rigPartName + '_Crv_Grp', em=1)
    ctrlJntGrp = cmds.group(n=prefix + rigPartName + '_ctrlJnt_Grp', em=1)
    ctrlGrp = cmds.group(n=prefix + rigPartName + '_CtrlGrp', em=1)

    for i in eyeLidParentJntList:
        cmds.parent(i, parentJntGrp)

    for i in eyelidLocList:
        cmds.parent(i, locGrp)

    cmds.parent(lowDefCurve, curveGrp)
    cmds.parent(highDefCurve, curveGrp)

    for i in controlJointList:
        cmds.parent(i, ctrlJntGrp)

    for i in jntCtrlGrpList:
        cmds.parent(i, ctrlGrp)

    cmds.parent(parentJntGrp, rigModule.topGrp)
    cmds.parent(locGrp, rigModule.topGrp)
    cmds.parent(curveGrp, rigModule.topGrp)
    cmds.parent(ctrlJntGrp, rigModule.topGrp)
    cmds.parent(ctrlGrp, rigModule.topGrp)
    
    """
