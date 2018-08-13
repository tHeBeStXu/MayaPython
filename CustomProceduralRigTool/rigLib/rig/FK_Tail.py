import maya.cmds as cmds

from ..base import control
from ..base import module
reload(control)
reload(module)


def build(tailJoints,
          FK_Parent='',
          rigScale=1.0,
          prefix='C_',
          baseRig=None
          ):
    """
    Build the FK_Tail rig.
    :param tailJoints: list(str), tailJoints to the end. i.e.[tail_1, tail_2, tail_3, ... tail_x, tail_end]
    :param rigScale: float, rig scale of the FK_Tail rig module, 1.0 is used.
    :param FK_Parent: str, IK_FK_Spine['pelvis_Ctrl'] is used.
    :param prefix: str, prefix of the tail rig.
    :param baseRig: str, base atttach of the rig, Base Class instance is used.
    :return: None
    """
    cmds.select(cl=1)
    rigmodule = module.Module(prefix=prefix + 'Tail_',
                              baseObject=baseRig)

    ##########
    # FK Rig #
    ##########
    validTailJoints = []
    for i in tailJoints:
        if cmds.listRelatives(i, s=0, p=0, children=1):
            validTailJoints.append(i)

    FK_tailCtrl_List = []
    FK_tailCtrlGrp_List = []

    # FK Ctrl
    for i in xrange(len(validTailJoints)):
        FK_tailCtrl = control.Control(prefix=prefix + 'FK_',
                                      rigPartName='Tail_' + str(i),
                                      scale=rigScale * (len(validTailJoints) - i),
                                      translateTo=validTailJoints[i],
                                      rotateTo=validTailJoints[i],
                                      shape='circle')

        cmds.pointConstraint(FK_tailCtrl.C, validTailJoints[i], mo=0)
        cmds.orientConstraint(FK_tailCtrl.C, validTailJoints[i], mo=0)

        FK_tailCtrl_List.append(FK_tailCtrl.C)
        FK_tailCtrlGrp_List.append(FK_tailCtrl.Off)

    cmds.select(cl=1)

    # Parenting
    for i in xrange(len(FK_tailCtrlGrp_List)-1):
        cmds.parent(FK_tailCtrlGrp_List[i+1], FK_tailCtrl_List[i])

    cmds.select(cl=1)

    # add and set ctrl visibility
    cmds.addAttr(FK_tailCtrl_List[0], ln='Tail_Ctrl_Visibility', at='bool', dv=0, k=1)

    target_Ctrl_List = []
    for i in FK_tailCtrl_List[1::2]:
        target_Ctrl_List.append(i)

    ctrlShape_Input_List = []
    for i in xrange(len(target_Ctrl_List)):
        CtrlShape = cmds.listRelatives(target_Ctrl_List[i], s=1, children=0, parent=0)
        ctrlShape_Input = cmds.listConnections(CtrlShape[0] + '.create', source=1, destination=0, plugs=0)[0]
        ctrlShape_Input_List.append(ctrlShape_Input)

    cmds.setAttr(FK_tailCtrl_List[0] + '.Tail_Ctrl_Visibility', 0)
    for i in xrange(len(ctrlShape_Input_List)):
        cmds.setAttr(ctrlShape_Input_List[i] + '.sweep', 0)
        cmds.setDrivenKeyframe(ctrlShape_Input_List[i] + '.sweep', cd=FK_tailCtrl_List[0] + '.Tail_Ctrl_Visibility')

    cmds.setAttr(FK_tailCtrl_List[0] + '.Tail_Ctrl_Visibility', 1)
    for i in xrange(len(ctrlShape_Input_List)):
        cmds.setAttr(ctrlShape_Input_List[i] + '.sweep', 360)
        cmds.setDrivenKeyframe(ctrlShape_Input_List[i] + '.sweep', cd=FK_tailCtrl_List[0] + '.Tail_Ctrl_Visibility')

    # Clean the hierarchy
    if FK_Parent:
        cmds.parent(FK_tailCtrlGrp_List[0], FK_Parent)
    else:
        cmds.parent(FK_tailCtrlGrp_List[0], rigmodule.topGrp)
        cmds.warning('Warning: FK_Parent is None!')

    cmds.select(cl=1)
