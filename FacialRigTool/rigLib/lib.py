import maya.cmds as cmds
from ..base import control
from ..base import module
reload(control)
reload(module)


def createJoint(prefixName,
                jointNum,
                slaveAttr=True):
    """
    create
    :param prefixName:
    :param jointNum:
    :param slaveAttr:
    :return:
    """
    newJnt = cmds.joint(n=prefixName + '_Jnt_' + jointNum)

    if slaveAttr:
        if not cmds.attributeQuery('slaveJoint', node=newJnt, exists=1):
            cmds.addAttr(newJnt, longName='slaveJoint', at='message')

    return newJnt


def joint2Curve(prefixName,
                curve,
                numJnt=2,
                addSlaveAttr=True):

    if numJnt < 2:
        cmds.error('The numJnt must be larger than 2!')
        return

    eachADD = 1.0 / (len(range(numJnt)) - 1)

    jointList = []

    cmds.select(cl=1)

    for i in range(numJnt):

        newJnt = createJoint(prefixName=prefixName, jointNum=str(i), slaveAttr=addSlaveAttr)

        motionPath = cmds.pathAnimation(curve, newJnt, n=prefixName + '_motionPath', fractionMode=1, follow=1,
                                        followAxis='x', upAxis='z', worldUpType='scene',
                                        inverseUp=0, inverseFront=0, bank=0)
        cmds.cutKey(motionPath + '.u', time=())

        cmds.setAttr(motionPath + '.uValue', eachADD * float(i))

        for attr in ['t', 'r']:
            for axis in ['x', 'y', 'z']:
                cmds.delete(newJnt + '.%s%s' % (attr, axis), icn=1)

        cmds.delete(motionPath)

        cmds.select(cl=1)

        jointList.append(newJnt)

    return jointList
