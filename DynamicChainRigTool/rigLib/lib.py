import maya.cmds as cmds
from ..utils import name
from ..base import control
reload(name)
reload(control)


def createSplineIK(jointList, prefixName, curve=None):
    """
    create Spline IK whether curve is given or not
    :param jointList: list(str), list of joint chain
    :param curve: str, curve name
    :return: list(str), IK_Handle = [ikh, effector, crv]
    """
    if not curve:
        # create IK Spline
        IK_Handle = cmds.ikHandle(n=prefixName + '_ikh', sj=jointList[0],
                                  ee=jointList[-1], sol='ikSplineSolver', scv=0, pcv=0)
        IK_Handle[-1] = cmds.rename(IK_Handle[-1], prefixName + '_Crv_Input')

    else:
        # add jointList to exists curve
        IK_Handle = cmds.ikHandle(n=prefixName + '_ikh', sj=jointList[0], ee=jointList[-1],
                                  sol='ikSplineSolver', c=curve, ccv=0, roc=0, pcv=0, snc=1)
        IK_Handle.append(curve)

    return IK_Handle


def createCtrlSystem(jointList, numCtrl, curve, upAxis='y'):
    """
    create FK Joints control system for controlling line shape
    :param jointList: list(str), joint chain list
    :param numCtrl: int, number of controls
    :param curve: str, controled curve
    :param upAxis: str, up Axis, y or z
    :return: dict, {'FK_CtrlGrp_List', 'FK_Ctrl_List'}
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
                                  rigPartName='_' + str(i),
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

    return {'FK_CtrlGrp_List': FK_CtrlGrp_List,
            'FK_Ctrl_List': FK_Ctrl_List,
            'fkJntList': fkJntList}


def createFollicle(curveShape, prefixName):
    """
    create a follicle node for curve
    :param curveShape: str, curve shape
    :param prefixName: str, prefix name of the original joint chain
    :return: dict, {'follicle': [follicleTransNode, follicleShape], 'curveOut': [curveTransNodeOut, curveShapeOut]}
    """

    # follicle
    follicleShape = cmds.createNode('follicle', n=prefixName + '_follicleShape')
    follicleTransNode = cmds.listRelatives(follicleShape, p=1, c=0, s=0)[0]
    follicleTransNode = cmds.rename(follicleTransNode, prefixName + '_follicleNode')
    follicleShape = cmds.listRelatives(follicleTransNode, c=1, p=0, s=1)[0]

    curveTransNode = cmds.listRelatives(curveShape, p=1, c=0, s=0)[0]

    cmds.connectAttr(curveTransNode + '.worldMatrix', follicleShape + '.startPositionMatrix', f=1)
    cmds.connectAttr(curveShape + '.local', follicleShape + '.startPosition', f=1)

    # create output curve
    curveShapeOut = cmds.createNode('nurbsCurve', n=prefixName + '_CrvShape_Output')
    curveTransNodeOut = cmds.listRelatives(curveShapeOut, p=1, c=0, s=0)[0]
    curveTransNodeOut = cmds.rename(curveTransNodeOut, prefixName + '_Crv_Output')
    curveShapeOut = cmds.listRelatives(curveTransNodeOut, c=1, p=0, s=1)[0]

    cmds.connectAttr(follicleTransNode + '.outCurve', curveShapeOut + '.create', f=0)

    cmds.select(cl=1)

    return {'follicleTransNode': follicleTransNode,
            'follicleShape': follicleShape,
            'curveTransNodeOut': curveTransNodeOut,
            'curveShapeOut': curveShapeOut}


def createHairSys(prefixName, nucleus=None):
    """
    create hair system
    :param prefixName: str, prefix_name of the original joint chain
    :param nucleus: str, whether specified nucleus
    :return: dict, {'hair_shape': hairShape, 'hairTransNode': hairTransNode}
    """

    nucleus = nucleus or createNucleus(prefixName=prefixName)
    # hair System
    hairShape = cmds.createNode('hairSystem', n=prefixName + '_hairSysShape')
    hairTransNode = cmds.listRelatives(hairShape, p=1, c=0, s=0)[0]
    hairTransNode = cmds.rename(hairTransNode, prefixName + '_hairSysNode')
    hairShape = cmds.listRelatives(hairTransNode, c=1, p=0, s=1)[0]
    cmds.select(cl=1)

    # connectAttr
    cmds.connectAttr('time1.outTime', hairShape + '.currentTime', f=1)
    index = cmds.getAttr(nucleus + '.inputActive', size=1)
    inputActive = '%s.inputActive[%s]' % (nucleus, index)
    inputStart = '%s.inputActiveStart[%s]' % (nucleus, index)
    output_object = '%s.outputObjects[%s]' % (nucleus, index)

    cmds.setAttr(hairShape + '.active', 1)

    cmds.connectAttr(hairShape + '.currentState', inputActive, f=1)
    cmds.connectAttr(hairShape + '.startState', inputStart, f=1)
    cmds.connectAttr(nucleus + '.startFrame', hairShape + '.startFrame', f=1)
    cmds.connectAttr(output_object, hairShape + '.nextState', f=1)

    return {'hairShape': hairShape, 'hairTransNode': hairTransNode}


def createNucleus(prefixName):
    """
    create nucleus
    :param jointList: list(str), joint chain list.
    :return: nucleus
    """

    nucleus = cmds.createNode('nucleus', n=prefixName + '_nucleus')
    cmds.connectAttr('time1.outTime', nucleus + '.currentTime', f=1)

    return nucleus


def addFollicle(follicleShape, hairShape):
    """
    add existed follicle to hair system
    :param str, follicleShape: follicle shape node
    :param str, hairShape: hair system shape node
    :return: None
    """
    hairIndex = cmds.getAttr(hairShape + '.inputHair', size=1)
    input_hair = '%s.inputHair[%s]' % (hairShape, hairIndex)
    output_hair = '%s.outputHair[%s]' % (hairShape, hairIndex)
    cmds.connectAttr(follicleShape + '.outHair', input_hair, f=1)
    cmds.connectAttr(output_hair, follicleShape + '.currentPosition', f=1)


def rigInputCrv(fkJointList, curveNode):
    """
    rig input crv with fk jointList
    :param fkJointList: list(str), fk joint control list
    :param curveNode: str, input curve of hair system
    :return: None
    """
    cmds.select(cl=1)
    cmds.skinCluster(fkJointList[:], curveNode, tsb=1)
    cmds.select(cl=1)


def createBakedCtrlSystem(jointList, prefixName):
    """
    create FK controls for FK_Joint chain list
    :param jointList: list(str), FK_Joint chain list
    :return: dict, {'FK_ctrlGrpList', 'FK_ctrlList'}
    """
    FK_ctrlList = []
    FK_ctrlGrpList = []

    cmds.select(cl=1)

    for i in xrange(len(jointList)-1):
        FK_Ctrl = control.Control(prefix='Baked_FK_' + prefixName,
                                  rigPartName='_' + str(i) + '_Ctrl',
                                  scale=7,
                                  translateTo=jointList[i],
                                  rotateTo=jointList[i],
                                  shape='squareControl',
                                  axis='z')

        cmds.pointConstraint(FK_Ctrl.C, jointList[i], mo=0)
        cmds.orientConstraint(FK_Ctrl.C, jointList[i], mo=0)

        FK_ctrlList.append(FK_Ctrl.C)
        FK_ctrlGrpList.append(FK_Ctrl.Off)

        cmds.select(cl=1)

    for i in xrange(len(FK_ctrlList) - 1):
        cmds.parent(FK_ctrlGrpList[i+1], FK_ctrlList[i])

    cmds.select(cl=1)

    return {'FK_ctrlGrpList': FK_ctrlGrpList, 'FK_ctrlList': FK_ctrlList}


def bakeDynamic2Ctrls(jointList, FK_ctrlList):
    """
    bake dynamic to the Baked_FK_controls
    :param jointList: list(str), joint chain list with dynamic
    :param FK_ctrlList: list(str)
    :return: None
    """
    animMinTime = cmds.playbackOptions(min=1, q=1)
    animMaxTime = cmds.playbackOptions(max=1, q=1)

    for i in xrange(int(animMaxTime-animMinTime) + 1):
        cmds.currentTime(animMinTime + i)

        for j in xrange(len(jointList)):
            cmds.matchTransform(FK_ctrlList[j], jointList[j], pos=1, rot=1)
            for at in ['translateX', 'translateY', 'translateZ', 'rotateX', 'rotateY', 'rotateZ']:
                cmds.setKeyframe(FK_ctrlList[j], at=at, time=cmds.currentTime(q=1))

        print 'current time is: ' + str(animMinTime + i)

    cmds.select(cl=1)


def createBakedJointChain(jointList):
    """
    create baked joint chain list
    :param jointList: list(str), original joint chain list
    :return:list(str), baked joint chain list
    """
    prefixName = name.removeSuffix(jointList[0])

    bakedJointList = []
    for i in xrange(len(jointList)):
        cmds.select(cl=1)
        bakedJnt = cmds.joint(n='Baked_' + prefixName + '_' + str(i))
        cmds.delete(cmds.parentConstraint(jointList[i], bakedJnt, mo=0))
        bakedJointList.append(bakedJnt)
        cmds.select(cl=1)

    for i in xrange(len(bakedJointList) - 1):

        cmds.parent(bakedJointList[i+1], bakedJointList[i])

    cmds.makeIdentity(bakedJointList[0], apply=1)

    if cmds.listRelatives(jointList[0], p=1, c=0, s=0):
        cmds.parent(bakedJointList[0], cmds.listRelatives(jointList[0], p=1, c=0, s=0)[0])

    cmds.select(cl=1)

    return bakedJointList
