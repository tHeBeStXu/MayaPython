from PySide2 import QtWidgets, QtCore
from functools import partial
import maya.OpenMayaUI as omui
import os
import time
import json
import Splitter_UI
import Rig_UI
reload(Splitter_UI)
reload(Rig_UI)

from shiboken2 import wrapInstance
import maya.cmds as cmds

from ..rig import *

import logging
import Edit_UI

reload(Edit_UI)
reload(cartoonEyeLidRig)
reload(singleLineRig)
reload(vertex2Rig)

logging.basicConfig()
logger = logging.getLogger('FacialRiggingTool')
logger.setLevel(logging.DEBUG)


def getMayaMainWindow():
    """
    get maya main window
    :return: ptr of maya main window as QMainWindow
    """
    win = omui.MQtUtil.mainWindow()
    ptr = wrapInstance(long(win), QtWidgets.QMainWindow)
    return ptr


def deleteDock(name='FacialRiggingTool'):
    """
    delete the Dock
    :param name: Dock name
    :return: None
    """
    if cmds.workspaceControl(name, query=1, exists=1):
        cmds.deleteUI(name)


def getDock(name='FacialRiggingTool'):
    """
    Delete existing Dock and create a Dock Ctrl, finally return the ptr of the new Dock ctrl
    :param name: Dock name
    :return: ptr of the new create Dock as QWidget
    """
    deleteDock(name)

    ctrl = cmds.workspaceControl(name, dockToMainWindow=('right', 1), label='FacialRiggingTool')

    qtCtrl = omui.MQtUtil.findControl(ctrl)
    ptr = wrapInstance(long(qtCtrl), QtWidgets.QWidget)

    return ptr


