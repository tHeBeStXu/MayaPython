"""
module for making top rig structure and rig module
"""

import maya.cmds as cmds
import control
sceneObjectType = 'rig'

class Base():
    """
    class for building top rig structure
    """

    def __init__(self,
                 characterName='new',
                 scale=1.0,
                 mainCtrlAttachObj=''
                 ):
        """
        :param characterName: str, character name
        :param scale: float, general scale of the rig
        :return None
        """

        self.topGrp = cmds.group(n=characterName + '_rig_grp', em=1)
        self.rigGrp = cmds.group(n='rig_grp', em=1, p=self.topGrp)
        self.modelGrp = cmds.group(n='model_grp', em=1, p=self.topGrp)

        characterNameAttr = 'characterName'
        sceneObjectTypeAttr = 'sceneObjectType'

        for attr in [characterNameAttr, sceneObjectTypeAttr]:

            cmds.addAttr(self.topGrp, ln=attr, dt='string')

        cmds.setAttr(self.topGrp + '.' + characterNameAttr,
                     characterName, type='string', l=1)
        cmds.setAttr(self.topGrp + '.' + sceneObjectTypeAttr,
                     sceneObjectType, type='string', l=1)

        # make global control

        global1Ctrl = control.Control(prefix='globle1', scale=scale * 20.0, parent=self.rigGrp,
                                      lockChannels=['v'])

        global2Ctrl = control.Control(prefix='globle2', scale=scale * 15.0, parent=global1Ctrl.C,
                                      lockChannels=['s', 'v'])

        self._flattenGlobalCtrlShape(global1Ctrl.C)
        self._flattenGlobalCtrlShape(global2Ctrl.C)

        for axis in ['y', 'z']:

            cmds.connectAttr(global1Ctrl.C + '.sx', global1Ctrl.C + '.s' + axis)
            cmds.setAttr(global1Ctrl.C + '.s' + axis, k=0)

        # make more groups

        self.jointGrp = cmds.group(n='joint_grp', em=1,
                                   p=global2Ctrl.C)
        self.modulesGrp = cmds.group(n='modules_grp', em=1,
                                     p=global2Ctrl.C)

        # create a grp for objects are not influenced by rig moving
        # not moving
        self.partGrp = cmds.group(n='parts_grp', em=1,
                                  p=self.rigGrp)
        # lock the inherits Transform attr
        cmds.setAttr(self.partGrp + '.it', 0, l=1)

        # make main control
        mainCtrl = control.Control(prefix='main',
                                   scale=scale*1,
                                   parent=global2Ctrl.C,
                                   translateTo=mainCtrlAttachObj,
                                   lockChannels=['t', 'r', 's', 'v'])

        self._adjustMainCtrlShape(mainCtrl, scale)

        if cmds.objExists(mainCtrlAttachObj):
            cmds.parentConstraint(mainCtrlAttachObj, mainCtrl.Off, mo=1)

        mainVisAts = ['modelVis', 'jointsVis']
        mainDispAts = ['modelDisp', 'jointDisp']
        mainObjList = [self.modelGrp, self.jointGrp]
        mainObjVisDvList = [1, 0]

        # add rig visibility connections

        for at, obj, dfVal in zip(mainVisAts, mainObjList, mainObjVisDvList):
            cmds.addAttr(mainCtrl.C, ln=at, at='enum', enumName='off:on', k=1, defaultValue=dfVal)
            cmds.setAttr(mainCtrl.C + '.' + at, channelBox=1)
            cmds.connectAttr(mainCtrl.C + '.' + at, obj + '.v')

        # add rig display type connections
        for at, obj in zip(mainDispAts, mainObjList):
            cmds.addAttr(mainCtrl.C, ln=at, at='enum', enumName='normal:template:reference', k=1, defaultValue=2)
            cmds.setAttr(obj + '.ove', 1)
            cmds.connectAttr(mainCtrl.C + '.' + at, obj + '.ovdt')


    def _adjustMainCtrlShape(self, ctrl, scale):

        # adjust shape of main control

        ctrlShapes = cmds.listRelatives(ctrl.C, s=1, type='nurbsCurve')

        # cluster()[1] will return the cluster handle name
        cls = cmds.cluster(ctrlShapes)[1]
        cmds.setAttr(cls + '.ry', 90)
        cmds.delete(ctrlShapes, ch=1)

        cmds.move(5 * scale, ctrl.Off, moveY=1, relative=True)

    def _flattenGlobalCtrlShape(self, ctrlObject):

        # flatten ctrl object shape

        ctrlShapes = cmds.listRelatives(ctrlObject, s=1,
                                        type='nurbsCurve')

        cls = cmds.cluster(ctrlShapes)[1]
        cmds.setAttr(cls + '.rz', 90)
        cmds.delete(ctrlShapes, ch=1)


class Module():

    """class for building module rig structure"""

    def __init__(self,
                 prefix='new',
                 baseObject=None
                 ):

        """
        :param prefix:str, prefix to name new objects
        :param baseObject:instance of base.module.Base() class
        :return None
        """
        self.topGrp = cmds.group(n=prefix + 'Module_grp', em=1)

        self.controlGrp = cmds.group(n=prefix + 'Controls_grp',
                                     em=1, p=self.topGrp)
        self.jointsGrp = cmds.group(n=prefix + 'Joints_grp',
                                    em=1, p=self.topGrp)
        self.partsGrp = cmds.group(n=prefix + 'Parts_grp',
                                   em=1, p=self.topGrp)
        self.partsNoTransGrp = cmds.group(n=prefix + 'PartsNoTrans_grp',
                                          em=1, p=self.topGrp)

        cmds.hide(self.partsGrp, self.partsNoTransGrp)

        cmds.setAttr(self.partsNoTransGrp + '.it', 0, l=1)

        # parent module

        if baseObject:

            cmds.parent(self.topGrp, baseObject.modulesGrp)
