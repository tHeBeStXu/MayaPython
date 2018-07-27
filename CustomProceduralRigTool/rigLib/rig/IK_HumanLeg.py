"""
build IK LEG
"""
import maya.cmds as cmds

from ..base import control
from ..base import module

from ..utils import name
from ..utils import joint
from ..utils import createNode

def build(topJoint,
          pvLocator,
          revLocator,
          prefix='',
          rigScale=1.0,
          rollCtrlLOC='',
          baseRig=None):
    """
    build the IK_leg with specified parameters
    :param topJoint: str, top joint of leg
    :param pvLocator: str, reference locator for position of pole Vector
    :param revLocator: list(str), CBank - EBank - heel - pivot 
    :param prefix: str, prefix to name new objects, 'L_','R_'and'C_'
    :param rigScale: float, scale factor for size controls
    :param baseRig: instance of base.module.Base class
    :return: 
    """
    # get joint chain
    legJoints = joint.listHierarchy(topJoint=topJoint, withEndJoints=True)

    # make rig module
    rigmodule = module.Module(prefix=prefix,
                              baseObject=baseRig)

    # make attach groups
    bodyAttachGrp = cmds.group(n=prefix + 'bodyAttach_grp',
                               em=1, p=rigmodule.partsGrp)

    baseAttachGrp = cmds.group(n=prefix + 'baseAttach_grp',
                               em=1, p=rigmodule.partsGrp)

    # create footCtrl
    footCtrl = control.Control(prefix=prefix + 'foot',
                               translateTo=legJoints[-1],
                               rotateTo=legJoints[-1],
                               scale=rigScale,
                               parent=rigmodule.controlGrp,
                               shape='footControl')

    # create rollCtrl
    rollCtrl = control.Control(prefix=prefix + 'roll',
                               translateTo=rollCtrlLOC,
                               scale=rigScale,
                               parent=footCtrl.C,
                               shape='rotationControl',
                               lockChannels=['t', 's', 'v'])
    cmds.hide(rollCtrlLOC)

    # add toe2Ball attr
    cmds.addAttr(rollCtrl.C, ln='toe2Ball', at='float', min=0, max=1, k=1)

    # create poleVectorCtrl
    pvCtrl = control.Control(prefix=prefix + 'poleVec',
                             translateTo=pvLocator,
                             scale=rigScale,
                             parent=footCtrl.C,
                             shape='diamond',
                             lockChannels=['r', 's', 'v'])
    cmds.hide(pvLocator)

    # legJoints = ['L_Skin_hip', 'L_Skin_knee', 'L_Skin_ankle', 'L_Skin_ball', 'L_Skin_toe']
    # get the last 3 joints in reversed order
    last3Jnts = legJoints[-3:]
    last3Jnts.reverse()

    # create Rev LOC
    for jnt in last3Jnts:
        locName = name.removePrefix(jnt)
        loc = cmds.spaceLocator(n=locName+'_LOC')[0]
        cmds.delete(cmds.pointConstraint(jnt, loc, mo=0))
        revLocator.append(loc)
    cmds.hide(revLocator)

    # create Rev Joints
    revJoints = joint.createRevJnts(revLocator=revLocator,
                                    orientCtrl=footCtrl.C,
                                    suffix='_Rev')
    # hide revJoints
    cmds.hide(revJoints)

    # create ankleIK
    ankleIK = cmds.ikHandle(n=prefix+'Main_ikh',
                            sol='ikRPsolver',
                            sj=legJoints[0],
                            ee=legJoints[2])[0]

    cmds.hide(ankleIK)
    cmds.parent(ankleIK, revJoints[-1])

    # create ballIK
    ballIK = cmds.ikHandle(n=prefix+'ball_ikh',
                           sol='ikSCsolver',
                           sj=legJoints[2],
                           ee=legJoints[3])[0]

    cmds.hide(ballIK)
    cmds.parent(ballIK, revJoints[-2])

    # create toeIK
    toeIk = cmds.ikHandle(n=prefix+'toe_ikh',
                          sol='ikSCsolver',
                          sj=legJoints[3],
                          ee=legJoints[-1])[0]

    cmds.hide(toeIk)
    cmds.parent(toeIk, revJoints[-3])

    # parent revJoints to footCtrl
    cmds.parent(revJoints[0], footCtrl.C)



    # poleVector Constraint
    cmds.poleVectorConstraint(pvCtrl.C, ankleIK)

    # parent legJoints to joint rigmodule.jointGrp
    cmds.parent(legJoints[0], rigmodule.jointsGrp)

    # attach IKpoleVector to bodyAttachGrp
    cmds.parentConstraint(bodyAttachGrp, pvCtrl.Off, mo=1)
    cmds.parentConstraint(bodyAttachGrp, footCtrl.Off, mo=1)

    ##############################
    # createNode and connectAttr #
    ##############################

    ##########
    # Roll Y #
    ##########
    rollNodeY_CD = createNode.createNode(nodeStr='condition',
                                         prefix=prefix,
                                         name='footRoll_Y')
    # connect Attr
    cmds.connectAttr(rollCtrl.C + '.rotateY', rollNodeY_CD + '.firstTerm', f=1)
    # set Operation Attr to greaterThan
    cmds.setAttr(rollNodeY_CD + '.operation', 2)

    cmds.connectAttr(rollCtrl.C + '.rotateY', rollNodeY_CD + '.colorIfTrueG', f=1)
    cmds.connectAttr(rollCtrl.C + '.rotateY', rollNodeY_CD + '.colorIfFalseR', f=1)
    cmds.setAttr(rollNodeY_CD + '.colorIfFalseG', 0)

    cmds.connectAttr(rollNodeY_CD + '.outColorG', revJoints[1] + '.rotateY', f=1)
    cmds.connectAttr(rollNodeY_CD + '.outColorR', revJoints[0] + '.rotateY', f=1)

    ##########
    # Roll Z #
    ##########
    cmds.connectAttr(rollCtrl.C + '.rotateZ', revJoints[3] + '.rotateZ', f=1)

    ##########
    # Roll X #
    ##########
    rollNodeX_CD = createNode.createNode(nodeStr='condition',
                                         prefix=prefix,
                                         name='footRoll_X')
    rollNodeX_BLD = createNode.createNode(nodeStr='blendColors',
                                          prefix=prefix,
                                          name='footRoll_X')

    # connect Attr
    cmds.connectAttr(rollCtrl.C + '.rotateX', rollNodeX_CD + '.firstTerm', f=1)

    cmds.setAttr(rollNodeX_CD + '.operation', 2)

    cmds.connectAttr(rollCtrl.C + '.rotateX', rollNodeX_CD + '.colorIfTrueG', f=1)
    cmds.connectAttr(rollCtrl.C + '.rotateX', rollNodeX_CD + '.colorIfFalseR', f=1)
    cmds.setAttr(rollNodeX_CD + '.colorIfFalseG', 0)

    cmds.connectAttr(rollNodeX_CD + '.outColorR', revJoints[2] + '.rotateX', f=1)
    cmds.connectAttr(rollNodeX_CD + '.outColorG', rollNodeX_BLD + '.color1R')
    cmds.connectAttr(rollNodeX_CD + '.outColorG', rollNodeX_BLD + '.color2G')

    cmds.connectAttr(rollNodeX_BLD + '.outputG', revJoints[4] + '.rotateX')
    cmds.connectAttr(rollNodeX_BLD + '.outputR', revJoints[5] + '.rotateX')

    cmds.connectAttr(rollCtrl.C + '.toe2Ball', rollNodeX_BLD + '.blender')

    # return
    return {'module': rigmodule, 'baseAttachGrp': baseAttachGrp, 'bodyAttachGrp': bodyAttachGrp}
