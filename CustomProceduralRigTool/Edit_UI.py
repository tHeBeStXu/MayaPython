import Main_UI
from PySide2 import QtCore, QtWidgets
import pymel.core as pm
import logging
import rigLib
from rigLib import rig as rig
import inspect

reload(Main_UI)
reload(rig)


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
        self.tupe = inspect.getargspec(rig.IK_FK_Spine.build)
        for i in self.tupe[0]:
            self.rowItem[i] = QtWidgets.QLineEdit()
            formLayout.addRow(i, self.rowItem[i])

        self.createGeneralButton(layout)

    def saveData(self):
        """
        Save the args info to the specified rig widget's rigArgs dictionary
        :return: None
        """
        tupe = inspect.getargspec(rig.IK_FK_Spine.build)
        for i in tupe[0]:
            self.specifiedInstance.rigArgs[i] = self.rowItem[i].text()


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
        self.tupe = inspect.getargspec(rig.IK_FK_Arm.build)
        print self.tupe[0]

        for i in self.tupe[0]:
            self.rowItem[i] = QtWidgets.QLineEdit()
            formLayout.addRow(i, self.rowItem[i])

        self.createGeneralButton(layout)

    def saveData(self):
        """
        Save the args info to the specified rig widget's rigArgs dictionary
        :return: None
        """

        for i in self.tupe[0]:
            self.specifiedInstance.rigArgs[i] = self.rowItem[i].text()


class IK_AnimalLeg_EditUI(EditUI):
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

        self.tupe = inspect.getargspec(rig.IK_AnimalLeg.build)
        print self.tupe[0]

        for i in self.tupe[0]:
            self.rowItem[i] = QtWidgets.QLineEdit()
            formLayout.addRow(i, self.rowItem[i])

        self.createGeneralButton(layout)

    def saveData(self):
        """
        Save the args info to the specified rig widget's rigArgs dictionary
        :return: None
        """

        for i in self.tupe[0]:
            self.specifiedInstance.rigArgs[i] = self.rowItem[i].text()


class IK_FK_Head_Neck_EditUI(EditUI):
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

        self.tupe = inspect.getargspec(rig.IK_FK_Head_Neck.build)
        print self.tupe[0]

        for i in self.tupe[0]:
            self.rowItem[i] = QtWidgets.QLineEdit()
            formLayout.addRow(i, self.rowItem[i])

        self.createGeneralButton(layout)

    def saveData(self):
        """
        Save the args info to the specified rig widget's rigArgs dictionary
        :return: None
        """

        for i in self.tupe[0]:
            self.specifiedInstance.rigArgs[i] = self.rowItem[i].text()


class FK_Tail_EditUI(EditUI):
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

        self.tupe = inspect.getargspec(rig.FK_Tail.build)
        print self.tupe[0]

        for i in self.tupe[0]:
            self.rowItem[i] = QtWidgets.QLineEdit()
            formLayout.addRow(i, self.rowItem[i])

        self.createGeneralButton(layout)

    def saveData(self):
        """
        Save the args info to the specified rig widget's rigArgs dictionary
        :return: None
        """

        for i in self.tupe[0]:
            self.specifiedInstance.rigArgs[i] = self.rowItem[i].text()

