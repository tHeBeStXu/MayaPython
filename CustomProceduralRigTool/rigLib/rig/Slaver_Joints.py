import maya.cmds as cmds


def build(joints=None):
    """
    create Slave joints for given joints list.
    if joints = None, create slave joints for all joints in the scene without end joint in the joint chain
    :param joints: str list, target joints list for create Slave joints
    :return: None
    """

    if joints:
        targetJoints=joints
    else:
        targetJoints = []

        # list all selected joints without end joints
        allJoints = cmds.ls(type='joint', long=1)
        for joint in allJoints:
            if cmds.listRelatives(joint, children=1, s=0):
                targetJoints.append(joint)

    # create slave joints
    if targetJoints:
        for i in targetJoints:
            cmds.select(cl=1)
            slvJnt = cmds.joint(n='Slave_' + i)

            pc = cmds.parent(i, slvJnt, mo=0)
            cmds.delete(pc)

            cmds.makeIdentity(slvJnt, apply=1)

            cmds.pointConstraint(i, slvJnt, mo=0)
            cmds.orientConstraint(i, slvJnt, mo=0)
            cmds.scaleConstraint(i, slvJnt, mo=0)

            cmds.select(cl=1)
    else:
        cmds.error('No joints for create slave joints!\nPlease check your joints!')


