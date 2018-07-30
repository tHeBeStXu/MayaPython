"""
This IK_FK_Spine build module is used for spine joint chain which is placed in the 0 x-Axis position.
if you want to use it at anywhere
"""
import maya.cmds as cmds
#from ..base import module


def build(spineJoints,
          prefix,
          rigScale,
          numFK_Jnt=2,
          baseRig=None):
    """

    :param spineJoints:
    :param prefix:
    :param rigScale:
    :param baseRig:
    :return:
    """
    #rigModule = module.Module(prefix=prefix,
    #                          rigPartName='Spine',
    #                          baseObject=baseRig)

    # fk skeleton chain
    # create FK crv
    ik_part_list = []
    ik_part_list = cmds.ikHandle(sj=spineJoints[0], ee=spineJoints[-1], parentCurve=0, sol='ikSplineSolver')

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

    # aimConstraint all the fk_joints, the last joints must be same direction as the last joints of original joints list
    fkJntList_rev = fkJntList
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

    # freeze transformation
    cmds.makeIdentity(fkJntList[-1], apply=1)




