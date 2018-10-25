from PySide2 import QtWidgets, QtCore
from functools import partial
import maya.OpenMayaUI as omui
import os
import time
import json

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
            parent.setFixedSize(270, 600)
            layout = QtWidgets.QVBoxLayout(parent)

        super(RiggingMainUI, self).__init__(parent=parent)

        self.build()

        self.parent().layout().addWidget(self)

        if not dock:
            self.parent().show()

    def build(self):
        self.setFixedWidth(250)

        self.gridLayout = QtWidgets.QGridLayout()
        self.setLayout(self.gridLayout)

        self.layout().setContentsMargins(0, 0, 0, 0)

        #
        self.rigTypeCB = QtWidgets.QComboBox()

        self.rigTypeCB.clear()
        for rigType in sorted(self.rigTypes.keys()):
            self.rigTypeCB.addItem(rigType)

        self.gridLayout.addWidget(self.rigTypeCB, 0, 0, 1, 2)

        self.addBtn = QtWidgets.QPushButton('Add')
        # self.addBtn.clicked.connect(self.addRigWidget)
        self.gridLayout.addWidget(self.addBtn, 0, 2, 1, 1)

        # scroll widget
        self.scrollWidget = QtWidgets.QWidget()
        self.scrollLayout = QtWidgets.QVBoxLayout()
        self.scrollLayout.setAlignment(QtCore.Qt.AlignTop & QtCore.Qt.AlignLeft)
        self.scrollWidget.setLayout(self.scrollLayout)

        self.scrollArea = QtWidgets.QScrollArea()
        self.scrollArea.setFixedWidth(250)
        self.scrollArea.setFixedHeight(420)
        self.scrollArea.setWidget(self.scrollWidget)
        self.scrollArea.setFocusPolicy(QtCore.Qt.NoFocus)
        self.scrollArea.setHorizontalScrollBarPolicy(QtCore.Qt.ScrollBarAlwaysOff)

        self.gridLayout.addWidget(self.scrollArea, 1, 0, 1, 3)

        # save button
        self.saveBtn = QtWidgets.QPushButton('Save Rig')
        # self.saveBtn.clicked.connect(self.saveRig)
        self.gridLayout.addWidget(self.saveBtn, 2, 0)

        # import button
        self.importBtn = QtWidgets.QPushButton('ImportRig')
        # self.importBtn.clicked.connect(self.importRig)
        self.gridLayout.addWidget(self.importBtn, 2, 1)

        # clear button
        self.clearBtn = QtWidgets.QPushButton('Clear Rig')
        # self.clearBtn.clicked.connect(self.clearRig)
        self.gridLayout.addWidget(self.clearBtn, 2, 2)

        # rig Button
        self.createBtn = QtWidgets.QPushButton('Create RIG!')
        # self.createBtn.clicked.connect(self.createRig)
        self.gridLayout.addWidget(self.createBtn, 3, 1, 1, 1)



