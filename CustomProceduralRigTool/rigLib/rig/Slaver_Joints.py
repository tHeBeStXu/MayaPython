import maya.cmds as cmds


def build(inputJoints=None):
    """
    create Slave joints for given joints list.
    if inputJoints = None, create slave joints for all joints in the scene without end joint in the joint chain
    :param inputJoints: str list, target joints list for create Slave joints
    :return: None
    """

    if inputJoints:
        targetJoints=inputJoints
    else:
        targetJoints = []

        # list all selected inputJoints without end inputJoints
        allJoints = cmds.ls(type='joint')
        for joint in allJoints:
            if cmds.attributeQuery('slaveJoint', node=joint, exists=1):
                targetJoints.append(joint)

    cmds.select(cl=1)

    # get roll Joints
    rollJoints = []
    if targetJoints:
        for joint in targetJoints:
            if cmds.attributeQuery('rollJoint', node=joint, exists=1):
                if cmds.getAttr(joint + '.rollJoint'):
                    rollJoints.append(joint)

    cmds.select(cl=1)

    # get special inputJoints
    specialJoints = []
    if targetJoints:
        for joint in targetJoints:
            if cmds.attributeQuery('slaveParent', node=joint, exists=1) and\
                    cmds.attributeQuery('slavePointConst', node=joint, exists=1):
                specialJoints.append(joint)

    #

    # get normal inputJoints
    normalJoints = []
    for joint in targetJoints:
        if joint not in rollJoints and joint not in specialJoints:
            normalJoints.append(joint)

    cmds.select(cl=1)

    # create slave joints for special joints
    slaveSpecialJoints = []
    for joint in specialJoints:
        slaveJoint = cmds.joint(n='Slave_' + joint)
        cmds.select(cl=1)
        cmds.delete(cmds.parentConstraint(joint, slaveJoint, mo=0))
        slaveSpecialJoints.append(slaveJoint)

        # add attr
        if not cmds.attributeQuery('slaveJoint', node=slaveJoint, exists=1):
            cmds.addAttr(slaveJoint, ln='slaveJoint', at='message')

        cmds.connectAttr(joint + '.slaveJoint', slaveJoint + '.slaveJoint', f=1)
        cmds.select(cl=1)

    # create slaveJoints for roll joints
    slaveRollJoints = []
    for joint in rollJoints:
        slaveJoint = cmds.joint(n='Slave_' + joint)
        cmds.select(cl=1)
        cmds.delete(cmds.parentConstraint(joint, slaveJoint, mo=0))
        slaveRollJoints.append(slaveJoint)

        # add attr
        if not cmds.attributeQuery('slaveJoint', node=slaveJoint, exists=1):
            cmds.addAttr(slaveJoint, ln='slaveJoint', at='message')

        cmds.connectAttr(joint + '.slaveJoint', slaveJoint + '.slaveJoint', f=1)
        cmds.select(cl=1)

    # create slaveJoints for normal Joints
    slaveNormalJoints = []
    for joint in normalJoints:
        slaveJoint = cmds.joint(n='Slave_' + joint)
        cmds.select(cl=1)
        cmds.delete(cmds.parentConstraint(joint, slaveJoint, mo=0))
        slaveNormalJoints.append(slaveJoint)

        # add attr
        if not cmds.attributeQuery('slaveJoint', node=slaveJoint, exists=1):
            cmds.addAttr(slaveJoint, ln='slaveJoint', at='message')

        cmds.connectAttr(joint + '.slaveJoint', slaveJoint + '.slaveJoint', f=1)
        cmds.select(cl=1)

    ##################################################################################
    # place and parenting the joint hierarchy correctly
    # TODO
    for joint in specialJoints:

        pass




