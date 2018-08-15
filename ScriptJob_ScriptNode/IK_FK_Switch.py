import maya.cmds as cmds


def IK_FK_Switch(prefix,
                 switchCtrl,
                 pvCtrl,
                 ikCtrl,
                 skinJoints,
                 fkCtrlList):
    codeStr = '''
import maya.cmds as cmds

def switch(switchCtrl=%s, pvCtrl=%s, ikCtrl=%s, skinJoints=%s, fkCtrlList=%s):
    objAttr = switchCtrl + '.Mode'
    objTy = switchCtrl + '.ty'
    # FK 2 IK
    if cmds.getAttr(objAttr) == 0:
        cmds.setAttr(pvCtrl + '.t', cmds.getAttr(skinJoints[1] + '.t'))
        cmds.setAttr(ikCtrl + '.t', cmds.getAttr(skinJoints[-1] + '.t'))
        cmds.setAttr(ikCtrl + '.r', cmds.getAttr(skinJoints[-1] + '.r'))
        cmds.setAttr(objTy, 1)

    # IK 2 FK
    elif cmds.getAttr(objAttr) == 1:
        for i in xrange(len(skinJoints)):
            cmds.setAttr(fkCtrlList[i] + '.r', skinJoints[i] + '.r')
        cmds.setAttr(objTy, 0)

cmds.scriptJob(attributeChange=[objAttr, switch])
''' % (switchCtrl, pvCtrl, ikCtrl, skinJoints, fkCtrlList)
    cmds.scriptNode(st=2, bs=codeStr.replace("'''", "''"), n=prefix + 'Arm_IKFK_SwitchMode', stp='python')
