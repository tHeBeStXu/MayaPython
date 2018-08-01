import maya.cmds as cmds
from ..base import module
from ..base import control
reload(module)
reload(control)


def build(neckJoints,
          rigScale,
          Master_Ctrl,
          FK_Parent='',
          prefix='C_',
          baseRig=None
          ):
    rigmodule = module.Module(prefix=prefix + 'Head_',
                              baseObject=baseRig)

    cmds.select(cl=1)

    # duplicate the specified joints
    # create fk joints list
    fk_Joints_List = []
    fkHeadJnts_Dirty_Start = cmds.duplicate(neckJoints[0], n='FK_' + neckJoints[0], renameChildren=1)
    fk_Joints_List.append(fkHeadJnts_Dirty_Start[0])
    fkHeadJnts_Dirty_Children = cmds.listRelatives(fkHeadJnts_Dirty_Start, s=0, parent=0, children=1, type='joint')

    for i in range(len(fkHeadJnts_Dirty_Children)):
        rename_Jnt = cmds.rename(fkHeadJnts_Dirty_Children[i], 'FK_' + neckJoints[i+1])
        fk_Joints_List.append(rename_Jnt)
    cmds.select(cl=1)

    # create ik joints list
    ik_Joints_List = []
    ikHeadJnts_Dirty_Start = cmds.duplicate(neckJoints[0], n='IK_' + neckJoints[0], renameChildren=1)
    ik_Joints_List.append(ikHeadJnts_Dirty_Start[0])
    ikHeadJnts_Dirty_Children = cmds.listRelatives(ikHeadJnts_Dirty_Start, s=0, parent=0, children=1, type='joint')

    for i in range(len(ikHeadJnts_Dirty_Children)):
        rename_Jnt = cmds.rename(ikHeadJnts_Dirty_Children[i], 'IK_' + neckJoints[i+1])
        ik_Joints_List.append(rename_Jnt)
    cmds.select(cl=1)

    ##########
    # FK Rig #
    ##########

    FK_Neck_CtrlGrp_List = []
    FK_Neck_Ctrl_List = []

    for i in xrange(len(fk_Joints_List)-1):
        FK_Neck_Ctrl = control.Control(prefix='FK_' + prefix,
                                       rigPartName='Neck_' + str(i),
                                       scale=rigScale,
                                       translateTo=fk_Joints_List[i],
                                       rotateTo=fk_Joints_List[i],
                                       shape='arrowCurve',
                                       axis='x',
                                       lockChannels=['t', 's', 'v']
                                       )
        cmds.orientConstraint(FK_Neck_Ctrl.C, fk_Joints_List[i], mo=0)

        FK_Neck_CtrlGrp_List.append(FK_Neck_Ctrl.Off)
        FK_Neck_Ctrl_List.append(FK_Neck_Ctrl.C)

        cmds.select(cl=1)

    # parent the CtrlGrps to the proper places
    for i in xrange(len(FK_Neck_Ctrl_List)-1):
        cmds.parent(FK_Neck_CtrlGrp_List[i+1], FK_Neck_Ctrl_List[i])

    FK_Head_Ctrl = control.Control(prefix='FK_C_',
                                   rigPartName='Head',
                                   scale=rigScale,
                                   translateTo=fk_Joints_List[-1],
                                   rotateTo=fk_Joints_List[-1],
                                   shape='cubeOnBase',
                                   axis='x',
                                   lockChannels=['t', 's', 'v'])

    # Local LOC
    fk_headLocal = cmds.spaceLocator(n='FK_headLocal')
    fk_headLocal_Shape = cmds.listRelatives(fk_headLocal, s=1)
    cmds.setAttr(fk_headLocal_Shape[0] + '.localScaleX', 0)
    cmds.setAttr(fk_headLocal_Shape[0] + '.localScaleY', 0)
    cmds.setAttr(fk_headLocal_Shape[0] + '.localScaleZ', 0)
    cmds.setAttr(fk_headLocal_Shape[0] + '.template', 1)

    # World LOC
    fk_headWorld = cmds.spaceLocator(n='FK_headWorld')
    fk_headWorld_Shape = cmds.listRelatives(fk_headWorld, s=1)
    cmds.setAttr(fk_headWorld_Shape[0] + '.localScaleX', 0)
    cmds.setAttr(fk_headWorld_Shape[0] + '.localScaleY', 0)
    cmds.setAttr(fk_headWorld_Shape[0] + '.localScaleZ', 0)
    cmds.setAttr(fk_headWorld_Shape[0] + '.template', 1)

    cmds.delete(cmds.parentConstraint(fk_Joints_List[-1], fk_headLocal, mo=0))
    cmds.delete(cmds.parentConstraint(fk_Joints_List[-1], fk_headWorld, mo=0))

    FK_Head_OrientConstraint = cmds.orientConstraint(fk_headLocal, fk_headWorld, FK_Head_Ctrl.Off, mo=0)
    cmds.pointConstraint(fk_headLocal, FK_Head_Ctrl.Off, mo=0)

    cmds.parent(fk_headLocal, FK_Neck_Ctrl_List[-1])
    cmds.parent(fk_headWorld, Master_Ctrl)

    # create attr and setDrivenKey
    cmds.addAttr(FK_Head_Ctrl.C, ln='Local2World', at="float", min=0, max=1, dv=0, k=1)
    cmds.setAttr(FK_Head_Ctrl.C + '.Local2World', 0)
    cmds.setAttr(FK_Head_OrientConstraint[0] + '.' + fk_headLocal[0] + 'W0', 1)
    cmds.setAttr(FK_Head_OrientConstraint[0] + '.' + fk_headWorld[0] + 'W1', 0)

    cmds.setDrivenKeyframe(FK_Head_OrientConstraint[0] + '.' + fk_headLocal[0] + 'W0',
                           cd=FK_Head_Ctrl.C + '.Local2World')
    cmds.setDrivenKeyframe(FK_Head_OrientConstraint[0] + '.' + fk_headWorld[0] + 'W1',
                           cd=FK_Head_Ctrl.C + '.Local2World')

    cmds.setAttr(FK_Head_Ctrl.C + '.Local2World', 1)
    cmds.setAttr(FK_Head_OrientConstraint[0] + '.' + fk_headLocal[0] + 'W0', 0)
    cmds.setAttr(FK_Head_OrientConstraint[0] + '.' + fk_headWorld[0] + 'W1', 1)

    cmds.setDrivenKeyframe(FK_Head_OrientConstraint[0] + '.' + fk_headLocal[0] + 'W0',
                           cd=FK_Head_Ctrl.C + '.Local2World')
    cmds.setDrivenKeyframe(FK_Head_OrientConstraint[0] + '.' + fk_headWorld[0] + 'W1',
                           cd=FK_Head_Ctrl.C + '.Local2World')

    # point and orient constriant the fk head joint
    cmds.pointConstraint(FK_Head_Ctrl.C, fk_Joints_List[-1], mo=0)
    cmds.orientConstraint(FK_Head_Ctrl.C, fk_Joints_List[-1], mo=1)








    # cmds.parent(FK_Neck_CtrlGrp_List[0], FK_Parent)




