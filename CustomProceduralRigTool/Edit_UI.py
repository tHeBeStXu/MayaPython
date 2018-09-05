from PySide2 import QtWidgets
import pymel.core as pm
import logging
import inspect
import maya.cmds as cmds
from functools import partial


class EditUI(QtWidgets.QDialog):
    def __init__(self, instance, UI_name, func):

        logging.basicConfig()
        logger = logging.getLogger('%s' % UI_name)
        logger.setLevel(logging.DEBUG)

        try:
            pm.deleteUI('%s' % UI_name)
        except:
            logger.debug('No %s UI exists!' % UI_name)

        super(EditUI, self).__init__(parent=instance)
        self.setObjectName('%s' % UI_name)
        self.setWindowTitle('%s' % UI_name)
        self.setModal(True)

        self.specifiedInstance = instance
        self.func = func

        self.buildUI()
        self.populate()
        self.show()

        self.refreshListWidget()

    def refreshListWidget(self):
        """
                refresh listWidget with specified checked
                :return: None
                """
        self.listWidget.clear()

        joints = []
        locators = []
        if self.jointCheck.isChecked():
            joints = cmds.ls(type='joint')

        locaterShapes = []
        if self.locatorCheck.isChecked():
            locaterShapes = cmds.ls(type='locator')

        for loc in locaterShapes:
            locators.append(cmds.listRelatives(loc, p=1)[0])

        returnList = joints + locators

        if returnList:
            if len(returnList) > 1:
                self.listWidget.addItems(returnList)
            else:
                self.listWidget.addItem(returnList[0])

    def buildUI(self):

        # main layout
        self.mainlayout = QtWidgets.QHBoxLayout()
        self.setLayout(self.mainlayout)

        # parameters part
        formWidget = QtWidgets.QWidget()
        formLayout = QtWidgets.QFormLayout()
        formWidget.setLayout(formLayout)

        # selection part
        selectionWidget = QtWidgets.QWidget()
        selectionLayout = QtWidgets.QVBoxLayout()
        selectionWidget.setLayout(selectionLayout)

        # filter part
        filterWidget = QtWidgets.QWidget()
        filterLayout = QtWidgets.QHBoxLayout()
        filterWidget.setLayout(filterLayout)

        filterLabel = QtWidgets.QLabel('Filter:    ')
        self.jointCheck = QtWidgets.QCheckBox('joint')
        self.locatorCheck = QtWidgets.QCheckBox('locator')

        filterLayout.addWidget(filterLabel)
        filterLayout.addWidget(self.jointCheck)
        filterLayout.addWidget(self.locatorCheck)

        self.jointCheck.stateChanged.connect(self.refreshListWidget)
        self.locatorCheck.stateChanged.connect(self.refreshListWidget)

        # arrangement
        self.mainlayout.addWidget(formWidget)
        self.mainlayout.addWidget(selectionWidget)

        self.listWidget = QtWidgets.QListWidget()
        self.listWidget.setSelectionMode(QtWidgets.QAbstractItemView.ExtendedSelection)

        self.rowItem = {}
        self.tupe = inspect.getargspec(func=self.func)
        for i in self.tupe[0]:
            layout = QtWidgets.QHBoxLayout()

            self.rowItem[i] = QtWidgets.QLineEdit()
            button = QtWidgets.QPushButton('<<<')

            layout.addWidget(self.rowItem[i])
            layout.addWidget(button)

            button.clicked.connect(partial(self.setEditLine, self.rowItem[i]))

            formLayout.addRow(i, layout)

        selectionLayout.addWidget(filterWidget)
        selectionLayout.addWidget(self.listWidget)

        self.createGeneralButton(self.mainlayout)

    def setEditLine(self, editLine):
        """
                set specified editLine text
                :param editLine: specified editLine
                :return: None
                """
        items = self.listWidget.selectedItems()
        itemStr = []
        for i in items:
            itemStr.append(self.listWidget.item(self.listWidget.row(i)).text())

        if itemStr:
            if len(itemStr) < 2:
                editLine.setText(itemStr[0])
            else:
                editLine.setText(str(itemStr))

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

        self.close()

    def cancel(self):
        """
        Cancel button action -> close the rigArgs dialog
        :return: None
        """
        self.close()

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
        """
        Save the args info to the specified rig widget's rigArgs dictionary
        :return: None
        """
        tupe = inspect.getargspec(self.func)
        for i in tupe[0]:
            self.specifiedInstance.rigArgs[i] = self.rowItem[i].text()
