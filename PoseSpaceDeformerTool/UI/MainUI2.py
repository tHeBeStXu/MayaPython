import maya.cmds as cmds
import maya.OpenMaya as om
import maya.OpenMayaUI as omui
import os
import sys
import logging
from PySide2 import QtWidgets, QtCore, QtGui, QtUiTools
from shiboken2 import wrapInstance

logging.basicConfig()
logger = logging.getLogger('AnimLibrary')
logger.setLevel(logging.INFO)


def getMayaMainWindow():
    """
    Get maya main window as a pointer
    :return: pointer of maya main window as QmainWindow
    """
    win = omui.MQtUtil.mainWindow()
    ptr = wrapInstance(long(win), QtWidgets.QMainWindow)
    return ptr


def deleteDock(name='PoseSpaceDeformerTool'):
    """
    Delete the dock window
    :param name: Dock Name
    :return: None
    """
    if cmds.workspaceControl(name, q=1, exists=1):
        cmds.deleteUI(name)


def getDock(name='PoseSpaceDeformerTool'):
    """
    Delete existing dock window and create a dock control, finally return the pointer of the new dock control
    :param name: Dock name
    :return: pointer of the new created dock as QWidget
    """
    deleteDock(name)
    control = cmds.workspaceControl(name, dockToMainWindow=['right', 1], label = 'PSD_TOOL')

    qtCtrl = omui.MQtUtil.findControl(control)
    pointer = wrapInstance(long(qtCtrl), QtWidgets.QWidget)

    return pointer


class MainUI(QtWidgets.QWidget):
    def __init__(self, dock=1):
        """
        Initialize and show the main window.
        :param dock: bool, whether the tool is docked or not
        """
        if dock:
            parent = getDock()
        else:
            deleteDock()

            try:
                cmds.deleteUI('PoseSpaceDeformerTool')
            except:
                logger.info('No previous UI exists!')

            parent = QtWidgets.QDialog(parent=getMayaMainWindow())
            parent.setObjectName('PoseSpaceDeformerTool')
            parent.setWindowTitle('Pose Space Deformer Tool')

            layout = QtWidgets.QVBoxLayout(parent)

        super(MainUI, self).__init__(parent=parent)

        # Build UI
        self.buildUI()

        self.parent().layout().addWidget(self)

        if not dock:
            self.parent().show()

    def buildUI(self):
        """
        Build UI Element
        :return: None
        """
        # main layout and main widget
        self.mainLayout = QtWidgets.QVBoxLayout()
        self.setLayout(self.mainLayout)

