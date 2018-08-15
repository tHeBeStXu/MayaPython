import maya.cmds as cmds
import copy


def dynamicParent():
    sel = cmds.ls(sl=1)

    locatorList = []
    for i in xrange(len(sel)-1):
        locator = cmds.spaceLocator(n=sel[i] + '_Loc')
        cmds.delete(cmds.parentConstraint(sel[i], locator, mo=0))
        locatorList.append(locator)

    DPGroup = cmds.group(n=sel[-1] + '_DPGrp', empty=1)
    cmds.delete(cmds.parentConstraint(sel[-1], DPGroup, mo=0))

    pcGroup = cmds.group(n=sel[-1] + '_pcDPGrp', empty=1)
    cmds.delete(cmds.parentConstraint(sel[-1], pcGroup, mo=0))

    cmds.parent(pcGroup, DPGroup)
    cmds.parent(sel[-1], pcGroup)

    newList = copy.deepcopy(locatorList)

    newList.insert(0, DPGroup)

    cmds.select(cl=1)

    for i in xrange(len(newList)):
        cmds.parentConstraint(newList[i], pcGroup, mo=0)

    parentConstraint = cmds.listRelatives(pcGroup, s=0, c=1, p=0, type='parentConstraint')[0]

    print newList

    #for i in xrange(len(newList)):



