"""
This IK_FK_Spine build module is used for spine joint chain which is placed in the 0 x-Axis position.
if you want to use it at anywhere
"""
import maya.cmds as cmds
from ..base import module
from ..base import control


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
    rigModule = module.Module(prefix=prefix,
                              rigPartName='Spine',
                              baseObject=baseRig)

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
    fkJntList_rev = []

    for i in fkJntList:
        fkJntList_rev.append(i)
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
    cmds.makeIdentity(fkJntList[0], apply=1)

    ##########
    # FK rig #
    ##########

    preParent = fkJntList[0]
    FK_Ctrl_List = []

    for i in xrange(len(fkJntList)-2):

        FK_C_Spine_Ctrl = control.Control(prefix='FK_' + prefix,
                                          rigPartName='Spine',
                                          scale=rigScale,
                                          translateTo=fkJntList[i+1],
                                          rotateTo=fkJntList[i+1],
                                          parent=preParent,
                                          shape='circleX')

        cmds.orientConstraint(FK_C_Spine_Ctrl.C, fkJntList[i+1], mo=0)

        preParent = FK_C_Spine_Ctrl.C

        FK_Ctrl_List.append(FK_C_Spine_Ctrl.Off)

        cmds.select(cl=1)

    #############
    # Body Ctrl #
    #############

    # create a square control shape for body ctrl

    body_Ctrl = control.Control(prefix=prefix,
                                rigPartName='Body',
                                scale=rigScale,
                                translateTo=spineJoints[0],
                                rotateTo=spineJoints[0],
                                parent=rigModule.topGrp
                                )


    C_Pelvis_Ctrl = control.Control(prefix=prefix,
                                    rigPartName='Pelvis',
                                    scale=rigScale,
                                    translateTo=spineJoints[0],
                                    rotateTo=spineJoints[0],
                                    parent=body_Ctrl.C,
                                    shape='moveControl')
    # rotate Cpelvis_Ctrl

    C_Chest_Ctrl = control.Control(prefix=prefix,
                                   rigPartName='Chest',
                                   scale=rigScale,
                                   translateTo=spineJoints[-1],
                                   rotateTo=spineJoints[-1],
                                   parent=fkJntList[-1],
                                   shape='moveControl')
    # rotate C_Chest_Ctrl

    # create 2 joints for controlling ikHandle curve
    pelvis_Jnt = cmds.joint(n=prefix + 'Pelvis')
    cmds.select(cl=1)
    chest_Jnt = cmds.joint(n=prefix + 'Chest')
    cmds.select(cl=1)

    pc1 = cmds.parentConstraint(spineJoints[0], pelvis_Jnt, mo=0)
    cmds.delete(pc1)
    cmds.parent(pelvis_Jnt, C_Pelvis_Ctrl.C)

    pc2 = cmds.parentConstraint(spineJoints[-1], chest_Jnt, mo=0)
    cmds.delete(pc2)
    cmds.parent(chest_Jnt, C_Chest_Ctrl.C)

    ##########
    # IK rig #
    ##########

    IK_Part_List = cmds.ikHandle(n=prefix + 'Spine_IK',
                                 sj=spineJoints[0],
                                 ee=spineJoints[-1],
                                 parentCurve=0,
                                 sol='ikSplineSolver')











