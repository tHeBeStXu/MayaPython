"""
IK FK Spine @ rig
"""

import maya.cmds as cmds

from ..base import module
from ..base import control

from ..utils import joint


def build(spineJoints,
          prefix,
          fkSpineCrv,
          rigScale,
          baseRig=None):
    """
    build the IKFK spine with specified parameters
    :param spineJoints: list(str), list of spine joints ['spine01', 'spine02', 'spine03', ...]
    :param prefix: str, prefix to name new objects
    :param baseRig: instance of base.module.Base class
    :param fkSpineCrv: str, the assistance of building fkJoints
    :param rigScale: float, scale factor for size controls
    :return: 
    """

    rigmodule = module.Module(prefix=prefix,
                              rigPartName='Spine',
                              baseObject=baseRig)

    # create spineRoot Ctrl
    spineBodyCtrl = control.Control(prefix=prefix + '_Body',
                                    translateTo=spineJoints[0],
                                    rotateTo=spineJoints[0],
                                    scale=rigScale*10,
                                    shape='circleX',
                                    parent=rigmodule.topGrp)

    ###########
    # FK Part #
    ###########

    fkCurveCVs = cmds.ls(fkSpineCrv + '.cv[*]', fl=1)

    fkJointsParts = joint.createFKjnts(CurveCVs=fkCurveCVs,
                                  orientObj=spineJoints[0],
                                  prefix=prefix)
    fkJoints = fkJointsParts['fkJoints']
    fkClusters = fkJointsParts['fkClusters']
    cmds.parent(fkClusters, rigmodule.partsGrp)

    # Freeze transformation fkJoints
    cmds.makeIdentity(fkJoints[0], apply=1, t=1, r=1, s=1)
    # set fkJoints.drawStyle to None, just like hide fkJoints
    for jnt in fkJoints:
        cmds.setAttr(jnt + '.drawStyle', 2)

    # create FK Ctrl
    fkCtrl1 = control.Control(prefix=prefix + '_FK1',
                              translateTo=fkJoints[1],
                              rotateTo=fkJoints[1],
                              scale=rigScale*5,
                              shape='circleX',
                              parent=spineBodyCtrl.C,
                              lockChannels=['t', 's', 'v'])

    fkCtrl2 = control.Control(prefix=prefix + '_FK2',
                              translateTo=fkJoints[2],
                              rotateTo=fkJoints[2],
                              scale=rigScale*4,
                              shape='circleX',
                              parent=fkCtrl1.C,
                              lockChannels=['t', 's', 'v'])
    # hide fkSpineCrv
    cmds.hide(fkSpineCrv)
    cmds.parent(fkSpineCrv, rigmodule.partsGrp)

    # orient constraint
    cmds.orientConstraint(fkCtrl1.C, fkJoints[1], mo=0)

    cmds.orientConstraint(fkCtrl2.C, fkJoints[2], mo=0)

    ############
    # IK PARTS #
    ############

    # spine Ctrl
    pelvisCtrl = control.Control(prefix=prefix + '_IK_pelvis',
                                 translateTo=spineJoints[0],
                                 rotateTo=spineJoints[0],
                                 scale=rigScale*8,
                                 shape='circleX',
                                 parent=spineBodyCtrl.C)

    chestCtrl = control.Control(prefix=prefix + '_IK_chest',
                                translateTo=spineJoints[-1],
                                rotateTo=spineJoints[-1],
                                scale=rigScale*8,
                                shape='circleX',
                                parent=fkJoints[-1])

    # spine IK
    # parentCurve should be False
    splineIKlist = cmds.ikHandle(n=prefix + '_ikh',
                                 sol='ikSplineSolver',
                                 sj=spineJoints[0],
                                 ee=spineJoints[-1],
                                 parentCurve=False)

    spineIK = splineIKlist[0]
    spineCrv = cmds.rename(splineIKlist[2], prefix + '_Crv')

    cmds.hide(spineIK, spineCrv)

    # duplicate fkJnt
    chestJnt = cmds.duplicate(fkJoints[-1], n=prefix + '_IK_ChestJnt', parentOnly=1)
    cmds.parent(chestJnt, w=1)
    cmds.delete(cmds.pointConstraint(fkJoints[-1], chestJnt))
    pelvisJnt = cmds.duplicate(fkJoints[-1], n=prefix + '_IK_PelvisJnt', parentOnly=1)
    cmds.parent(pelvisJnt, w=1)
    cmds.delete(cmds.pointConstraint(fkJoints[0], pelvisJnt))

    # parent chestJnt
    cmds.parent(chestJnt, chestCtrl.C)
    cmds.parent(pelvisJnt, pelvisCtrl.C)

    # bind spineCrv to chestJnt and pelvisJnt
    cmds.select(cl=1)
    cmds.select(spineCrv)
    cmds.select(chestJnt, add=1)
    cmds.select(pelvisJnt, add=1)

    cmds.skinCluster(chestJnt, pelvisJnt, spineCrv, tsb=1)


    # setup IK twist
    cmds.setAttr(spineIK + '.dTwistControlEnable', 1)
    cmds.setAttr(spineIK + '.dWorldUpType', 4)
    cmds.connectAttr(pelvisCtrl.C + '.worldMatrix[0]', spineIK + '.dWorldUpMatrix')
    cmds.connectAttr(chestCtrl.C + '.worldMatrix[0]', spineIK + '.dWorldUpMatrixEnd')

    # parenting
    cmds.parent(fkJoints[0], spineBodyCtrl.C)

    cmds.parent(spineJoints[0], rigmodule.jointsGrp)

    cmds.parent(spineCrv, spineIK, rigmodule.dontTouchGrp)

    # clear selection before return
    cmds.select(cl=1)

    return {'module': rigmodule, 'spineBodyCtrl': spineBodyCtrl}
