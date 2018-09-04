from shiboken2 import wrapInstance
from PySide2 import QtCore, QtWidgets
import maya.OpenMayaUI as openmayaui
from functools import partial
import maya.cmds as cmds


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
        self.refreshListWidget()

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

        self.listWidget = QtWidgets.QListWidget()
        self.listWidget.setSelectionMode(QtWidgets.QAbstractItemView.ExtendedSelection)

        self.rowItem = {}
        self.buttons = {}
        self.layout = {}
        self.tupe = inspect.getargspec(func=rig.IK_AnimalLeg.build)
        for i in self.tupe[0]:
            self.layout[i] = QtWidgets.QHBoxLayout()

            self.rowItem[i] = QtWidgets.QLineEdit()
            self.buttons[i] = QtWidgets.QPushButton('<<<')

            self.layout[i].addWidget(self.rowItem[i])
            self.layout[i].addWidget(self.buttons[i])

            self.buttons[i].clicked.connect(partial(self.setEditLine, self.rowItem[i]))

            formLayout.addRow(i, self.layout[i])

        # print self.rowItem
        # print self.buttons

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

    def setEditLine(self, editLine):

        items = self.listWidget.selectedItems()
        editLine.setText(str(items))

    def refreshListWidget(self):
        joints = cmds.ls(type='joint')
        if len(joints) > 1:
            self.listWidget.addItems(joints)

