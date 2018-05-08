from PySide2 import QtWidgets, QtCore, QtGui
from functools import partial
import maya.OpenMayaUI as omui
import pymel.core as pm
import json
import time
import os
from shiboken2 import wrapInstance

import logging


logging.basicConfig()
logger = logging.getLogger('ProceduralRiggingTool')
logger.setLevel(logging.DEBUG)


def getMayaMainWindow():
    """
    get maya main window
    :return: ptr of maya main window as QMainWindow
    """
    win = omui.MQtUtil.mainWindow()
    ptr = wrapInstance(long(win), QtWidgets.QMainWindow)
    return ptr


def deleteDock(name='ProceduralRiggingTool'):
    """
    delete the Dock
    :param name: Dock name
    :return: None
    """
    if pm.workspaceControl(name, query=1, exists=1):
        pm.deleteUI(name)


def getDock(name='ProceduralRiggingTool'):
    """
    Delete existing Dock and create a Dock Ctrl, finally return the ptr of the new Dock ctrl
    :param name: Dock name
    :return: ptr of the new create Dock as QWidget
    """
    deleteDock(name)

    ctrl = pm.workspaceControl(name, dockToMainWindow=('right', 1), label='ProceduralRiggingTool')

    qtCtrl = omui.MQtUtil.findControl(ctrl)
    ptr = wrapInstance(long(qtCtrl), QtWidgets.QWidget)

    return ptr




class RiggingMainUI(QtWidgets.QWidget):

    rigTypes = {"head": partial(pm.polyCube, name='head'),
                "leg": partial(pm.sphere, name='leg'),
                "body": partial(pm.cylinder, name='body')}

    def __init__(self, dock=1):
        if dock:
            parent = getDock()
        else:
            deleteDock()
            try:
                pm.deleteUI('ProceduralRiggingTool')
            except:
                logger.debug('No previous UI exists!')

            parent = QtWidgets.QDialog(parent=getMayaMainWindow())
            parent.setObjectName('ProceduralRiggingTool')
            parent.setWindowTitle('Procedural Rigging Tool')
            layout = QtWidgets.QVBoxLayout(parent)

        super(RiggingMainUI, self).__init__(parent=parent)

        self.buildUI()

        self.parent().layout().addWidget(self)

        self.projectName = ''

        if not dock:
            parent.show()


    def buildUI(self):
        layout = QtWidgets.QGridLayout(self)

        self.rigTypeCB = QtWidgets.QComboBox()

        for rigType in sorted(self.rigTypes):
            self.rigTypeCB.addItem(rigType)
        layout.addWidget(self.rigTypeCB, 0, 0, 1, 2)

        addBtn = QtWidgets.QPushButton('Add')
        addBtn.clicked.connect(self.addRigWidget)
        layout.addWidget(addBtn, 0, 2)

        # Rig File Name
        proNameLabel = QtWidgets.QLabel('Rig Name: ')
        proNameLabel.setAlignment(QtCore.Qt.AlignCenter)

        self.proNameLineEdit = QtWidgets.QLineEdit('Procedural Rig')
        self.proNameLineEdit.textEdited.connect(self.setLineEditText)

        layout.addWidget(proNameLabel, 1, 0)
        layout.addWidget(self.proNameLineEdit, 1, 1, 1, 2)

        # Scroll Widget
        scrollWidget = QtWidgets.QWidget()
        scrollWidget.setSizePolicy(QtWidgets.QSizePolicy.Maximum, QtWidgets.QSizePolicy.Maximum)
        self.scrollLayout = QtWidgets.QVBoxLayout(scrollWidget)

        scrollArea = QtWidgets.QScrollArea()
        scrollArea.setWidgetResizable(True)
        scrollArea.setWidget(scrollWidget)
        layout.addWidget(scrollArea, 2, 0, 1, 3)

        # Save Button
        saveBtn = QtWidgets.QPushButton('Save Rig')
        saveBtn.clicked.connect(self.saveRig)
        layout.addWidget(saveBtn, 3, 0)

        # Import Button
        importBtn = QtWidgets.QPushButton('Import Rig')
        importBtn.clicked.connect(self.importRig)
        layout.addWidget(importBtn, 3, 1)

        # Create Rig Button
        createBtn = QtWidgets.QPushButton('Create Rig!')
        createBtn.clicked.connect(self.createRig)
        layout.addWidget(createBtn, 3, 2)

        # Skin row
        skinWidget = QtWidgets.QWidget()
        skinLayout = QtWidgets.QHBoxLayout()
        skinWidget.setLayout(skinLayout)
        layout.addWidget(skinWidget, 4, 0, 1, 3)
        skinExportBtn = QtWidgets.QPushButton('Export Weights')
        skinImportBtn = QtWidgets.QPushButton('Import Weights')
        skinLayout.addWidget(skinExportBtn)
        skinLayout.addWidget(skinImportBtn)

    def setLineEditText(self):
        self.projectName = self.proNameLineEdit.text()

    def createRig(self):
        self.saveRig()
        print "create Rig!"

    def importRig(self):
        print "import RIG log file"

    def saveRig(self):
        """
        Save the rig file to the disk
        :return: None
        """
        properties = {}
        properties['Procedural Rig Name'] = str(self.projectName)


        for rig in self.findChildren(rigWidget):
            if str(rig.rigPartName) in properties.keys():
                # raise RuntimeError("Rig file save failed, you have already same name rig part name!")
                logger.info("Rig file save failed, you have already same name rig part!!!")
                break
            properties[str(rig.rigPartName)] = {}
            properties[str(rig.rigPartName)]['rigType'] = rig.rigTypeName

        if len(properties.keys()) == len(self.findChildren(rigWidget)) + 1:

            rigLogDir = self.getDirectory()
            rigLogFile = os.path.join(rigLogDir, 'rigLogFile_%s.json' % time.strftime('%m%d_%H_%M'))
            with open(rigLogFile, 'w') as f:
                json.dump(properties, f, indent=4)

            logger.info('Saving rig file to %s' % rigLogFile)


    def addRigWidget(self, rigType=None):
        if not rigType:
            rigType = self.rigTypeCB.currentText()

        widget = rigWidget(rigType)
        self.scrollLayout.addWidget(widget)
        print 'Add Rig Part'

    def getDirectory(self):
        rigLogDir = os.path.join(pm.internalVar(userAppDir=1), 'rigLogFiles')
        if not os.path.exists(rigLogDir):
            os.mkdir(rigLogDir)
        return rigLogDir


