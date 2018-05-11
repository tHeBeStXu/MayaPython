import Main_UI
reload(Main_UI)
from PySide2 import QtCore, QtWidgets
import pymel.core as pm
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


    def buildUI(self):
        pass

    def createGeneralButton(self, layout):
        """
        Create the Cancel and OK button for each widget
        :param layout: the edit window main widget
        :return: None
        """
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
        """
        Save the rigArgs info and close the rigArgs dialog
        :return: None
        """
        self.saveData()
        # print self.specifiedInstance

        self.parent().close()

    def cancel(self):
        """
        Cancel button action -> close the rigArgs dialog
        :return: None
        """
        self.parent().close()

    def populate(self):
        """
        Refresh and populate the rigArgs info for each arg
        :return: None
        """
        for arg in self.specifiedInstance.rigArgs.keys():
            if arg in self.rowItem.keys():
                self.rowItem[arg].setText(str(self.specifiedInstance.rigArgs[arg]))
            else:
                raise RuntimeWarning('No specified properties!')

    def saveData(self):
        pass


class IK_FK_Spine_EditUI(EditUI):
    def __init__(self, instance, UI_name):
        EditUI.__init__(self, instance, UI_name)

        self.buildUI()
        self.populate()
        self.parent().show()

    def buildUI(self):
        """
        Build the IK_FK_Spine Edit UI Dialog
        :return: None
        """
        layout = QtWidgets.QVBoxLayout(self)

        formWidget = QtWidgets.QWidget()
        formLayout = QtWidgets.QFormLayout()
        formWidget.setLayout(formLayout)

        layout.addWidget(formWidget)

        self.rowItem = {}

        self.rowItem['spineJoints'] = QtWidgets.QLineEdit()
        self.rowItem['fkSpineCrv'] = QtWidgets.QLineEdit()
        self.rowItem['prefix'] = QtWidgets.QLineEdit()
        self.rowItem['rigScale'] = QtWidgets.QLineEdit()

        formLayout.addRow('spineJoints: ', self.rowItem['spineJoints'])
        formLayout.addRow('fkSpineCrv: ', self.rowItem['fkSpineCrv'])
        formLayout.addRow('prefix: ', self.rowItem['prefix'])
        formLayout.addRow('rigScale', self.rowItem['rigScale'])

        self.createGeneralButton(layout)

    def saveData(self):
        """
        Save the args info to the specified rig widget's rigArgs dictionary
        :return: None
        """
        self.specifiedInstance.rigArgs['spineJoints'] = self.rowItem['spineJoints'].text()
        self.specifiedInstance.rigArgs['fkSpineCrv'] = self.rowItem['fkSpineCrv'].text()
        self.specifiedInstance.rigArgs['prefix'] = self.rowItem['prefix'].text()
        self.specifiedInstance.rigArgs['rigScale'] = self.rowItem['rigScale'].text()


class IK_FK_Arm_EditUI(EditUI):
    def __init__(self, instance, UI_name):
        EditUI.__init__(self, instance, UI_name)
        self.buildUI()
        self.populate()
        self.parent().show()

    def buildUI(self):
        """
        Build the IK_FK_Arm Edit UI layout
        :return: None
        """
        layout = QtWidgets.QVBoxLayout(self)

        formWidget = QtWidgets.QWidget()
        formLayout = QtWidgets.QFormLayout()
        formWidget.setLayout(formLayout)
        layout.addWidget(formWidget)

        self.rowItem = {}

        self.rowItem['TopJoint'] = QtWidgets.QLineEdit()
        self.rowItem['startDupJnt'] = QtWidgets.QLineEdit()
        self.rowItem['endDupJnt'] = QtWidgets.QLineEdit()
        self.rowItem['prefix'] = QtWidgets.QLineEdit()
        self.rowItem['armPvLoc'] = QtWidgets.QLineEdit()
        self.rowItem['switchCtrlLoc'] = QtWidgets.QLineEdit()

        formLayout.addRow('TopJoint: ', self.rowItem['TopJoint'])
        formLayout.addRow('startDupJnt: ', self.rowItem['startDupJnt'])
        formLayout.addRow('endDupJnt: ', self.rowItem['endDupJnt'])
        formLayout.addRow('prefix: ', self.rowItem['prefix'])
        formLayout.addRow('armPvLoc: ', self.rowItem['armPvLoc'])
        formLayout.addRow('switchCtrlLoc', self.rowItem['switchCtrlLoc'])

        self.createGeneralButton(layout)

    def saveData(self):
        """
        Save the args info to the specified rig widget's rigArgs dictionary
        :return: None
        """
        self.specifiedInstance.rigArgs['TopJoint'] = self.rowItem['TopJoint'].text()
        self.specifiedInstance.rigArgs['startDupJnt'] = self.rowItem['startDupJnt'].text()
        self.specifiedInstance.rigArgs['endDupJnt'] = self.rowItem['endDupJnt'].text()
        self.specifiedInstance.rigArgs['prefix'] = self.rowItem['prefix'].text()
        self.specifiedInstance.rigArgs['armPvLoc'] = self.rowItem['armPvLoc'].text()
        self.specifiedInstance.rigArgs['switchCtrlLoc'] = self.rowItem['switchCtrlLoc'].text()


class IK_Leg_EditUI(EditUI):
    def __init__(self, instance, UI_name):
        EditUI.__init__(self, instance, UI_name)
        self.buildUI()
        self.populate()
        self.parent().show()

    def buildUI(self):
        """
        Build the IK_Leg UI layout
        :return: None
        """
        layout = QtWidgets.QVBoxLayout(self)

        formLayout = QtWidgets.QFormLayout()
        formWidget = QtWidgets.QWidget()
        formWidget.setLayout(formLayout)

        layout.addWidget(formWidget)

        self.rowItem = {}

        self.rowItem['topJoint'] = QtWidgets.QLineEdit()
        self.rowItem['pvLocator'] = QtWidgets.QLineEdit()
        self.rowItem['revLocator'] = QtWidgets.QLineEdit()
        self.rowItem['prefix'] = QtWidgets.QLineEdit()
        self.rowItem['rigScale'] = QtWidgets.QLineEdit()
        self.rowItem['rollCtrlLOC'] = QtWidgets.QLineEdit()

        formLayout.addRow('topJoint:', self.rowItem['topJoint'])
        formLayout.addRow('pvLocator: ', self.rowItem['pvLocator'])
        formLayout.addRow('revLocator', self.rowItem['revLocator'])
        formLayout.addRow('prefix:', self.rowItem['prefix'])
        formLayout.addRow('rigScale:', self.rowItem['rigScale'])
        formLayout.addRow('rollCtrlLOC: ', self.rowItem['rollCtrlLOC'])

        self.createGeneralButton(layout)

    def saveData(self):
        """
        Save the args info to the specified rig widget's rigArgs dictionary
        :return: None
        """
        self.specifiedInstance.rigArgs['topJoint'] = self.rowItem['topJoint'].text()
        self.specifiedInstance.rigArgs['pvLocator'] = self.rowItem['pvLocator'].text()
        self.specifiedInstance.rigArgs['revLocator'] = self.rowItem['revLocator'].text()
        self.specifiedInstance.rigArgs['prefix'] = self.rowItem['prefix'].text()
        self.specifiedInstance.rigArgs['rigScale'] = self.rowItem['rigScale'].text()
        self.specifiedInstance.rigArgs['rollCtrlLOC'] = self.rowItem['rollCtrlLOC'].text()

