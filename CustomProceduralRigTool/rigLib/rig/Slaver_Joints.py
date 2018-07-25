import maya.cmds as cmds

def build(joints):
    """
    create Slave joints for game Engine
    :param joints: target joints list for create Slave joints
    :return: None
    """
    for i in joints:
        cmds.select(cl=1)
        slvJnt = cmds.joint(n='Slave_' + i)

        pc = cmds.parent(i, slvJnt, mo=0)
        cmds.delete(pc)

        cmds.makeIdentity(slvJnt, apply=1)

        cmds.pointConstraint(i, slvJnt, mo=0)
        cmds.orientConstraint(i, slvJnt, mo=0)
        cmds.scaleConstraint(i, slvJnt, mo=0)

        cmds.select(cl=1)


