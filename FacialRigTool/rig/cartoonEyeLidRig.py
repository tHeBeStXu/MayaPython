import maya.cmds as cmds
from ..rigLib import lib
from ..utils import name

reload(lib)
reload(name)

def createRig(vertexList,
              prefix='L_',
              rigPartName='EyeLid',
              eyeJoint='',
              ):
    cmds.select(cl=1)

    # create eyelid joint for each vertex
    eyeLidJointList = lib.vertex2Joints(vertexList=vertexList, prefix=prefix, rigPartName=rigPartName)

    # create eyelid parent joint for each eyelid joint
    eyeLidParentJntList = []
    for i in eyeLidJointList:
        cmds.select(cl=1)

        parentJoint = cmds.joint(n=i + '_Parent')

        cmds.delete(cmds.pointConstraint(eyeJoint, parentJoint, mo=0))

        cmds.delete(cmds.aimConstraint(i, parentJoint, aimVector=(1, 0, 0), upVector=(0, -1, 0),
                                       worldUpType='scene', weight=1, offset=(0, 0, 0), mo=0))
        cmds.parent(i, parentJoint)

        cmds.joint(i, e=1, oj='none', ch=1, zso=1)

        cmds.makeIdentity(parentJoint, apply=1, t=1, r=1, s=1)

        eyeLidParentJntList.append(parentJoint)

    cmds.select(cl=1)

    eyelidLocList = []
    # create locator for each eyelid joint
    for i in eyeLidParentJntList:

        cmds.select(cl=1)

        eyelidJoint = cmds.listRelatives(i, c=1, type='joint', shapes=0)[0]

        ikHandle = cmds.ikHandle(n=eyelidJoint + '_IK', sj=i, ee=eyelidJoint, sol='ikSCsolver')

        eyelidLoc = cmds.spaceLocator(n=eyelidJoint + '_LOC')

        cmds.delete(cmds.parentConstraint(eyelidJoint, eyelidLoc, mo=0))

        cmds.select(cl=1)
        cmds.parent(ikHandle[0], eyelidLoc)

        eyelidLocList.append(eyelidLoc)

    cmds.select(cl=1)

    # create high definition curve
    posList = []
    for i in eyelidLocList:
        pos = cmds.xform(i, q=1, ws=1, t=1)
        posList.append(pos)

    kList = []
    for i in xrange(len(posList)):
        kList.append(i)

    highDefCurve = cmds.curve(n=prefix + rigPartName + '_HD_Crv', p=posList, k=kList, d=1)
    lowDefCurve = cmds.duplicate(highDefCurve, n=prefix + rigPartName + '_LD_Crv')

    highDefCurveShape = cmds.listRelatives(highDefCurve, p=0, c=0, s=1)[0]
    cmds.select(cl=1)

    # make each locator attach to the curve

    for i in eyelidLocList:
        pos = cmds.xform(i, q=1, ws=1, t=1)
        uParam = lib.getUParam(pos, highDefCurveShape)

        PCI = cmds.createNode('pointOnCurveInfo', n=name.removeSuffix(i) + '_PCI')

        cmds.connectAttr(highDefCurveShape + '.worldSpace', PCI + '.inputCurve')

        cmds.setAttr(PCI + '.parameter', uParam)

        cmds.connectAttr(PCI + '.position', i + '.t')

        cmds.select(cl=1)

    # make HD curve deformed by LD curve
    lowDefCurve = cmds.rebuildCurve(lowDefCurve, ch=0, rpo=1, rt=0, end=1, kr=0, kcp=0, kep=1, kt=0, s=3, d=3)
    cmds.select(cl=1)

    wireDefomer = cmds.wire(highDefCurve, gw=0, en=1, ce=0, li=0, w=lowDefCurve)
    cmds.select(cl=1)







