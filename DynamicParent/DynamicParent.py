import maya.cmds as cmds
from functools import partial


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

    # parenting
    # DPgroup -> DPsetGroup -> constrainedObj
    cmds.parent(constrainedObj, DPsetGroup)
    cmds.parent(DPsetGroup, DPgroup)

    # remove constrainedObj from sel list
    sel = sel[0:-1]
    # inset DPgroup to the sel list at 0 index
    sel.insert(0, DPgroup)

    # parentconstraint all objects to lasts parent group

    for i in sel:
        cmds.parentConstraint(i, DPsetGroup, mo=0)

    # add seporator attribute
    cmds.addAttr(constrainedObj, ln='DynParent', at='enum', en='------')
    cmds.setAttr(constrainedObj + '.DynParent', lock=1, e=1, keyable=1)

    # create a string with all available dynparent object and seperate them with ':'
    # enumString = "DPgroup:Parent_1:Parent_2:...:Parent_#"
    enumString = ':'.join(sel)

    cmds.addAttr(constrainedObj, ln='Parent', at='enum', en=enumString)
    cmds.setAttr(constrainedObj + '.Parent', e=1, keyable=1)

    for i in sel:
        cmds.addAttr(constrainedObj, ln=i, at='long', min=0, max=1, dv=0)
        cmds.setAttr(constrainedObj + '.' + i, e=1, keyable=1)

    #cmds.connectAttr('pCone1' + '.' + 'pCone1_DynPGroup', 'pCone1_DynPCnsGroup' + '_parentConstraint1.' + 'pCone1_DynPGroup' + 'W0')

    cmds.connectAttr(constrainedObj + '.' + sel[0], DPsetGroup + '_parentConstraint1.' + DPgroup + 'W0')
    i = 1
    while i < sizeSel:
        cmds.connectAttr(constrainedObj + '.' + sel[i], DPsetGroup + '_parentConstraint1.' + sel[i] + 'W' + str(i))
        i += 1

    ##########################################################################################################
    # sforExprString = "DPgroup','
    sforExprString = '\',\''.join(sel)
    # print sforExprString

    exprSuf = '_0'

    # scriptNode name dynparExpr + exprSuf
    if cmds.objExists('dynparExpr' + exprSuf):
        j = 1
        while cmds.objExists('dynparExpr_' + str(j)):
            j += 1

        exprSuf = '_' + str(j)

    print 'exprSuf = ' + exprSuf

    cmds.select(DPsetGroup)
    DPsetGroup_FP = cmds.ls(sl=1, l=1)
    cmds.select(cl=1)
    cmds.select(constrainedObj)
    constrainedObj_FP = cmds.ls(sl=1, l=1)
    cmds.select(cl=1)

    print DPsetGroup_FP
    print constrainedObj_FP

    cmds.scriptNode(beforeScript='customScriptJob(DPsetGroup = ' + str(DPsetGroup_FP) + ', constrainedObj=' + str(constrainedObj_FP) + ')',
                    n='dynparExpr' + exprSuf, stp='python')

    cmds.setAttr('dynparExpr' + exprSuf + '.scriptType', 1)
    # execute scriptNode
    cmds.scriptNode('dynparExpr' + exprSuf, executeBefore=1)
    cmds.setAttr(constrainedObj + '.' + sel[0], 1)
    cmds.select(constrainedObj)


def customScriptJob(DPsetGroup, constrainedObj):
    cmds.select(constrainedObj)
    cmds.scriptJob(attributeChange=[[constrainedObj + '.Parent'],
                   partial(DynParentSpaceSwitch, DPsetGroup, constrainedObj)],
                   killWithScene=1)

def DynParentSpaceSwitch(DPsetGroup, constrainedObj):
    selection = ''
    constraintRelatives = cmds.listRelatives(DPsetGroup, c=1, type='constraint')
    cnsRelAttr = cmds.attributeInfo(constraintRelatives, i=0)
    cnsRelSize = len(cnsRelAttr)
    parentVal = cmds.getAttr(constrainedObj + '.Parent')
    posDP = cmds.xform(constrainedObj, q=1, ws=1, rp=1)
    rotDP = cmds.xform(constrainedObj, q=1, ws=1, ro=1)

    attributeSize = len(cnsRelAttr)
    selectionSize = len(selection)

    discardedAttributes = attributeSize - selectionSize

    cnsAttrUsed = cnsRelSize - discardedAttributes

    i = 0
    while i < cnsAttrUsed:
        cmds.setAttr(constrainedObj + '.' + selection[i], 0)
        i += 1

    cmds.setAttr(constrainedObj + '.' + selection[parentVal], 1)
    cmds.move(posDP[0], posDP[1], posDP[2], constrainedObj, rpr=1)
    cmds.rotate(rotDP[0], rotDP[1], rotDP[2], constrainedObj, a=1, ws=1)

