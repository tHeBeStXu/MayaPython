from PySide2 import QtCore, QtWidgets
from shiboken2 import wrapInstance
import maya.OpenMayaUI as omui
import maya.cmds as cmds
import logging
import inspect
from ..rigLib import rig
from functools import partial
reload(rig)


logging.basicConfig()
logger = logging.getLogger('DynamicChainRigTool')
logger.setLevel(logging.DEBUG)

def getMayaWindow():
    """
    get the mayaMainWindow as parent
    :return: mayaMainWindow Ptr
    """
    ptr = omui.MQtUtil.mainWindow()
    return wrapInstance(long(ptr), QtWidgets.QMainWindow)


class MainUI(QtWidgets.QDialog):
    def __init__(self):
        """
        Initialize and show the main window.
        """
        try:
            cmds.deleteUI('DynamicChainRigTool')
        except:
            logger.info('No previous UI exists!')

        super(MainUI, self).__init__(parent=getMayaWindow())

        self.setModal(False)
        self.setObjectName('DynamicChainRigTool')
        self.setWindowTitle('Dynamic Chain Rigging Tool')

        self.buildUI()
        self.show()
        self.refreshListWidget()

    def refreshListWidget(self):
        """
        refresh listWidget with specified checked
        :return: None
        """
        self.listWidget.clear()

        joints = []
        hairs = []

        if self.jointCheck.isChecked():
            joints = cmds.ls(type='joint')

        if self.hairCheck.isChecked():
            hairs = cmds.ls(type='hairSystem')

        returnList = joints + hairs

        if returnList:
            if len(returnList) > 1:
                self.listWidget.addItems(returnList)
            else:
                self.listWidget.addItem(returnList[0])

    def buildUI(self):
        """
        Build the main UI
        :return: None
        """
        self.mainLayout = QtWidgets.QVBoxLayout()
        self.setLayout(self.mainLayout)

        self.mainWidget = QtWidgets.QTabWidget()

        self.mainLayout.addWidget(self.mainWidget)

        self.firstWidget = QtWidgets.QWidget()
        self.secondWidget = QtWidgets.QWidget()

        # add widget to TabWidget
        self.mainWidget.addTab(self.firstWidget, 'Create')
        self.mainWidget.addTab(self.secondWidget, 'Bake')

        # build 'Create' widget
        self.firstLayout = QtWidgets.QVBoxLayout()
        self.firstWidget.setLayout(self.firstLayout)

        formWidget = QtWidgets.QWidget()
        formlayout = QtWidgets.QFormLayout()
        formWidget.setLayout(formlayout)

        self.rowItem = {}
        self.tupe = inspect.getargspec(func=rig.build)
        for i in self.tupe[0]:
            layout = QtWidgets.QHBoxLayout()
            self.rowItem[i] = QtWidgets.QLineEdit()
            button = QtWidgets.QPushButton('<<<')

            layout.addWidget(self.rowItem[i])
            layout.addWidget(button)

            button.clicked.connect(partial(self.setEditLine, self.rowItem[i]))

            formlayout.addRow(i, layout)

        selectionWidget = QtWidgets.QWidget()
        selectionLayout = QtWidgets.QVBoxLayout()
        selectionWidget.setLayout(selectionLayout)

        filterWidget = QtWidgets.QWidget()
        filterLayout = QtWidgets.QHBoxLayout()
        filterWidget.setLayout(filterLayout)

        filterLable = QtWidgets.QLabel('Filter:    ')
        self.jointCheck = QtWidgets.QCheckBox('Joint')
        self.hairCheck = QtWidgets.QCheckBox('Hair')

        filterLayout.addWidget(filterLable)
        filterLayout.addWidget(self.jointCheck)
        filterLayout.addWidget(self.hairCheck)

        self.jointCheck.stateChanged.connect(self.refreshListWidget)
        self.hairCheck.stateChanged.connect(self.refreshListWidget)

        self.firstLayout.addWidget(formWidget)
        self.firstLayout.addWidget(selectionWidget)

        self.listWidget = QtWidgets.QListWidget()
        self.listWidget.setSelectionMode(QtWidgets.QAbstractItemView.ExtendedSelection)

        selectionLayout.addWidget(filterWidget)
        selectionLayout.addWidget(self.listWidget)

        # create rig button
        self.createButton = QtWidgets.QPushButton('Create Dynamic Chain Rig!')
        self.createButton.clicked.connect(self.buildRig)
        self.firstLayout.addWidget(self.createButton)

        # build 'Bake' widget
        #self.secondLayout = QtWidgets.QLAYOUT


    def setEditLine(self, editLine):
        items = self.listWidget.selectedItems()

        itemStr = []
        for i in items:
            itemStr.append(self.listWidget.item(self.listWidget.row(i)).text())

        if itemStr:
            if len(itemStr) < 2:
                editLine.setText(itemStr[0])
            else:
                editLine.setText(str(itemStr))

    def buildRig(self):
        """
        build dynamic chain rig
        :return: None
        """

        jointList = eval(self.rowItem['jointList'].text())
        numCtrl = eval(self.rowItem['numCtrl'].text())
        hairSystem = self.rowItem['hairSystem'].text()

        rig.build(jointList=jointList,
                  numCtrl=numCtrl,
                  hairSystem=hairSystem)








