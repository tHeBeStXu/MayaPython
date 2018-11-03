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

    # get special normal inputJoints
    specialNormalJoints = []
    if targetJoints:
        for joint in targetJoints:
            if cmds.attributeQuery('slaveParent', node=joint, exists=1) and not cmds.attributeQuery('rollJoint', node=joint, exists=1):
                if not cmds.attributeQuery('slavePointConst', node=joint, exists=1):
                    specialNormalJoints.append(joint)

    # get normal inputJoints
    normalJoints = []
    for joint in targetJoints:
        if joint not in rollJoints and joint not in specialJoints and joint not in specialNormalJoints:
            normalJoints.append(joint)

    cmds.select(cl=1)

    print len(normalJoints + specialNormalJoints + specialJoints + rollJoints)
    print len(targetJoints)

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

    # create slaveJoints for special normal joints
    slaveSpecialNormalJoints = []
    for joint in specialNormalJoints:
        slaveJoint = cmds.joint(n='Slave_' + joint)
        cmds.select(cl=1)
        cmds.delete(cmds.parentConstraint(joint, slaveJoint, mo=0))
        slaveSpecialNormalJoints.append(slaveJoint)

        # add attr
        if not cmds.attributeQuery('slaveJoint', node=slaveJoint, exists=1):
            cmds.addAttr(slaveJoint, ln='slaveJoint', at='message')

        cmds.connectAttr(joint + '.slaveJoint', slaveJoint + '.slaveJoint', f=1)
        cmds.select(cl=1)

    #####################################################
    # place and parenting the joint hierarchy correctly #
    #####################################################

    # slave normal joint
    for joint in slaveNormalJoints:

        drivenJoint = cmds.listConnections(joint + '.slaveJoint', source=1, destination=0, type='joint')[0]

        # Constraint
        cmds.pointConstraint(drivenJoint, joint, mo=0)
        cmds.orientConstraint(drivenJoint, joint, mo=0)
        cmds.scaleConstraint(drivenJoint, joint, mo=0)

        # parenting
        drivenJointParent = cmds.listRelatives(drivenJoint, c=0, p=1, s=0, path=1, type='joint')

        if drivenJointParent:
            drivenJointParentSlave = cmds.listConnections(drivenJointParent[0] + '.slaveJoint',
                                                          source=0, destination=1, type='joint')[0]

            if drivenJointParentSlave:
                cmds.parent(joint, drivenJointParentSlave)

        cmds.select(cl=1)

    # slave roll joint
    for joint in slaveRollJoints:
        drivenJoint = cmds.listConnections(joint + '.slaveJoint', source=1, destination=0, type='joint')[0]

        # Constraint
        cmds.pointConstraint(drivenJoint, joint, mo=0)
        cmds.orientConstraint(drivenJoint, joint, mo=0)
        cmds.scaleConstraint(drivenJoint, joint, mo=0)

        # parenting
        if not drivenJoint:
            continue

        if cmds.attributeQuery('slaveParent', node=drivenJoint, exists=1):
            drivenJointParent = cmds.getAttr(drivenJoint + '.slaveParent')

            if cmds.attributeQuery('slaveJoint', node=drivenJointParent, exists=1):
                drivenJointParentSlave = cmds.listConnections(drivenJointParent + '.slaveJoint',
                                                              source=0, destination=1, type='joint')[0]

                if drivenJointParentSlave:
                    cmds.parent(joint, drivenJointParentSlave)

        if not cmds.attributeQuery('slaveParent', node=drivenJoint, exists=1):
            drivenJointParent = cmds.listRelatives(drivenJoint, p=1, s=0, c=0, type='joint', path=1)[0]

            if cmds.attributeQuery('slaveJoint', node=drivenJointParent, exists=1):
                drivenJointParentSlave = cmds.listConnections(drivenJointParent + '.slaveJoint',
                                                              source=0, destination=1, type='joint')[0]

                if drivenJointParentSlave:
                    cmds.parent(joint, drivenJointParentSlave)

        cmds.select(cl=1)

    # slave special normal joint
    for joint in slaveSpecialNormalJoints:
        drivenJoint = cmds.listConnections(joint + '.slaveJoint', source=1, destination=0, type='joint')[0]

        # Constraint
        cmds.pointConstraint(drivenJoint, joint, mo=0)
        cmds.orientConstraint(drivenJoint, joint, mo=0)
        cmds.scaleConstraint(drivenJoint, joint, mo=0)

        # parenting
        if cmds.attributeQuery('slaveParent', node=drivenJoint, exists=1):
            drivenJointParent = cmds.getAttr(drivenJoint + '.slaveParent')

            if cmds.attributeQuery('slaveJoint', node=drivenJointParent, exists=1):
                drivenJointParentSlave = cmds.listConnections(drivenJointParent + '.slaveJoint',
                                                              source=0, destination=1, type='joint')[0]

                if drivenJointParentSlave:
                    cmds.parent(joint, drivenJointParentSlave)

        cmds.select(cl=1)

    # slave special joint
    for joint in slaveSpecialJoints:
        drivenJoint = cmds.listConnections(joint + '.slaveJoint', source=1, destination=0, type='joint')[0]

        # Constraint
        if cmds.attributeQuery('slavePointConst', node=drivenJoint, exists=1):
            drivenJointPoint = cmds.getAttr(drivenJoint + '.slavePointConst')

            if drivenJointPoint:
                cmds.pointConstraint(drivenJointPoint, joint, mo=0)

        cmds.orientConstraint(drivenJoint, joint, mo=0)
        cmds.scaleConstraint(drivenJoint, joint, mo=0)

        # parenting
        if cmds.attributeQuery('slaveParent', node=drivenJoint, exists=1):
            drivenJointParent = cmds.getAttr(drivenJoint + '.slaveParent')

            if cmds.attributeQuery('slaveJoint', node=drivenJointParent, exists=1):
                drivenJointParentSlave = cmds.listConnections(drivenJointParent + '.slaveJoint',
                                                              source=0, destination=1, type='joint')[0]

                if drivenJointParentSlave:
                    cmds.parent(joint, drivenJointParentSlave)

        cmds.select(cl=1)
