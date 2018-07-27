"""
build the IK FK Arm rig
"""
import maya.cmds as cmds

from ..base import module
from ..base import control

from ..utils import joint
from ..utils import name


def build(prefix,
          topJoint,
          startDupJnt,
          endDupJnt,
          armPvLoc,
          switchCtrlLoc,
          rigScale,
          fkPreParent,
          baseRig=None):

    rigmodule = module.Module(prefix=prefix,
                              baseObject=baseRig)

    # make attach groups
    bodyAttachGrp = cmds.group(n=prefix + 'bodyAttach_grp',
                               em=1, p=rigmodule.partsGrp)
    baseAttachGrp = cmds.group(n=prefix + 'baseAttach_grp',
                               em=1, p=rigmodule.partsGrp)
    cmds.select(cl=1)
    # duplicate the specified joints
    # Create fkJoints
    fkArmJnts = joint.dupSpecifiedJnts(startDupJnt=startDupJnt,
                                       endDupJnt=endDupJnt,
                                       suffix='_FK')

    cmds.select(cl=1)

    # create ikJoints
    ikArmJnts = joint.dupSpecifiedJnts(startDupJnt=startDupJnt,
                                       endDupJnt=endDupJnt,
                                       suffix='_IK')
    cmds.select(cl=1)

    # create the IK wrist Ctrl
    ikWristCtrl = control.Control(prefix=prefix + 'Wrist_IK',
                                  translateTo=ikArmJnts[-1],
                                  rotateTo=ikArmJnts[-1],
                                  scale=rigScale*6,
                                  shape='circleX',
                                  parent=rigmodule.controlGrp)

    # create the switch Ctrl
    switchCtrl = control.Control(prefix=prefix + 'Switch',
                                 translateTo=switchCtrlLoc,
                                 scale=rigScale*4,
                                 shape='circleX',
                                 parent=ikWristCtrl.C,
                                 lockChannels=['t', 'r', 's', 'v'])

    # add Attr to switchCtrl
    cmds.addAttr(switchCtrl.C, ln='FK_2_IK', at='float', min=0, max=1, k=1)



    skinArmJnts = ['l_shouder', 'l_elbow', 'l_wrist']
    switchCtrlList = [switchCtrl.C, switchCtrl.C, switchCtrl.C]

    ###############
    # IK FK Blend #
    ###############

    # create connections
    for ikJnt, fkJnt, jnt, switch in zip(ikArmJnts, fkArmJnts, skinArmJnts, switchCtrlList):
        # create blendNode
        blendNode = cmds.createNode('blendColors')
        # connect IK.r to blendNode.color1
        cmds.connectAttr(ikJnt + '.r', blendNode + '.color1', f=1)
        # connect FK.r to blendNode.color2
        cmds.connectAttr(fkJnt + '.r', blendNode + '.color2', f=1)
        # connect blendNode.output to skinJnt.r
        cmds.connectAttr(blendNode + '.output', jnt + '.r', f=1)
        # connect switchCtrl.IK2FK to blendNode.blend
        cmds.connectAttr(switch + '.FK_2_IK', blendNode + '.blender', f=1)

############
# IK PARTS #
############

    # create IK Arm PvCtrl
    IKArmPvCtrl = control.Control(prefix=prefix + 'Pv',
                                  translateTo=armPvLoc,
                                  shape='diamond',
                                  scale=rigScale*5,
                                  lockChannels=['r', 's', 'v'])

    # create IK Handle
    IKHandle = cmds.ikHandle(n=ikArmJnts[-1] + '_ikh',
                             sol='ikRPsolver',
                             sj=ikArmJnts[0],
                             ee=ikArmJnts[-1])[0]
    cmds.hide(IKHandle)

    # poleConstraint IKHandle to PvCtrl
    cmds.poleVectorConstraint(IKArmPvCtrl.C, IKHandle)

    # parent ikHandle to ikWristCtrl
    cmds.parent(IKHandle, ikWristCtrl.C)

    # orient constraint ik wrist to ikCtrl
    cmds.orientConstraint(ikWristCtrl.C, ikArmJnts[-1])

    # attach IKArmPvCtrl to bodyAttachGrp
    cmds.parentConstraint(bodyAttachGrp, IKArmPvCtrl.Off, mo=1)
    cmds.parentConstraint(bodyAttachGrp, ikWristCtrl.Off, mo=1)

    # clean and parent
    cmds.parent(IKArmPvCtrl.Off, rigmodule.controlGrp)

