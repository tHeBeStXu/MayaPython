from shiboken2 import wrapInstance
from PySide2 import QtCore, QtWidgets
import maya.OpenMayaUI as openmayaui


import pymel.core as pm
import logging
import rigLib
from rigLib import rig as rig
import inspect


def show():
    dialog = EditUI(getMayaMainWindow())
    dialog.show()


def getMayaMainWindow():
    ptr = openmayaui.MQtUtil.mainWindow()
    return wrapInstance(long(ptr), QtWidgets.QMainWindow)


class EditUI(QtWidgets.QDialog):
    def __init__(self, parent=None):

        super(EditUI, self).__init__(parent)

        self.setWindowTitle('test')
        self.setObjectName('testWidget')
        self.setModal(False)

        self.buildUI()

    def buildUI(self):
        self.mainLayout = QtWidgets.QHBoxLayout()
        self.setLayout(self.mainLayout)

        formWidget = QtWidgets.QWidget()
        formLayout = QtWidgets.QFormLayout()
        formWidget.setLayout(formLayout)

        selectionWidget = QtWidgets.QWidget()
        selectionLayout = QtWidgets.QVBoxLayout()
        selectionWidget.setLayout(selectionLayout)

        self.mainLayout.addWidget(formWidget)
        self.mainLayout.addWidget(selectionWidget)

        self.rowItem = {}
        self.tupe = inspect.getargspec(func=rig.IK_AnimalLeg.build)
        for i in self.tupe[0]:
            layout = QtWidgets.QHBoxLayout()

            self.rowItem[i] = QtWidgets.QLineEdit()
            button = QtWidgets.QPushButton('<<<')
            layout.addWidget(self.rowItem[i])
            layout.addWidget(button)

            formLayout.addRow(i, layout)

        self.listWidget = QtWidgets.QListWidget()
        self.listWidget.setSelectionMode(QtWidgets.QAbstractItemView.ExtendedSelection)

        selectionLayout.addWidget(self.listWidget)

        self.createGeneralButton(self.mainLayout)

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
        # self.saveData()
        # print self.specifiedInstance

        self.close()

    def cancel(self):
        """
        Cancel button action -> close the rigArgs dialog
        :return: None
        """
        self.close()
