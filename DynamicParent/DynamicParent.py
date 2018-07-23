import maya.cmds as cmds


def PL_DynamicParenting():
    sel = cmds.ls(sl=1)
    sizeSel = len(sel)

    if sizeSel == 1:
        cmds.error('Not Enough objects selected')

    # last selected object
    constrainedObj = sel[sizeSel - 1]

    # create 2 empty groups
    DPsetGroup = cmds.group(empty=1, n=constrainedObj + '_DynPCnsGroup')

    DPgroup = cmds.group(empty=1, n=constrainedObj + '_DynPGroup')

    # position groups
    pc1 = cmds.parentConstraint(constrainedObj, DPsetGroup, mo=0)
    pc2 = cmds.parentConstraint(constrainedObj, DPgroup, mo=0)

    cmds.delete(pc1)
    cmds.delete(pc2)

    # parent
    cmds.parent(constrainedObj, DPsetGroup)
    cmds.parent(DPsetGroup, DPgroup)

    #
    sel = sel[0:-1]
    print sel
    sel.insert(0, DPgroup)
    print sel

    # parentconstraint all objects to lasts parent group

    for i in sel:
        cmds.parentConstraint(i, DPsetGroup, mo=0)

    # add seporator attribute
    cmds.addAttr(constrainedObj, ln='DynParent', at='enum', en='------')
    cmds.setAttr(constrainedObj + '.DynParent', lock=1, e=1, keyable=1)

    # create a string with all available dynparent object and seperate them with ':'
    enumString = ':'.join(sel)

    cmds.addAttr(constrainedObj, ln='Parent', at='enum', en=enumString)
    cmds.setAttr(constrainedObj + '.Parent', e=1, keyable=1)

    for i in sel:
        cmds.addAttr(constrainedObj, ln=i, at='long', min=0, max=1, dv=0)
        cmds.setAttr(constrainedObj + '.' + i, e=1, keyable=1)

    print constrainedObj
    print DPsetGroup
    print DPgroup

    #cmds.connectAttr('pCone1' + '.' + 'pCone1_DynPGroup', 'pCone1_DynPCnsGroup' + '_parentConstraint1.' + 'pCone1_DynPGroup' + 'W0')

    cmds.connectAttr(constrainedObj + '.' + sel[0], DPsetGroup + '_parentConstraint1.' + DPgroup + 'W0')
    i = 1
    while i < sizeSel:
        cmds.connectAttr(constrainedObj + '.' + sel[i], DPsetGroup + '_parentConstraint1.' + sel[i] + 'W' + str(i))
        i += 1


    sforExprString = '\',\''.join(sel)
    print sforExprString

    exprSuf = '_0'

    if cmds.objExists('dynparExpr' + exprSuf):
        j=1
        while cmds.objExists('dynparExpr_' + str(j)):
            j+=1

        exprSuf = '_' + str(j)

    print exprSuf


