import maya.cmds as cmds

def dynamicParent():
    sel = cmds.ls(sl=1)

    locatorList = []
    for i in xrange(len(sel)-1):
        locator = cmds.spaceLocator(n=sel[i] + '_Loc')
        cmds.delete(cmds.parentConstraint(sel[i], locator, mo=0))
        locatorList.append(locator)

    group = cmds.group(n=sel[-1] + '_Grp', empty=1)
    cmds.delete(cmds.parentConstraint(sel[-1], group, mo=0))
    cmds.parent(sel[-1], group)

    cmds.select(cl=1)


