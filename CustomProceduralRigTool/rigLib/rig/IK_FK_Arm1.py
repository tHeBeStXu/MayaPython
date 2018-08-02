"""
build the IK FK Arm rig
"""
import maya.cmds as cmds

from ..base import module
from ..base import control

from .. utils import name


def build(armJoints,
          prefix='L_',
          rigScale=1.0,
          FK_Parent='',
          switchCtrlLoc='',
          baseRig=None):

    rigmodule = module.Module(prefix=prefix,
                              rigPartName='Arm',
                              baseObject=baseRig)

    # create FK joints chain
    fk_preParent = armJoints[0]
    fk_Joint_List = []
    for i in xrange(len(armJoints)-1):
        newJnt = cmds.joint(n='FK_' + armJoints[i+1])
        cmds.select(cl=1)
        cmds.delete(cmds.parentConstraint(armJoints[i+1], newJnt, mo=0))
        cmds.makeIdentity(newJnt, apply=1, t=1, r=1, s=1)
        cmds.parent(newJnt, fk_preParent)
        fk_Joint_List.append(newJnt)
        fk_preParent = newJnt
    cmds.setAttr(fk_Joint_List[0] + '.v', 0)

    # create IK joints chain
    ik_preParent = armJoints[0]
    ik_Joint_List = []
    for i in xrange(len(armJoints)-1):
        newJnt = cmds.joint(n='IK_' + armJoints[i+1])
        cmds.select(cl=1)
        cmds.delete(cmds.parentConstraint(armJoints[i+1], newJnt, mo=0))
        cmds.makeIdentity(newJnt, apply=1, t=1, r=1, s=1)
        cmds.parent(newJnt, ik_preParent)
        ik_Joint_List.append(newJnt)
        ik_preParent = newJnt

    cmds.setAttr(ik_Joint_List[0] + '.v', 0)
    cmds.select(cl=1)

    ##############
    # Arm FK Rig #
    ##############
    FK_Arm_Ctrl_List = []
    FK_Arm_CtrlGrp_List = []
    for i in xrange(len(fk_Joint_List)):
        FK_Arm_Ctrl = control.Control(prefix=prefix + 'FK_',
                                      rigPartName=name.removePrefix(armJoints[i+1]),
                                      rigScale=3.0,
                                      translateTo=fk_Joint_List[i],
                                      rotateTo=fk_Joint_List[i],
                                      shape='cubeOnBase',
                                      axis='x',
                                      lockChannels=['t','s','v'])

        FK_Arm_Ctrl_List.append(FK_Arm_Ctrl.C)
        FK_Arm_CtrlGrp_List.append(FK_Arm_Ctrl.Off)
        cmds.select(cl=1)

    # lock the .rx and ry attribute of elbowCtrl
    cmds.setAttr(FK_Arm_Ctrl_List[1] + '.rx', l=1, k=0)
    cmds.setAttr(FK_Arm_Ctrl_List[1] + '.ry', l=1, k=0)

    # parent the CtrlGrps to the proper places
    for i in xrange(len(FK_Arm_Ctrl_List)-1):
        cmds.parent(FK_Arm_CtrlGrp_List[i+1], FK_Arm_Ctrl_List[i])

    # clavical Rig
    clavical_Ctrl = control.Control(prefix=prefix,
                                    rigPartName=name.removePrefix(armJoints[0]),
                                    rigScale=3.0,
                                    translateTo=armJoints[0],
                                    rotateTo=armJoints[0],
                                    shape='rotationControl',
                                    axis='x',
                                    lockChannels=['t', 's', 'v'])

    cmds.orientConstraint(clavical_Ctrl.C, armJoints[0], mo=0)


    # Clavical local2World
    cmds.addAttr(clavical_Ctrl.C, ln='Local2World', at="float", min=0, max=1, dv=0, k=1)

    clavical_Local = cmds.spaceLocator(n=armJoints[0] + '_Local_Loc')
    clavical_Local_Shape = cmds.listRelatives(clavical_Local, s=1)
    cmds.setAttr(clavical_Local_Shape[0] + '.localScaleX', 0)
    cmds.setAttr(clavical_Local_Shape[0] + '.localScaleY', 0)
    cmds.setAttr(clavical_Local_Shape[0] + '.localScaleZ', 0)
    cmds.setAttr(clavical_Local_Shape[0] + '.template', 1)

    clavical_World = cmds.spaceLocator(n=armJoints[0] + '_World_Loc')
    clavical_World_Shape = cmds.listRelatives(clavical_World, s=1)
    cmds.setAttr(clavical_World_Shape[0] + '.localScaleX', 0)
    cmds.setAttr(clavical_World_Shape[0] + '.localScaleY', 0)
    cmds.setAttr(clavical_World_Shape[0] + '.localScaleZ', 0)
    cmds.setAttr(clavical_World_Shape[0] + '.template', 1)

    cmds.delete(cmds.parentConstraint(FK_Arm_Ctrl_List[0], clavical_Local, mo=0))
    cmds.delete(cmds.parentConstraint(FK_Arm_Ctrl_List[0], clavical_World, mo=0))

    cmds.pointConstraint(clavical_Local, FK_Arm_Ctrl_List[0], mo=0)
    clavical_OrientConstraint = cmds.orientConstraint(clavical_Local, clavical_World, FK_Arm_CtrlGrp_List[0], mo=0)

    cmds.setAttr(clavical_Ctrl.C + '.Local2World', 0)
    cmds.setAttr(clavical_OrientConstraint[0] + '.' + clavical_Local[0] + 'W0', 0)
    cmds.setAttr(clavical_OrientConstraint[0] + '.' + clavical_World[0] + 'W1', 1)

    cmds.setDrivenKeyframe(clavical_OrientConstraint[0] + '.' + clavical_Local[0] + 'W0',
                           cd=clavical_Ctrl.C + '.Local2World')
    cmds.setDrivenKeyframe(clavical_OrientConstraint[0] + '.' + clavical_World[0] + 'W1',
                           cd=clavical_Ctrl.C + '.Local2World')

    cmds.parent(clavical_Local, armJoints[0])
    cmds.parent(clavical_World, baseRig.Master_Ctrl.C)






