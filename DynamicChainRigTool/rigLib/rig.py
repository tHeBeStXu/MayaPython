import maya.cmds as cmds
import lib
from ..utils import name
reload(lib)
reload(name)


def build(jointList, numCtrl, hairSystem=None):
    # get the prefixName
    prefixName = name.removeSuffix(jointList[0])

    # create attrs for origin joint list
    lib.addAttr2OriginJoints(originJoints=jointList)

    # create setting group
    settingGrp = lib.createSettingGrp(prefixName=prefixName)

    # create IK and Bake joint chain
    IK_Bake_JointList = lib.createIK_BakeJointChain(jointList=jointList)
    cmds.setAttr(IK_Bake_JointList['IKJointList'][0] + '.v', 0)
    cmds.setAttr(IK_Bake_JointList['bakeJointList'][0] + '.v', 0)

    # create switch system between IK and Bake joint chain
    lib.createSwitchSystem(originJointList=jointList,
                           IKJointList=IK_Bake_JointList['IKJointList'],
                           bakeJointList=IK_Bake_JointList['bakeJointList'],
                           settingGrp=settingGrp)

    # create input curve for hair system
    IK_List_Input = lib.createSplineIK(jointList=IK_Bake_JointList['IKJointList'], prefixName=prefixName)
    inputCrv = IK_List_Input[-1]

    cmds.delete(IK_List_Input[0])

    # create FK control system
    FK_Ctrl = lib.createCtrlSystem(jointList=IK_Bake_JointList['IKJointList'],
                                   prefixName=prefixName,
                                   numCtrl=numCtrl,
                                   curve=inputCrv)

    # create hairSystem by inputCrv
    inputCrvShape = cmds.listRelatives(inputCrv, c=1, p=0, s=1)[0]

    if not hairSystem:
        hair_nucleus = lib.createHairSys(prefixName=prefixName)
    else:
        hair_nucleus = {}
        hair_nucleus['hairShape'] = hairSystem
        hair_nucleus['nucleus'] = cmds.listConnections(hairSystem + '.startFrame', source=1, destination=0)[0]

    # create and add follicle
    follicle_outputCrv = lib.createFollicle(curveShape=inputCrvShape,
                                            prefixName=prefixName)

    lib.addFollicle(follicleShape=follicle_outputCrv['follicleShape'],
                    hairShape=hair_nucleus['hairShape'])

    # create splineIK with output curve
    IK_List_Output = lib.createSplineIK(jointList=IK_Bake_JointList['IKJointList'],
                                        prefixName=prefixName,
                                        curve=follicle_outputCrv['curveTransNodeOut'])

    # rig the input curve with FK control system
    lib.rigInputCrv(fkJointList=FK_Ctrl['fkJntList'], curveNode=inputCrv)

    ##############
    # Baked Part #
    ##############

    # create baked FK controls
    baked_FK_Ctrls = lib.createBakedCtrlSystem(jointList=IK_Bake_JointList['bakeJointList'],
                                               prefixName=prefixName)

    # connect settingGrp extra attr to specified attr
    lib.connectAttr(setGrp=settingGrp,
                    hair=hair_nucleus['hairShape'],
                    follicle=follicle_outputCrv['follicleShape'],
                    nucleus=hair_nucleus['nucleus'],
                    inputCrv=inputCrv,
                    outputCrv=follicle_outputCrv['curveTransNodeOut'],
                    IK_Handle=IK_List_Output[0],
                    FK_CtrlList=FK_Ctrl['FK_Ctrl_List'],
                    FK_CtrlGrp=FK_Ctrl['FK_CtrlGrp_List'][0],
                    Bake_FK_CtrlList=baked_FK_Ctrls['Bake_FK_ctrlList'],
                    Bake_FK_CtrlGrp=baked_FK_Ctrls['Bake_FK_ctrlGrpList'][0],
                    IKJointList=IK_Bake_JointList['IKJointList'],
                    bakeJointList=IK_Bake_JointList['bakeJointList'],
                    originJointList=jointList)
