from maya import cmds


def build(rollStart,
          rollEnd,
          roll_Parent,
          IK_Parent,
          numRollJoints=1,
          rollWithSameDir=True
          ):
    """
    create a single bone roll joints chain with desired roll joints, blend rotation between rollStart and rollEnd joints
    :param rollStart: str, create roll joints from rollStart joint
    :param rollEnd: str, create roll joints ends at rollEnd joint
    :param roll_Parent: str, parent ik_roll_joints to roll_Parent joint.
                        If rollWithSameDir is True, rollParent is the joint above rollStart joint by 1 step
                        example: upper arm: Clavical; hip: body_pivot or c_spine_0
                        If rollWithSameDir is False, rollParent is the rollStart joint
                        example: lower arm: Elbow
    :param IK_Parent: str, parent ik handle to the IK_Parent joints
                        If rollWithSameDir is True, rollParent is the joint above rollStart joint by 1 step
                        example: upper arm: Clavical; hip: body_pivot or c_spine_0
                        If rollWithSameDir is False, rollParent is the rollStart joint
                        example: lower arm: Wrist
    :param numRollJoints: int, number of roll joints between rollStart joint and rollEnd joint
    :param rollWithSameDir: bool, whether the roll joints are the same generation direction
                            with the original joints chain direction
    :return: None
    """
    # create the start and end roll joints
    rollStart_Jnt = cmds.joint(n=rollStart + '_Roll_Start')
    cmds.select(cl=1)
    rollEnd_Jnt = cmds.joint(n=rollStart + '_Roll_End')
    cmds.select(cl=1)

    # transform the joint
    pc1 = cmds.parentConstraint(rollStart, rollStart_Jnt, mo=0)
    cmds.delete(pc1)
    pc2 = cmds.parentConstraint(rollEnd, rollEnd_Jnt, mo=0)
    cmds.delete(pc2)

    # freeze transformation
    cmds.makeIdentity(rollStart_Jnt, apply=1)
    cmds.makeIdentity(rollEnd_Jnt, apply=1)

    # parent and get the .tx attribute
    cmds.parent(rollEnd_Jnt, rollStart_Jnt)
    totalLength = cmds.getAttr(rollEnd_Jnt + '.tx')

    eachLeagth = totalLength / (numRollJoints + 1)

    # create IK Handle
    ikHandle = cmds.ikHandle(n=rollStart + '_Roll_IK', sj=rollStart_Jnt, ee=rollEnd_Jnt, s='sticky', sol='ikSCsolver')
    print ikHandle
    cmds.parent(ikHandle, IK_Parent)
    cmds.pointConstraint(rollEnd, ikHandle[0], mo=0)

    if rollWithSameDir:
        rollDir = rollStart
        rollOrient = rollStart
        # create middle roll joints and transform it
        for i in range(0, numRollJoints):
            middleRoll_Jnt = cmds.duplicate(rollEnd_Jnt, n=rollStart + '_Roll_' + str(i + 1))
            cmds.setAttr(middleRoll_Jnt[0] + '.tx', eachLeagth * (int(i) + 1))
            cmds.parent(middleRoll_Jnt, rollDir)

            oc = cmds.orientConstraint(rollOrient, rollStart_Jnt, middleRoll_Jnt, mo=0)
            cmds.setAttr(oc[0] + '.' + rollStart_Jnt + 'W1', (len(range(0, numRollJoints)) - int(i)))
            cmds.setAttr(oc[0] + '.' + rollOrient + 'W0', (int(i) + 1))
    else:
        rollDir = rollEnd
        rollOrient = rollEnd
        # create middle roll joints and transform it
        for i in range(0, numRollJoints):
            middleRoll_Jnt = cmds.duplicate(rollEnd_Jnt, n=rollStart + '_Roll_' + str(i + 1))
            cmds.setAttr(middleRoll_Jnt[0] + '.tx', eachLeagth * (int(i) + 1))
            cmds.parent(middleRoll_Jnt, rollDir)

            oc = cmds.orientConstraint(rollOrient, rollStart, middleRoll_Jnt, mo=0)
            cmds.setAttr(oc[0] + '.' + rollStart + 'W1', (len(range(0, numRollJoints)) - int(i)))
            cmds.setAttr(oc[0] + '.' + rollOrient + 'W0', (int(i) + 1))

    # parent the
    cmds.parent(rollStart_Jnt, roll_Parent)

    cmds.select(cl=1)
