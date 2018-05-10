import Main_UI
reload(Main_UI)
from PySide2 import QtCore, QtWidgets
import pymel.core as pm
from functools import partial
import logging


class EditUI(QtWidgets.QWidget):
    def __init__(self, instance, UI_name):

        logging.basicConfig()
        logger = logging.getLogger('%s' % UI_name)
        logger.setLevel(logging.DEBUG)

        try:
            pm.deleteUI('%s' % UI_name)
        except:
            logger.debug('No %s UI exists!' % UI_name)

        parent = QtWidgets.QDialog(parent=Main_UI.getMayaMainWindow())
        parent.setObjectName('%s' % UI_name)
        parent.setWindowTitle('%s' % UI_name)
        super(EditUI, self).__init__(parent=parent)

        # self.buildUI()

        self.specifiedInstance = instance

        layout = QtWidgets.QVBoxLayout()
        self.parent().setLayout(layout)
        self.parent().layout().addWidget(self)

        # self.parent().show()

    def buildUI(self):
        pass

    def createGeneralButton(self, layout):
        btnWidget = QtWidgets.QWidget()
        btnLayout = QtWidgets.QHBoxLayout(btnWidget)
        layout.addWidget(btnWidget)

        cancel_Btn = QtWidgets.QPushButton('Cancel')
        OK_Btn = QtWidgets.QPushButton('OK')

        btnLayout.addWidget(cancel_Btn)
        btnLayout.addWidget(OK_Btn)

        OK_Btn.clicked.connect(self.setData)
        cancel_Btn.clicked.connect(self.cancel)

    def setData(self):

        self.saveData()
        # print self.specifiedInstance

        self.parent().close()

    def cancel(self):
        self.parent().close()

    def populate(self):
        pass

    def saveData(self):
        pass


class IK_FK_Spine_EditUI(EditUI):
    def __init__(self, instance, UI_name):
        EditUI.__init__(self, instance, UI_name)

        self.buildUI()
        self.parent().show()

    def buildUI(self):
        layout = QtWidgets.QVBoxLayout(self)

        formWidget = QtWidgets.QWidget()
        formLayout = QtWidgets.QFormLayout()
        formWidget.setLayout(formLayout)

        layout.addWidget(formWidget)

        self.spineJoints_LE = QtWidgets.QLineEdit()
        self.fkSpineCrv_LE = QtWidgets.QLineEdit()
        self.prefix_LE = QtWidgets.QLineEdit()
        self.rigScale_LE = QtWidgets.QLineEdit()

        formLayout.addRow('spineJoints: ', self.spineJoints_LE)
        formLayout.addRow('fkSpineCrv: ', self.fkSpineCrv_LE)
        formLayout.addRow('prefix: ', self.prefix_LE)
        formLayout.addRow('rigScale', self.rigScale_LE)

        self.createGeneralButton(layout)

    def saveData(self):
        self.specifiedInstance.rigArgs['spineJoints'] = self.spineJoints_LE.text()
        self.specifiedInstance.rigArgs['fkSpineCrv'] = self.fkSpineCrv_LE.text()
        self.specifiedInstance.rigArgs['prefix'] = self.prefix_LE.text()
        self.specifiedInstance.rigArgs['rigScale'] = self.rigScale_LE.text()

class IK_FK_Arm_EditUI(EditUI):
    def __init__(self, instance, UI_name):
        EditUI.__init__(self, instance, UI_name)
        self.buildUI()
        self.parent().show()

    def buildUI(self):
        layout = QtWidgets.QVBoxLayout(self)

        formWidget = QtWidgets.QWidget()
        formLayout = QtWidgets.QFormLayout()
        formWidget.setLayout(formLayout)
        layout.addWidget(formWidget)

        self.topJoint_LE = QtWidgets.QLineEdit()
        self.startDupJnt_LE = QtWidgets.QLineEdit()
        self.endDupJnt_LE = QtWidgets.QLineEdit()
        self.prifix_LE = QtWidgets.QLineEdit()
        self.armPvLoc_LE = QtWidgets.QLineEdit()
        self.switchCtrlLoc_LE = QtWidgets.QLineEdit()
        formLayout.addRow('TopJoint: ', self.topJoint_LE)
        formLayout.addRow('startDupJnt: ', self.startDupJnt_LE)
        formLayout.addRow('endDupJnt: ', self.endDupJnt_LE)
        formLayout.addRow('prefix: ', self.prifix_LE)
        formLayout.addRow('armPvLoc: ', self.armPvLoc_LE)
        formLayout.addRow('switchCtrlLoc', self.switchCtrlLoc_LE)

        self.createGeneralButton(layout)

    def saveData(self):
        self.specifiedInstance.rigArgs['TopJoint'] = self.topJoint_LE.text()
        self.specifiedInstance.rigArgs['startDupJnt'] = self.startDupJnt_LE.text()
        self.specifiedInstance.rigArgs['endDupJnt'] = self.endDupJnt_LE.text()
        self.specifiedInstance.rigArgs['prefix'] = self.endDupJnt_LE.text()
        self.specifiedInstance.rigArgs['armPvLoc'] = self.armPvLoc_LE.text()
        self.specifiedInstance.rigArgs['switchCtrlLoc'] = self.switchCtrlLoc_LE.text()


class IK_LEG_EditUI(EditUI):
    def __init__(self, instance, UI_name):
        EditUI.__init__(self, instance, UI_name)
        self.buildUI()
        self.parent().show()

    def buildUI(self):
        layout = QtWidgets.QVBoxLayout(self)

        formLayout = QtWidgets.QFormLayout()
        formWidget = QtWidgets.QWidget()
        formWidget.setLayout(formLayout)

        layout.addWidget(formWidget)

        self.topJoint_LE = QtWidgets.QLineEdit()
        self.pvLocator_LE = QtWidgets.QLineEdit()
        self.revLocator_LE = QtWidgets.QLineEdit()
        self.prefix_LE = QtWidgets.QLineEdit()
        self.rigScale_LE = QtWidgets.QLineEdit()
        self.rollCtrlLoc_LE = QtWidgets.QLineEdit()

        formLayout.addRow('topJoint:', self.topJoint_LE)
        formLayout.addRow('pvLocator: ', self.pvLocator_LE)
        formLayout.addRow('revLocator', self.revLocator_LE)
        formLayout.addRow('prefix:', self.prefix_LE)
        formLayout.addRow('rigScale:', self.rigScale_LE)
        formLayout.addRow('rollCtrlLoc: ', self.rollCtrlLoc_LE)

        self.createGeneralButton(layout)

    def saveData(self):
        self.specifiedInstance.rigArgs['topJoint'] = self.topJoint_LE.text()
        self.specifiedInstance.rigArgs['pvLocator'] = self.pvLocator_LE.text()
        self.specifiedInstance.rigArgs['revLocator'] = self.revLocator_LE.text()
        self.specifiedInstance.rigArgs['prefix'] = self.prefix_LE.text()
        self.specifiedInstance.rigArgs['rigScale'] = self.rigScale_LE.text()
        self.specifiedInstance.rigArgs['rollCtrlLOC'] = self.rollCtrlLoc_LE.text()

