from PySide2 import QtCore, QtWidgets, QtGui
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

        #########################
        # build 'Create' widget #
        #########################
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

        self.firstLayout.addWidget(formWidget)

        # selection splitter
        self.listSplitter = splitter()
        self.firstLayout.addWidget(self.listSplitter)

        # selection widget
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

        self.firstLayout.addWidget(selectionWidget)

        self.listWidget = QtWidgets.QListWidget()
        self.listWidget.setSelectionMode(QtWidgets.QAbstractItemView.ExtendedSelection)

        selectionLayout.addWidget(filterWidget)
        selectionLayout.addWidget(self.listWidget)

        # create rig splitter
        self.createRigSplitter = splitter()
        self.firstLayout.addWidget(self.createRigSplitter)

        # create rig button
        self.createRigButton = QtWidgets.QPushButton('Create Dynamic Chain Rig!')
        self.createRigButton.clicked.connect(self.buildRig)
        self.firstLayout.addWidget(self.createRigButton)

        #######################
        # build 'Bake' widget #
        #######################
        self.secondLayout = QtWidgets.QVBoxLayout()
        self.secondWidget.setLayout(self.secondLayout)

        # setting group splitter
        self.settingSplitter = splitter(text='SETTING GROUPS')
        self.secondLayout.addWidget(self.settingSplitter)

        # setting group comboBox
        self.setGrpComboBox = QtWidgets.QComboBox()
        self.secondLayout.addWidget(self.setGrpComboBox)

        # selection splitter
        self.selSplitter = splitter(text='SELECTION')
        self.secondLayout.addWidget(self.selSplitter)

        # seleciton buttons
        self.selGridLayout = QtWidgets.QGridLayout()

        self.selHairBtn = QtWidgets.QPushButton('Select Hair System')
        self.selNucleusBtn = QtWidgets.QPushButton('Select Nucleus')
        self.selBakeCtrlBtn = QtWidgets.QPushButton('Select Bake Ctrls')
        self.selIKCtrlBtn = QtWidgets.QPushButton('Select IK Ctrls')
        self.selBakeJntBtn = QtWidgets.QPushButton('Select Bake Joints')
        self.selIKJntBtn = QtWidgets.QPushButton('Select IK Joints')
        self.selDynCrvBtn = QtWidgets.QPushButton('Select Dynamic Curve')
        self.selIKCrvBtn = QtWidgets.QPushButton('Select IK Curve')
        self.selOriginJntBtn = QtWidgets.QPushButton('Select Origin Joints')
        self.selSetGrpBtn = QtWidgets.QPushButton('Select Setting Grp')

        self.selGridLayout.addWidget(self.selHairBtn, 0, 0, 1, 2)
        self.selGridLayout.addWidget(self.selNucleusBtn, 0, 2, 1, 2)
        self.selGridLayout.addWidget(self.selBakeCtrlBtn, 1, 0, 1, 2)
        self.selGridLayout.addWidget(self.selIKCtrlBtn, 1, 2, 1, 2)
        self.selGridLayout.addWidget(self.selBakeJntBtn, 2, 0, 1, 2)
        self.selGridLayout.addWidget(self.selIKJntBtn, 2, 2, 1, 2)
        self.selGridLayout.addWidget(self.selDynCrvBtn, 3, 0, 1, 2)
        self.selGridLayout.addWidget(self.selIKCrvBtn, 3, 2, 1, 2)
        self.selGridLayout.addWidget(self.selOriginJntBtn, 4, 0, 1, 2)
        self.selGridLayout.addWidget(self.selSetGrpBtn, 4, 2, 1, 2)

        self.secondLayout.addLayout(self.selGridLayout)

        # bake splitter
        self.bakeSplitter = splitter(text='BAKE')
        self.secondLayout.addWidget(self.bakeSplitter)

        # bake button
        self.bakeBtnLayout = QtWidgets.QHBoxLayout()
        self.bakeDynamicBtn = QtWidgets.QPushButton('Bake Dynamic on Bake Ctrls')
        self.bakeBtnLayout.addWidget(self.bakeDynamicBtn)

        self.secondLayout.addLayout(self.bakeBtnLayout)

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


class splitter(QtWidgets.QWidget):
    def __init__(self, text=None):
        super(splitter, self).__init__()

        self.setMinimumHeight(2)
        self.mainLayout = QtWidgets.QHBoxLayout()
        self.setLayout(self.mainLayout)
        self.mainLayout.setContentsMargins(0, 0, 0, 0)
        self.mainLayout.setSpacing(0)
        self.mainLayout.setAlignment(QtCore.Qt.AlignVCenter)

        firstLine = QtWidgets.QFrame()
        firstLine.setFrameStyle(QtWidgets.QFrame.HLine)
        self.mainLayout.addWidget(firstLine)

        if not text:
            return

        font = QtGui.QFont()
        font.setBold(True)

        textWidth = QtGui.QFontMetrics(font)
        width = textWidth.width(text) + 10

        label = QtWidgets.QLabel()
        label.setText(text)
        label.setFont(font)
        label.setMaximumWidth(width)
        label.setAlignment(QtCore.Qt.AlignVCenter | QtCore.Qt.AlignHCenter)

        self.mainLayout.addWidget(label)

        secondLine = QtWidgets.QFrame()
        secondLine.setFrameStyle(QtWidgets.QFrame.HLine)
        self.mainLayout.addWidget(secondLine)















