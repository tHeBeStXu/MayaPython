import maya.cmds as cmds
from ..base import module
from ..base import control
from ..rigLib import lib

reload(lib)
reload(module)
reload(control)


def createRig(selectedLines,
              prefix='L_',
              rigPartName='',
              numJnt = 3,
              rigScale=1.0,
              addSliderCtrls=True,
              ):

    cmds.select(cl=1)

    # create module
    rigModule = module.Module(prefix=prefix,
                              rigPartName=rigPartName)

    # create line
    targetLine = lib.createCurve(edgeList=selectedLines)

    # create joint along the curve
    jointList = lib.joint2Curve(prefix=prefix,
                                partName=rigPartName,
                                curve=targetLine,
                                numJnt=numJnt)

    # create controller for each joint
    jointCtrlList = []
    jointCtrlGrpList = []
    for i in jointList:
        jointCtrl = control.Control(prefix=i,
                                    rigPartName='',
                                    scale=rigScale,
                                    translateTo=i,
                                    rotateTo=i,
                                    shape='circleY')

        cmds.parent(i, jointCtrl.C)

        jointCtrlList.append(jointCtrl.C)
        jointCtrlGrpList.append(jointCtrl.Off)

    # connect the attribute
    for i in jointList:
        cmds.connectAttr(rigModule.topGrp + '.' + prefix + rigPartName + '_Jnt',
                         i + '.' + prefix + rigPartName, f=1)

    # for each joint create the slide control
    slideCtrlGrpList = []
    if addSliderCtrls:
        for i in xrange(len(jointList)):
            sliderCtrl = control.Control(prefix=prefix,
                                         rigPartName=rigPartName + '_Jnt_' + str(i) + '_SLD',
                                         scale=rigScale,
                                         shape='verticalSliderControl',
                                         lockChannels=['tx', 'ty', 'rx', 'ry', 'rz', 'sx', 'sy', 'sz', 'v'])

            slideCtrlGrpList.append(sliderCtrl.Off)

    # create a main Control for


    # clean hierarchy
    cmds.parent(targetLine, rigModule.dontTouchGrp)

    for i in jointCtrlGrpList:
        cmds.parent(i, rigModule.topGrp)

