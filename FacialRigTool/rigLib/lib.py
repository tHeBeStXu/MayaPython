import maya.cmds as cmds
from ..base import control
from ..base import module
reload(control)
reload(module)


def createJoint(prefixName,
                jointNum,
                slaveAttr=True):
    """
    create new joint and add extra attributes.
    :param prefixName: str, prefix name of the joint
    :param jointNum: str, joint suffix number
    :param slaveAttr: bool, whether create slaver attr(for generate and connect to the slave joint) and prefix attr(for
                            connecting to the module group)
    :return: created new joint
    """
    newJnt = cmds.joint(n=prefixName + '_Jnt_' + jointNum, radius=0.2)

    if slaveAttr:
        if not cmds.attributeQuery('slaveJoint', node=newJnt, exists=1):
            cmds.addAttr(newJnt, longName='slaveJoint', at='message')

        if not cmds.attributeQuery(prefixName, node=newJnt, exists=1):
            cmds.addAttr(newJnt, longName=prefixName, at='message')

    return newJnt


def joint2Curve(prefix,
                partName,
                curve,
                numJnt=2,
                addSlaveAttr=True,
                zeroRot=True):
    """
    create joints along the curve
    :param prefix: str, prefix of the joint
    :param partName: str, rig part name of the joint
    :param curve: str, along the curve
    :param numJnt: int, number of the joints
    :param addSlaveAttr: bool, whether add slave joint attr
    :param zeroRot: bool, whether zero the rotation of the joint
    :return: list(str), return the create joint list
    """

    if numJnt < 2:
        cmds.error('The numJnt must be larger than 2!')
        return

    eachADD = 1.0 / (len(range(numJnt)) - 1)

    jointList = []

    cmds.select(cl=1)

    for i in range(numJnt):

        newJnt = createJoint(prefixName=prefix + partName, jointNum=str(i), slaveAttr=addSlaveAttr)

        motionPath = cmds.pathAnimation(curve, newJnt, n=prefix + partName + '_motionPath', fractionMode=1, follow=1,
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

        if zeroRot:
            cmds.setAttr(newJnt + '.r', 0, 0, 0)

    return jointList


def createCurve(curveList,
                rebuild=True,
                spans=4):
    """
    Create a fine curve from selection
    :param curveList: list(str), curve list to created new curve.
    :param rebuild: bool, whether rebuild the created line or not.
    :param spans: int, if rebuild the created line, spans of the rebuilded curve.
    :return: str, new curve.
    """
    # create each line
    curves = []
    if curveList and len(curveList) >= 2:
        for crv in curveList:
            curve = cmds.polyToCurve(crv, form=0, degree=1, ch=0)[0]
            curves.append(curve)

    else:
        cmds.error('Please select at least 2 lines!')
        return
    # attach each line and clean the trash lines
    outputCurve = []
    if curves:
        outputCurve = cmds.attachCurve(curves[:], ch=0, method=0, kmk=0)

    trashGrp = cmds.group(em=1)
    for i in xrange(len(outputCurve) - 1):
        cmds.parent(outputCurve[i+1], trashGrp)

    cmds.delete(trashGrp)

    # if needed, rebuild the attached line
    finalCurve = None

    if rebuild and spans:
        finalCurve = cmds.rebuildCurve(outputCurve[0], ch=0, degree=3, spans=spans, end=1, rebuildType=0)
    else:
        finalCurve = outputCurve[0]

    return finalCurve