class RiggingMainUI(QtWidgets.QWidget):

    rigTypes = {'vertexRig': '',
                'singleLineRig': '',
                'cartoonEyeLidRig': ''}

    def __init__(self, dock=1):

        if dock:
            parent = getDock()
        else:
            deleteDock()
            try:
                cmds.deleteUI('FacialRiggingTool')
            except:
                logger.info('No prefious UI exists!')

            parent = QtWidgets.QDialog(parent=getMayaMainWindow())
            parent.setObjectName('FacialRiggingTool')
            parent.setWindowTitle('Facial Rigging Tool')
            parent.setFixedSize(270, 750)
            layout = QtWidgets.QVBoxLayout(parent)

        super(RiggingMainUI, self).__init__(parent=parent)

        self.build()

        self.parent().layout().addWidget(self)

        if not dock:
            self.parent().show()

    def build(self):
        self.setFixedWidth(250)
        self.setFixedHeight(730)
        self.mainLayout = QtWidgets.QVBoxLayout()
        self.setLayout(self.mainLayout)

        # tabWidget
        self.mainWidget = QtWidgets.QTabWidget()

        self.mainWidget.setFixedWidth(250)
        self.layout().addWidget(self.mainWidget)

        # rig tab
        self.firstWidget = QtWidgets.QWidget()

        self.mainWidget.addTab(self.firstWidget, 'Rig')

        self.gridLayout = QtWidgets.QGridLayout()
        self.firstWidget.setLayout(self.gridLayout)

        self.layout().setContentsMargins(0, 0, 0, 0)

        # combo splitter
        self.comboSplitter = Splitter_UI.Splitter(text='Select and Add')
        self.gridLayout.addWidget(self.comboSplitter, 0, 0, 1, 3)

        # rig combo and add
        self.rigTypeCB = QtWidgets.QComboBox()

        self.rigTypeCB.clear()
        for rigType in sorted(self.rigTypes.keys()):
            self.rigTypeCB.addItem(rigType)

        self.gridLayout.addWidget(self.rigTypeCB, 1, 0, 1, 2)

        self.addBtn = QtWidgets.QPushButton('Add')
        self.addBtn.clicked.connect(self.addRigWidget)
        self.gridLayout.addWidget(self.addBtn, 1, 2, 1, 1)

        # scroll widget
        self.scrollWidget = QtWidgets.QWidget()
        self.scrollLayout = QtWidgets.QVBoxLayout()
        self.scrollLayout.setAlignment(QtCore.Qt.AlignTop | QtCore.Qt.AlignLeft)
        self.scrollWidget.setLayout(self.scrollLayout)

        self.scrollArea = QtWidgets.QScrollArea()
        self.scrollArea.setFixedWidth(230)
        self.scrollArea.setFixedHeight(420)
        self.scrollArea.setWidgetResizable(True)
        self.scrollArea.setWidget(self.scrollWidget)
        self.scrollArea.setFocusPolicy(QtCore.Qt.NoFocus)
        self.scrollArea.setHorizontalScrollBarPolicy(QtCore.Qt.ScrollBarAlwaysOff)

        self.gridLayout.addWidget(self.scrollArea, 2, 0, 1, 3)

        # utils splitter
        self.utilsSplitter = Splitter_UI.Splitter(text='Rig Utils')
        self.gridLayout.addWidget(self.utilsSplitter, 3, 0, 1, 3)

        # action widget
        self.actionWidget = QtWidgets.QWidget()
        self.actionLayout = QtWidgets.QHBoxLayout()

        self.actionWidget.setLayout(self.actionLayout)

        self.gridLayout.addWidget(self.actionWidget, 4, 0, 1, 3)

        # save button
        self.saveBtn = QtWidgets.QPushButton('Save Rig')
        # self.saveBtn.clicked.connect(self.saveRig)
        self.actionLayout.addWidget(self.saveBtn)

        # import button
        self.importBtn = QtWidgets.QPushButton('ImportRig')
        self.importBtn.clicked.connect(self.importRig)
        self.actionLayout.addWidget(self.importBtn)

        # clear button
        self.clearBtn = QtWidgets.QPushButton('Clear Rig')
        # self.clearBtn.clicked.connect(self.clearRig)
        self.actionLayout.addWidget(self.clearBtn)

        # rig splitter
        self.rigSplitter = Splitter_UI.Splitter(text='Rig Action')
        self.gridLayout.addWidget(self.rigSplitter, 5, 0, 1, 3)

        # rig widget
        self.rigWidget = QtWidgets.QWidget()
        self.rigLayout = QtWidgets.QHBoxLayout()

        self.rigWidget.setLayout(self.rigLayout)

        self.rigLayout.setAlignment(QtCore.Qt.AlignCenter)

        self.createBtn = QtWidgets.QPushButton('Create RIG!')
        self.createBtn.setFixedWidth(120)
        # self.createBtn.clicked.connect(self.createRig)
        self.rigLayout.addWidget(self.createBtn)

        self.gridLayout.addWidget(self.rigWidget, 6, 0, 1, 3)

        # helper joints widget
        self.secondWidget = QtWidgets.QWidget()
        self.mainWidget.addTab(self.secondWidget, 'Helper')

        #####################################################################################
        # skin splitter
        self.skinSplitter = Splitter_UI.Splitter(text='Skin Action')
        self.layout().addWidget(self.skinSplitter)
        self.skinWidget = QtWidgets.QWidget()
        self.layout().addWidget(self.skinWidget)
        self.skinLayout = QtWidgets.QHBoxLayout()
        self.skinWidget.setLayout(self.skinLayout)

        # import Skin
        self.importSkinBtn = QtWidgets.QPushButton('Import Skin')
        self.exportSkinBtn = QtWidgets.QPushButton('Export Skin')

        self.skinLayout.addWidget(self.importSkinBtn)
        self.skinLayout.addWidget(self.exportSkinBtn)

    def addRigWidget(self, rigType=None):

        if not rigType:
            rigType = self.rigTypeCB.currentText()

        self.widget = Rig_UI.RigWidget(rigTypeName=rigType)
        self.scrollLayout.addWidget(self.widget)

        logger.info('Add a %s Rig Part' % rigType)

    def importRig(self):
        """
        Get the rigLog file from the specified directory and set the rig
        :return: None
        """
        directory = self.getDirectory()

        fileName = QtWidgets.QFileDialog.getOpenFileName(self, 'Rig File Browser', directory)

        if not fileName[0]:
            logger.info('You have selected a null file, please check and select again.')
            return
        else:
            with open(fileName[0], 'r') as f:
                properties = json.load(f)

                if not properties:
                    raise RuntimeError('Rig Part name not enter, please check the rig file')

                for key in properties.keys():
                    self.addRigWidget(properties[key]['rigType'])
                    self.widget.rigArgs = properties[key]['rigArgs']
                    self.widget.rigPartLineEdit.setText(str(key))



    def getDirectory(self):
        """
        set and get the rig Log directory
        :return: rig log directory
        """
        rigLogDir = os.path.join(cmds.internalVar(userAppDir=1), 'rigLogFiles')

        if not os.path.exists(rigLogDir):
            os.mkdir(rigLogDir)

        return rigLogDir