class rigWidget(QtWidgets.QWidget):

    def __init__(self, rigTypeName):
        super(rigWidget, self).__init__()

        self.setMinimumWidth(250)

        self.property = {}

        self.rigTypeName = rigTypeName

        self.rigPartName = None
        self.rigPartLineEdit = None
        self.editBtn = None
        self.buildUI()

    def buildUI(self):
        layout = QtWidgets.QGridLayout(self)
        layout.setRowStretch(1, 1)
        layout.setRowStretch(2, 1)
        label = QtWidgets.QLabel('Rig part: ')
        label.setAlignment(QtCore.Qt.AlignRight)

        self.rigPartLineEdit = QtWidgets.QLineEdit(str(self.rigTypeName))
        self.rigPartLineEdit.textEdited.connect(self.setRigPartName)

        closeBtn = QtWidgets.QPushButton('X')
        closeBtn.clicked.connect(self.deleteRigPart)
        closeBtn.setMaximumWidth(20)


        self.editBtn = QtWidgets.QPushButton('Edit...')
        # self.editBtn.setMaximumWidth(80)
        self.editBtn.clicked.connect(self.editRigPart)

        layout.addWidget(closeBtn, 0, 0, 1, 1)
        layout.addWidget(label, 1, 0, 1, 1)
        layout.addWidget(self.rigPartLineEdit, 1, 1, 1, 2)
        layout.addWidget(self.editBtn, 2, 0, 1, 3)

    def deleteRigPart(self):
        self.setParent(None)
        self.setVisible(False)
        self.deleteLater()

    def editRigPart(self):
        print "Edit Rig Part..."

    def setRigPartName(self):
        self.rigPartName = self.rigPartLineEdit.text()