############
# FK PARTS #
############

    # FK Arms
    cmds.select(cl=1)
    fkArmPreParent = fkPreParent
    fkArmCtrlList = []
    for jnt in fkArmJnts:
        jntCtrl = control.Control(prefix=jnt,
                                  translateTo=jnt,
                                  rotateTo=jnt,
                                  shape='sphere',
                                  scale=rigScale*4,
                                  lockChannels=['t', 's', 'v'])

        cmds.pointConstraint(jntCtrl.C, jnt, mo=0)
        cmds.orientConstraint(jntCtrl.C, jnt, mo=0)

        if fkArmPreParent != None:
            cmds.parent(jntCtrl.Off, fkArmPreParent)

        fkArmPreParent = jntCtrl.C

        fkArmCtrlList.append(jntCtrl)


    # FK Clavicle
    fkClavicleCtrl = control.Control(prefix=topJoint + '_FK',
                                     translateTo=topJoint,
                                     rotateTo=topJoint,
                                     shape='rotationControl',
                                     lockChannels=['t', 's', 'v'],
                                     scale=rigScale*4)

    cmds.orientConstraint(fkClavicleCtrl.C, topJoint)

    claLoc_Local = cmds.spaceLocator(n=topJoint + '_Local')
    cmds.delete(cmds.parentConstraint(fkArmCtrlList[0].C, claLoc_Local))
    claLoc_World = cmds.spaceLocator(n=topJoint + '_World')
    cmds.delete(cmds.parentConstraint(fkArmCtrlList[0].C, claLoc_World))

    cmds.hide(claLoc_Local, claLoc_World)

    cmds.addAttr(fkClavicleCtrl.C, ln='Fk_Local_2_World', at='float', min=0, max=1, k=1)

    cmds.pointConstraint(claLoc_Local, fkArmCtrlList[0].Off, mo=0)
    orientCont = cmds.orientConstraint(claLoc_Local, claLoc_World, fkArmCtrlList[0].Off, mo=0)

    cmds.parent(claLoc_Local, topJoint)

    # set attr
    fkLocal2WorldAttr = fkClavicleCtrl.C + '.Fk_Local_2_World'
    cmds.setAttr(fkLocal2WorldAttr, 0)
    orientContAttrLocal = orientCont[0] + '.' + claLoc_Local[0] + 'W0'
    orientContAttrWorld = orientCont[0] + '.' + claLoc_World[0] + 'W1'
    cmds.setAttr(orientContAttrLocal, 1)
    cmds.setAttr(orientContAttrWorld, 0)

    # set driven key
    cmds.setDrivenKeyframe(orientContAttrLocal, cd=fkLocal2WorldAttr)
    cmds.setDrivenKeyframe(orientContAttrWorld, cd=fkLocal2WorldAttr)

    # set attr
    cmds.setAttr(fkLocal2WorldAttr, 1)
    cmds.setAttr(orientContAttrLocal, 0)
    cmds.setAttr(orientContAttrWorld, 1)
    # set driven key
    cmds.setDrivenKeyframe(orientContAttrLocal, cd=fkLocal2WorldAttr)
    cmds.setDrivenKeyframe(orientContAttrWorld, cd=fkLocal2WorldAttr)

    # clean and parent

    cmds.parent(fkClavicleCtrl.Off, rigmodule.controlGrp)
    cmds.parent(fkArmCtrlList[0].Off, rigmodule.controlGrp)

    # attach clavicleCtrl to baseAttachGrp
    cmds.parentConstraint(baseAttachGrp, fkClavicleCtrl.Off, mo=1)

    ##############
    # FK Fingers #
    ##############
    # create and place the grp to desired place
    wristGrp = cmds.group(n=endDupJnt + '_FKOffset_grp', em=1)
    cmds.parentConstraint(endDupJnt, wristGrp, mo=0)

    '''May be a reuseful function...'''
    topFingerList = cmds.listRelatives(endDupJnt, type='joint')
    # create fk finger ctrls
    for topFin in topFingerList:

        fingerJnts = joint.listHierarchy(topFin, withEndJoints=True)

        cmds.select(cl=1)

        fkFinPreParent = wristGrp
        for jnt in fingerJnts:
            jntCtrl = control.Control(prefix=jnt + '_FK',
                                      translateTo=jnt,
                                      rotateTo=jnt,
                                      shape='circleY',
                                      scale=rigScale*3,
                                      lockChannels=['t', 's', 'v'])

            cmds.pointConstraint(jntCtrl.C, jnt, mo=0)
            cmds.orientConstraint(jntCtrl.C, jnt, mo=0)

            if fkFinPreParent != None:
                cmds.parent(jntCtrl.Off, fkFinPreParent)

            fkFinPreParent = jntCtrl.C

    # clean and parent
    cmds.parent(wristGrp, rigmodule.controlGrp)
    cmds.parent(switchCtrlLoc, armPvLoc, rigmodule.partsGrp)
    cmds.parent(claLoc_World, rigmodule.dontTouchGrp)

    # clear selection before return
    cmds.select(cl=1)

    return {'module': rigmodule, 'baseAttachGrp': baseAttachGrp, 'bodyAttachGrp': bodyAttachGrp}
