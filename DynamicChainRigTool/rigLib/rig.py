import maya.cmds as cmds
import lib
from ..utils import name
reload(lib)
reload(name)


def build(jointList, numCtrl, hairSystem=None):
    # get the prefixName
    prefixName = name.removeSuffix(jointList[0])

    # create input curve for hair system
    IK_List = lib.createSplineIK(jointList=jointList, prefixName=prefixName)
    inputCrv = IK_List[-1]

    cmds.delete(IK_List[0])

    # create FK control system
    FK_controlDict = lib.createCtrlSystem(jointList=jointList,
                                          numCtrl=numCtrl,
                                          curve=inputCrv)

    # create hairSystem by inputCrv
    inputCrvShape = cmds.listRelatives(inputCrv, c=1, p=0, s=1)[0]

    if not hairSystem:
        hairDict = lib.createHairSys(prefixName=prefixName)
    else:
        hairDict = hairSystem['hairShape']

    # create and add follicle
    follicle_curveOut_Dict = lib.createFollicle(curveShape=inputCrvShape,
                                                prefixName=prefixName)

    lib.addFollicle(follicleShape=follicle_curveOut_Dict['follicleShape'],
                    hairShape=hairDict['hairShape'])

    # create splineIK with output curve
    IK_List = lib.createSplineIK(jointList=jointList,
                                 prefixName=prefixName,
                                 curve=follicle_curveOut_Dict['curveTransNodeOut'])

    # rig the input curve with FK control system
    lib.rigInputCrv(fkJointList=FK_controlDict['fkJntList'], curveNode=inputCrv)

    ##############
    # Baked Part #
    ##############

    # create baked joint chain
    bakedJointList = lib.createBakedJointChain(jointList=jointList)

    # create baked FK controls
    baked_FK_Ctrls = lib.createBakedCtrlSystem(jointList=bakedJointList, prefixName=prefixName)

