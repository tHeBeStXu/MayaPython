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

        self.mainWidget = QtWidgets.QTabWidget()
        self.layout().addWidget(self.mainWidget)

        #######################
        # Export & Import PSD #
        #######################
        fileDirLayout = QtWidgets.QGridLayout()
        pathLabel = QtWidgets.QLabel('Path: ')
        self.PSDfilePathLineEdit = QtWidgets.QLineEdit()
        self.browseBtn = QtWidgets.QPushButton('Browse')
        self.openBtn = QtWidgets.QPushButton('Open')
        fileDirLayout.addWidget(pathLabel, 0, 0, 1, 1)
        fileDirLayout.addWidget(self.PSDfilePathLineEdit, 0, 1, 1, 4)
        fileDirLayout.addWidget(self.browseBtn, 0, 5, 1, 1)
        fileDirLayout.addWidget(self.openBtn, 0, 6, 1, 1)

        exportImportLayout = QtWidgets.QHBoxLayout()
        self.exportPSDBtn = QtWidgets.QPushButton('Export PSD')
        self.importPSDBtn = QtWidgets.QPushButton('Import PSD')
        exportImportLayout.addWidget(self.exportPSDBtn)
        exportImportLayout.addWidget(self.importPSDBtn)

        self.layout().addLayout(fileDirLayout)
        self.layout().addLayout(exportImportLayout)

        ############
        # Pose Tab #
        ############
        self.poseWidget = QtWidgets.QWidget()
        self.mainWidget.addTab(self.poseWidget, 'Pose')

        self.poseWidgetLayout = QtWidgets.QHBoxLayout()
        self.poseWidget.setLayout(self.poseWidgetLayout)

        # Pose Part
        self.posePartWidget = QtWidgets.QWidget()
        self.poseLayout = QtWidgets.QVBoxLayout()
        self.posePartWidget.setLayout(self.poseLayout)
        self.poseWidgetLayout.addWidget(self.posePartWidget)

        self.poseLabel = QtWidgets.QLabel('Pose:')

        self.poseTreeView = QtWidgets.QTreeView()

        self.searchLayout = QtWidgets.QHBoxLayout()
        self.searchLabel = QtWidgets.QLabel('Search:')
        self.searchTextLineEdit = QtWidgets.QLineEdit()
        self.searchLayout.addWidget(self.searchLabel)
        self.searchLayout.addWidget(self.searchTextLineEdit)

        self.poseLayout.addWidget(self.poseLabel)
        self.poseLayout.addWidget(self.poseTreeView)
        self.poseLayout.addLayout(self.searchLayout)

        # Setting Part
        self.settingPartWidget = QtWidgets.QWidget()
        self.settingLayout = QtWidgets.QGridLayout()
        self.settingPartWidget.setLayout(self.settingLayout)
        self.poseWidgetLayout.addWidget(self.settingPartWidget)

        self.settingLabel = QtWidgets.QLabel('Setting:')
        self.settingLayout.addWidget(self.settingLabel, 0, 0, 1, 1)

        # Driver Part
        self.driverGroupBox = QtWidgets.QGroupBox()
        self.driverGroupBox.setFixedSize(250, 400)
        self.settingLayout.addWidget(self.driverGroupBox, 1, 0, 1, 1)
        self.driverGroupBox.setTitle('Driver')
        self.driverGridLayout = QtWidgets.QGridLayout()
        self.driverGroupBox.setLayout(self.driverGridLayout)

        self.spaceLabel = QtWidgets.QLabel('Space:')
        self.objectLabel = QtWidgets.QLabel('Object:')
        self.axisLabel = QtWidgets.QLabel('Axis:')
        self.ctrlLabel = QtWidgets.QLabel('Control:')
        self.poseReaderLabel = QtWidgets.QLabel('PoseReader:')

        self.spaceLineEdit = QtWidgets.QLineEdit()
        self.objectLineEdit = QtWidgets.QLineEdit()
        self.axisComboBox = QtWidgets.QComboBox()
        self.ctrlListWidget = QtWidgets.QListWidget()
        self.poseReaderSlider = QtWidgets.QSlider(QtCore.Qt.Horizontal)

        self.createPoseReaderBtn = QtWidgets.QPushButton('Create Pose Reader')
        self.applyPoseReaderChangeBtn = QtWidgets.QPushButton('Apply Pose Reader Change')

        self.driverGridLayout.addWidget(self.spaceLabel, 0, 0, 1, 1)
        self.driverGridLayout.addWidget(self.spaceLineEdit, 0, 1, 1, 2)

        self.driverGridLayout.addWidget(self.objectLabel, 1, 0, 1, 1)
        self.driverGridLayout.addWidget(self.objectLineEdit, 1, 1, 1, 2)

        self.driverGridLayout.addWidget(self.axisLabel, 2, 0, 1, 1)
        self.driverGridLayout.addWidget(self.axisComboBox, 2, 1, 1, 2)

        self.driverGridLayout.addWidget(self.ctrlLabel, 3, 0, 6, 1)
        self.driverGridLayout.addWidget(self.ctrlListWidget, 3, 1, 6, 2)

        self.driverGridLayout.addWidget(self.poseReaderLabel, 9, 0, 1, 1)
        self.driverGridLayout.addWidget(self.poseReaderSlider, 9, 1, 1, 2)

        self.driverGridLayout.addWidget(self.createPoseReaderBtn, 10, 1, 1, 2)
        self.driverGridLayout.addWidget(self.applyPoseReaderChangeBtn, 11, 1, 1, 2)

        # Key Part
        self.keyGroupBox = QtWidgets.QGroupBox()
        self.keyGroupBox.setFixedSize(250, 400)
        self.settingLayout.addWidget(self.keyGroupBox, 1, 1, 1, 1)
        self.keyGroupBox.setTitle('Key')
        self.keyLayout = QtWidgets.QVBoxLayout()
        self.keyGroupBox.setLayout(self.keyLayout)

        # Target Geometry Part
        self.targetGeometryGroupBox = QtWidgets.QGroupBox()
        self.targetGeometryGroupBox.setTitle('Target Geometry')
        self.settingLayout.addWidget(self.targetGeometryGroupBox, 2, 0, 1, 2)
        self.targetGeometryLayout = QtWidgets.QGridLayout()
        self.targetGeometryGroupBox.setLayout(self.targetGeometryLayout)

        self.targetGeometryListWidget = QtWidgets.QListWidget()
        self.targetGeometryLayout.addWidget(self.targetGeometryListWidget, 0, 0, 5, 3)

        self.addGeoBtn = QtWidgets.QPushButton('Add Geo')
        self.removeGeoBtn = QtWidgets.QPushButton('Remove Geo')
        self.targetGeometryLayout.addWidget(self.addGeoBtn, 0, 3, 1, 1)
        self.targetGeometryLayout.addWidget(self.removeGeoBtn, 0, 4, 1, 1)

        self.visibleBtnGroup = QtWidgets.QButtonGroup()
        self.hideBaseRadioBtn = QtWidgets.QRadioButton('Hide Base')
        self.showBaseRadioBtn = QtWidgets.QRadioButton('Show Base')
        self.visibleBtnGroup.addButton(self.hideBaseRadioBtn)
        self.visibleBtnGroup.addButton(self.showBaseRadioBtn)
        self.targetGeometryLayout.addWidget(self.hideBaseRadioBtn, 1, 3, 1, 1)
        self.targetGeometryLayout.addWidget(self.showBaseRadioBtn, 1, 4, 1, 1)

        self.createSculptBtn = QtWidgets.QPushButton('Create Sculpt')
        self.bakeSculptBtn = QtWidgets.QPushButton('Bake Sculpt')
        self.targetGeometryLayout.addWidget(self.createSculptBtn, 2, 3, 1, 1)
        self.targetGeometryLayout.addWidget(self.bakeSculptBtn, 2, 4, 1, 1)

        self.copyBtn = QtWidgets.QPushButton('Copy')
        self.pasteBtn = QtWidgets.QPushButton('Paste')
        self.targetGeometryLayout.addWidget(self.copyBtn, 3, 3, 1, 1)
        self.targetGeometryLayout.addWidget(self.pasteBtn, 3, 4, 1, 1)

        self.mirrorSculpt = QtWidgets.QPushButton('Mirror Sculpt')
        self.originalMesh = QtWidgets.QPushButton('Original Mesh')
        self.targetGeometryLayout.addWidget(self.mirrorSculpt, 4, 3, 1, 1)
        self.targetGeometryLayout.addWidget(self.originalMesh, 4, 4, 1, 1)

        self.adjustmentGroupBox = QtWidgets.QGroupBox()
        self.targetGeometryLayout.addWidget(self.adjustmentGroupBox, 5, 0, 1, 5)
        self.adjustmentLayout = QtWidgets.QGridLayout()
        self.adjustmentGroupBox.setLayout(self.adjustmentLayout)

        self.adjustmentLabel = QtWidgets.QLabel('')
        self.adjustmentSlider = QtWidgets.QSlider(QtCore.Qt.Horizontal)
        self.adjustmentSelectBtn = QtWidgets.QPushButton('Select')
        self.adjustmentLayout.addWidget(self.adjustmentLabel, 0, 0, 1, 1)
        self.adjustmentLayout.addWidget(self.adjustmentSlider, 0, 2, 1, 3)
        self.adjustmentLayout.addWidget(self.adjustmentSelectBtn, 0, 5, 1, 1)



