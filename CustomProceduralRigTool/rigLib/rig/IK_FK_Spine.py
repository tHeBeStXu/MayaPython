"""
This IK_FK_Spine build module is used for spine joint chain which is placed in the 0 x-Axis position.
"""
import maya.cmds as cmds
from ..base import module
from ..base import control
reload(module)
reload(control)


def build(spineJoints,
          prefix,
          rigScale,
          numFK_Jnt=2,
          baseRig=None):
    """

    :param spineJoints: list[str], original spine joints, from the C_Spine_0 to C_Spine_x, you need to make true that
                        the spine joints are at same directions, i.e. x-axis is main axis, and z-axis is point to the
                        -x axis of world space.
    :param prefix: str, prefix of the spine, usually, 'C_' is used.
    :param rigScale: float, rig scale of the whole rigging project.
    :param baseRig: str, base atttach of the rig. Master_Ctrl_.C is used.
    :return: dictionary, rigModule, chest_ctrl (used for upper body parts rig)and pelvis_ctrl (used for tail rig)
    """
    rigModule = module.Module(prefix=prefix,
                              rigPartName='Spine',
                              baseObject=baseRig)

    # fk skeleton chain
    # create FK crv
    ik_part_list = []
    ik_part_list = cmds.ikHandle(sj=spineJoints[0], ee=spineJoints[-1], parentCurve=0, sol='ikSplineSolver', numSpans=3)

    cmds.delete(ik_part_list[0])

    FK_Crv = ik_part_list[-1]

    fkJntList = []
    eachADD = 1.0 / (len(range(numFK_Jnt)) - 1)

    for i in range(numFK_Jnt):
        fkJnt = cmds.joint(n='FK_' + prefix + 'Spine_' + str(i))
        pc = cmds.parentConstraint(spineJoints[0], fkJnt, mo=0)
        cmds.delete(pc)

        motionPath = cmds.pathAnimation(FK_Crv, fkJnt, n=fkJnt + '_motionPath', fractionMode=1, follow=1, followAxis='x', upAxis='y', worldUpType='Vector',
                                        worldUpVector=(0, 1, 0), inverseUp=0, inverseFront=0, bank=0)

        cmds.disconnectAttr(motionPath + '.rotateX', fkJnt + '.rotateX')
        cmds.disconnectAttr(motionPath + '.rotateY', fkJnt + '.rotateY')
        cmds.disconnectAttr(motionPath + '.rotateZ', fkJnt + '.rotateZ')

        cmds.disconnectAttr(motionPath + '_uValue.output', motionPath + '.uValue')

        cmds.setAttr(motionPath + '.uValue', eachADD * float(i))

        cmds.select(cl=1)

        fkJntList.append(fkJnt)


    # delete the motionPath
    cmds.delete(FK_Crv)

    # move the last fk joint to the end of the spineJoints
    pc3 = cmds.pointConstraint(spineJoints[-1], fkJntList[-1], mo=0)
    cmds.delete(pc3)

    # aimConstraint all the fk_joints, the last joints must be same direction as the last joints of original joints list
    fkJntList_rev = []

    for i in fkJntList:
        fkJntList_rev.append(i)
    fkJntList_rev.reverse()
    
    for i in xrange(len(fkJntList_rev)-1):
        ac = cmds.aimConstraint(fkJntList_rev[i], fkJntList_rev[i+1], mo=0, weight=1, aimVector=(1, 0, 0),
                                upVector=(0, 1, 0), worldUpType='vector', worldUpVector=(0, 1, 0))
        cmds.delete(ac)

    # orientConstraint the last joint
    oc = cmds.orientConstraint(spineJoints[-1], fkJntList_rev[0], mo=0)
    cmds.delete(oc)

    # parent
    for i in xrange(len(fkJntList_rev)-1):
        cmds.parent(fkJntList_rev[i], fkJntList_rev[i+1])

    # set fk joints drawStyle to None and display to template

    for i in fkJntList:
        cmds.setAttr(i + '.drawStyle', 2)

    # freeze transformation
    cmds.makeIdentity(fkJntList[0], apply=1)


    ##########
    # FK rig #
    ##########
    FK_CtrlGrp_List = []
    FK_Ctrl_List = []

    for i in xrange(len(fkJntList)-2):
        FK_C_Spine_Ctrl = control.Control(prefix='FK_' + prefix,
                                          rigPartName='Spine_' + str(i),
                                          scale=rigScale,
                                          translateTo=fkJntList[i+1],
                                          rotateTo=fkJntList[i+1],
                                          shape='circle',
                                          lockChannels=['t', 's', 'v'])

        cmds.orientConstraint(FK_C_Spine_Ctrl.C, fkJntList[i+1], mo=0)

        FK_CtrlGrp_List.append(FK_C_Spine_Ctrl.Off)
        FK_Ctrl_List.append(FK_C_Spine_Ctrl.C)

        cmds.select(cl=1)

    # parent the CtrlGrps to the proper places
    for i in xrange(len(FK_Ctrl_List)-1):
        cmds.parent(FK_CtrlGrp_List[i+1], FK_Ctrl_List[i])

    cmds.parent(FK_CtrlGrp_List[0], fkJntList[0])

    #############
    # Body Ctrl #
    #############

    # create a square control shape for body ctrl

    body_Ctrl = control.Control(prefix=prefix,
                                rigPartName='Body',
                                scale=rigScale * 15,
                                shape='squareControl',
                                translateTo=spineJoints[0],
                                axis='z')

    C_Pelvis_Ctrl = control.Control(prefix=prefix,
                                    rigPartName='Pelvis',
                                    scale=rigScale,
                                    translateTo=spineJoints[0],
                                    rotateTo=spineJoints[0],
                                    axis='x',
                                    shape='moveControl')

    C_Chest_Ctrl = control.Control(prefix=prefix,
                                   rigPartName='Chest',
                                   scale=rigScale,
                                   translateTo=spineJoints[-1],
                                   rotateTo=spineJoints[-1],
                                   axis='x',
                                   shape='moveControl')

    # create 2 joints for controlling ikHandle curve
    pelvis_Jnt = cmds.joint(n=prefix + 'Pelvis')
    cmds.select(cl=1)
    chest_Jnt = cmds.joint(n=prefix + 'Chest')
    cmds.select(cl=1)

    pc1 = cmds.parentConstraint(fkJntList[0], pelvis_Jnt, mo=0)
    cmds.delete(pc1)
    cmds.makeIdentity(pelvis_Jnt, apply=1)

    pc2 = cmds.parentConstraint(fkJntList[-1], chest_Jnt, mo=0)
    cmds.delete(pc2)
    cmds.makeIdentity(chest_Jnt, apply=1)

    ##########
    # IK rig #
    ##########

    IK_Part_List = cmds.ikHandle(n=prefix + 'Spine_IK',
                                 sj=spineJoints[0],
                                 ee=spineJoints[-1],
                                 parentCurve=0,
                                 numSpans=4,
                                 sol='ikSplineSolver')

    # bind ik curve with 2 joints
    cmds.select(cl=1)
    cmds.select(IK_Part_List[-1])
    cmds.select(chest_Jnt, add=1)
    cmds.select(pelvis_Jnt, add=1)
    cmds.skinCluster(chest_Jnt, pelvis_Jnt, IK_Part_List[-1], tsb=1)

    # setup IK Twist
    cmds.setAttr(IK_Part_List[0] + '.dTwistControlEnable', 1)
    cmds.setAttr(IK_Part_List[0] + '.dWorldUpType', 4)
    cmds.connectAttr(C_Pelvis_Ctrl.C + '.worldMatrix[0]', IK_Part_List[0] + '.dWorldUpMatrix')
    cmds.connectAttr(C_Chest_Ctrl.C + '.worldMatrix[0]', IK_Part_List[0] + '.dWorldUpMatrixEnd')

    # clean up the hierarchy
    cmds.parent(pelvis_Jnt, C_Pelvis_Ctrl.C)
    cmds.parent(chest_Jnt, C_Chest_Ctrl.C)

    # parent fk_jnt to body_Ctrl
    cmds.parent(fkJntList[0], body_Ctrl.C)

    # parent pelvis_CtrlGrp to body_Ctrl
    cmds.parent(C_Pelvis_Ctrl.Off, body_Ctrl.C)

    # parent chest_CtrlGrp to fkJntList[-1]
    cmds.parent(C_Chest_Ctrl.Off, fkJntList[-1])

    cmds.parent(IK_Part_List[-1], IK_Part_List[0], rigModule.dontTouchGrp)

    # parent body_CtrlGrp to rigmodule.topGrp
    cmds.parent(body_Ctrl.Off, rigModule.topGrp)

    cmds.select(cl=1)

    # return
    return {'module': rigModule, 'chest_Ctrl': C_Chest_Ctrl.C, 'pelvis_Ctrl': C_Pelvis_Ctrl.C}
