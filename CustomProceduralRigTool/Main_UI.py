from PySide2 import QtWidgets, QtCore
from functools import partial
import maya.OpenMayaUI as omui
import pymel.core as pm
import json
import time
import os
from shiboken2 import wrapInstance

import rigLib
from rigLib.rig import *
from rigLib.base import module as module
from skinLib import skinLib
import logging
import Edit_UI

reload(Edit_UI)
reload(rigLib.rig)
reload(module)
reload(skinLib)


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

    rigTypes = {'IK_AnimalLeg': '',
                'IK_FK_Arm': '',
                'IK_FK_Spine': '',
                'IK_FK_Head_Neck': '',
                'FK_Tail': ''}

    def __init__(self, dock=1):
        """
        Initialize and show the main window.
        :param dock: whether the main window is docked or not
        """
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

        self.spine = {}

        self.buildUI()

        self.parent().layout().addWidget(self)

        self.projectName = ''

        if not dock:
            parent.show()

    def buildUI(self):
        """
        Build the Main UI
        :return: None
        """
        gridLayout = QtWidgets.QGridLayout(self)

        self.rigTypeCB = QtWidgets.QComboBox()

        for rigType in sorted(self.rigTypes.keys()):
            self.rigTypeCB.addItem(rigType)
        gridLayout.addWidget(self.rigTypeCB, 0, 0, 1, 2)

        addBtn = QtWidgets.QPushButton('Add')
        addBtn.clicked.connect(self.addRigWidget)
        gridLayout.addWidget(addBtn, 0, 2)

        # Rig File Name
        proNameLabel = QtWidgets.QLabel('Rig Name: ')
        proNameLabel.setAlignment(QtCore.Qt.AlignCenter)

        self.proNameLineEdit = QtWidgets.QLineEdit('Procedural Rig')
        self.proNameLineEdit.textEdited.connect(self.setLineEditText)

        gridLayout.addWidget(proNameLabel, 1, 0)
        gridLayout.addWidget(self.proNameLineEdit, 1, 1, 1, 2)

        # Scroll Widget
        scrollWidget = QtWidgets.QWidget()
        scrollWidget.setSizePolicy(QtWidgets.QSizePolicy.Maximum, QtWidgets.QSizePolicy.Maximum)
        self.scrollLayout = QtWidgets.QVBoxLayout()
        scrollWidget.setLayout(self.scrollLayout)

        scrollArea = QtWidgets.QScrollArea()
        scrollArea.setWidgetResizable(True)
        scrollArea.setWidget(scrollWidget)

        gridLayout.addWidget(scrollArea, 2, 0, 1, 3)

        # Save Button
        saveBtn = QtWidgets.QPushButton('Save Rig')
        saveBtn.clicked.connect(self.saveRig)
        gridLayout.addWidget(saveBtn, 3, 0)

        # Import Button
        importBtn = QtWidgets.QPushButton('Import Rig')
        importBtn.clicked.connect(self.importRig)
        gridLayout.addWidget(importBtn, 3, 1)

        # Clear Button
        clearBtn = QtWidgets.QPushButton('Clear Rig')
        clearBtn.clicked.connect(self.clearRig)
        gridLayout.addWidget(clearBtn, 3, 2)

        # Create Rig Button
        createBtn = QtWidgets.QPushButton('Create Rig!')
        createBtn.clicked.connect(self.createRig)
        gridLayout.addWidget(createBtn, 4, 1, 1, 1)

        # Skin row
        skinWidget = QtWidgets.QWidget()
        skinLayout = QtWidgets.QHBoxLayout()
        skinWidget.setLayout(skinLayout)
        gridLayout.addWidget(skinWidget, 5, 0, 1, 3)

        # export skin weights btn
        skinExportBtn = QtWidgets.QPushButton('Export Weights')
        skinLayout.addWidget(skinExportBtn)
        skinExportBtn.clicked.connect(skinLib.SkinCluster.export)

        # import skin weights btn
        skinImportBtn = QtWidgets.QPushButton('Import Weights')
        skinLayout.addWidget(skinImportBtn)
        skinImportBtn.clicked.connect(skinLib.SkinCluster.createAndImport)

    def setLineEditText(self):
        """
        Set the Rig project name and store it in self.projectName
        :return: None
        """
        self.projectName = self.proNameLineEdit.text()

    def clearRig(self):
        for rig in self.findChildren(rigWidget):
            rig.deleteRigPart()

    def createRig(self):
        """
        Use the info to create the Rig
        :return:
        """
        if not self.proNameLineEdit.text():
            return None
        # Before create the rig, save the rig first!
        self.saveRig()

        project = module.Base(characterName=self.proNameLineEdit.text())
        # Spine parts
        for rig in self.findChildren(rigWidget):
            if rig.rigTypeName == 'IK_FK_Spine' and rig.rigArgs:
                self.spine = IK_FK_Spine.build(spineJoints=eval(rig.rigArgs['spineJoints']),
                                               prefix=str(eval(rig.rigArgs['prefix'])),
                                               rigScale=eval(rig.rigArgs['rigScale']),
                                               numFK_Jnt=eval(rig.rigArgs['numFK_Jnt']),
                                               baseRig=project)
                logger.debug('%s IK_FK_Spine finished!' % str(rig.rigPartName))
                break
            else:
                logger.debug("Can't find Spine part, please check your joints.")
                continue

        # Other parts
        if self.spine:
            for rig in self.findChildren(rigWidget):
                if rig.rigTypeName == 'IK_FK_Arm' and rig.rigArgs:
                    IK_FK_Arm.build(armJoints=eval(rig.rigArgs['armJoints']),
                                    prefix=str(eval(rig.rigArgs['prefix'])),
                                    rigScale=eval(rig.rigArgs['rigScale']),
                                    FK_Parent=self.spine['chest_Ctrl'],
                                    switchCtrlPos=rig.rigArgs['switchCtrlPos'],
                                    baseRig=project)
                    logger.info('%s IK_FK_Arm build complete!' % str(rig.rigPartName))
                    continue

                elif rig.rigTypeName == 'IK_AnimalLeg' and rig.rigArgs:
                    IK_AnimalLeg.build(legJoints=eval(rig.rigArgs['legJoints']),
                                       revJntlocList=eval(rig.rigArgs['revJntlocList']),
                                       ankleRollLoc=rig.rigArgs['ankleRollLoc'],
                                       prefix=str(eval(rig.rigArgs['prefix'])),
                                       rigScale=eval(rig.rigArgs['rigScale']),
                                       baseRig=project)
                    logger.info('%s IK_Leg build complete!' % str(rig.rigPartName))
                    continue
                elif rig.rigTypeName == 'IK_FK_Head_Neck' and rig.rigArgs:
                    IK_FK_Head_Neck.build(neckJoints=eval(rig.rigArgs['neckJoints']),
                                          rigScale=eval(rig.rigArgs['rigScale']),
                                          prefix=str(eval(rig.rigArgs['prefix'])),
                                          blendCtrl_Pos=rig.rigArgs['blendCtrl_Pos'],
                                          baseRig=project)
                    continue
                elif rig.rigTypeName == 'FK_Tail' and rig.rigArgs:
                    FK_Tail.build(tailJoints=eval(rig.rigArgs['tailJoints']),
                                  FK_Parent=self.spine['pelvis_Ctrl'],
                                  rigScale=1.0,
                                  prefix=str(eval(rig.rigArgs['prefix'])),
                                  baseRig=project)
                    continue
                else:
                    logger.debug("Can't find the specified part, please check your rig type.")
        else:
            for rig in self.findChildren(rigWidget):
                if rig.rigTypeName == 'IK_FK_Arm' and rig.rigArgs:
                    IK_FK_Arm.build(armJoints=eval(rig.rigArgs['armJoints']),
                                    prefix=str(eval(rig.rigArgs['prefix'])),
                                    rigScale=eval(rig.rigArgs['rigScale']),
                                    switchCtrlPos=rig.rigArgs['switchCtrlPos'],
                                    baseRig=project)
                    logger.info('%s IK_FK_Arm build complete!' % str(rig.rigPartName))
                    continue

                elif rig.rigTypeName == 'IK_AnimalLeg' and rig.rigArgs:
                    IK_AnimalLeg.build(legJoints=eval(rig.rigArgs['legJoints']),
                                       revJntlocList=eval(rig.rigArgs['revJntlocList']),
                                       ankleRollLoc=rig.rigArgs['ankleRollLoc'],
                                       prefix=str(eval(rig.rigArgs['prefix'])),
                                       rigScale=eval(rig.rigArgs['rigScale']),
                                       baseRig=project)
                    logger.info('%s IK_Leg build complete!' % str(rig.rigPartName))
                    continue
                elif rig.rigTypeName == 'IK_FK_Head_Neck' and rig.rigArgs:
                    IK_FK_Head_Neck.build(neckJoints=eval(rig.rigArgs['neckJoints']),
                                          rigScale=eval(rig.rigArgs['rigScale']),
                                          prefix=str(eval(rig.rigArgs['prefix'])),
                                          blendCtrl_Pos=rig.rigArgs['blendCtrl_Pos'],
                                          baseRig=project)
                    continue
                elif rig.rigTypeName == 'FK_Tail' and rig.rigArgs:
                    FK_Tail.build(tailJoints=eval(rig.rigArgs['tailJoints']),
                                  rigScale=1.0,
                                  prefix=str(eval(rig.rigArgs['prefix'])),
                                  baseRig=project)
                    continue
                else:
                    logger.debug("Can't find the specified part, please check your rig type.")

        logger.info("Create rig complete!")

    def importRig(self):
        """
        Get the rigLog file from the specified directory and set the rig
        :return: None
        """
        directory = self.getDirectory()
        # fileName = ['','']
        fileName = QtWidgets.QFileDialog.getOpenFileName(self, 'Rig File Browser', directory)

        if not fileName[0]:
            logger.debug('You have selected a null file, please check and select again.')
            return
        else:
            with open(fileName[0], 'r') as f:
                properties = json.load(f)

                # check the properties is None or not
                if not properties:
                    raise RuntimeError('Procedural Rig Name not found, please check the rig file')
                else:
                    # Set the rig project name first
                    self.proNameLineEdit.setText(str(properties['Procedural Rig Name']))
                    # Delete the key and info to get the other info in a for loop
                    del properties['Procedural Rig Name']

                # Set the info
                for key in properties.keys():
                    self.addRigWidget(properties[key]['rigType'])
                    self.widget.rigArgs = properties[key]['rigArgs']
                    self.widget.rigPartLineEdit.setText(str(key))
                    # Be sure to set the rigPartName of each widget
                    self.widget.setRigPartName()

            logger.info('import %s rig log file.' % fileName[0])

    def saveRig(self):
        """
        Save the rig info to a .json file at the specified directory
        :return: None
        """
        properties = {}
        properties['Procedural Rig Name'] = str(self.projectName)

        for rig in self.findChildren(rigWidget):
            if str(rig.rigPartName) in properties.keys():
                # raise RuntimeError("Rig file save failed, you have already same name rig part name!")
                logger.debug("Rig file save failed, you have already same name rig part!!!")
                break
            properties[str(rig.rigPartName)] = {}
            properties[str(rig.rigPartName)]['rigType'] = rig.rigTypeName
            properties[str(rig.rigPartName)]['rigArgs'] = rig.rigArgs

        if len(properties.keys()) == len(self.findChildren(rigWidget)) + 1:

            rigLogDir = self.getDirectory()
            rigLogFile = os.path.join(rigLogDir, 'rigLogFile_%s.json' % time.strftime('%m%d_%H_%M'))
            with open(rigLogFile, 'w') as f:
                json.dump(properties, f, indent=4)

            logger.info('Saving rig file to %s' % rigLogFile)

    def addRigWidget(self, rigType=None):
        """
        Add rig widget to the scroll Layout with specified rigType
        :param rigType: rigType of the rig widget
        :return: None
        """
        if not rigType:
            rigType = self.rigTypeCB.currentText()

        self.widget = rigWidget(rigType)
        self.scrollLayout.addWidget(self.widget)

        logger.debug('Add a %s Rig Part' % rigType)

    def getDirectory(self):
        """
        set and get the rig Log directory
        :return: rig log directory
        """
        rigLogDir = os.path.join(pm.internalVar(userAppDir=1), 'rigLogFiles')
        if not os.path.exists(rigLogDir):
            os.mkdir(rigLogDir)
        return rigLogDir


class rigWidget(QtWidgets.QWidget):

    def __init__(self, rigTypeName):
        super(rigWidget, self).__init__()

        self.setMinimumWidth(250)

        self.rigArgs = {}

        self.rigTypeName = rigTypeName

        self.rigPartName = None
        self.rigPartLineEdit = None
        self.editBtn = None
        self.buildUI()

    def buildUI(self):
        """
        build the Rig UI
        :return: None
        """

        editWidgetLayout = QtWidgets.QVBoxLayout()
        self.setLayout(editWidgetLayout)

        editWidgetLayout.setAlignment(QtCore.Qt.AlignTop)
        editWidgetLayout.setSpacing(5)

        closeBtnLayout = QtWidgets.QHBoxLayout()
        editLineLayout = QtWidgets.QHBoxLayout()
        editBtnLayout = QtWidgets.QHBoxLayout()

        editWidgetLayout.addLayout(closeBtnLayout)
        editWidgetLayout.addLayout(editLineLayout)
        editWidgetLayout.addLayout(editBtnLayout)

        closeBtn = QtWidgets.QPushButton('X')
        closeBtn.clicked.connect(self.deleteRigPart)
        closeBtn.setMaximumWidth(20)
        closeBtnLayout.addWidget(closeBtn)
        closeBtnLayout.setAlignment(QtCore.Qt.AlignLeft)

        label = QtWidgets.QLabel('Rig part: ')
        label.setAlignment(QtCore.Qt.AlignRight)
        self.rigPartLineEdit = QtWidgets.QLineEdit(str(self.rigTypeName))
        self.rigPartLineEdit.textEdited.connect(self.setRigPartName)
        editLineLayout.addWidget(label)
        editLineLayout.addWidget(self.rigPartLineEdit)

        self.editBtn = QtWidgets.QPushButton('Edit...')
        self.editBtn.setMaximumWidth(80)
        self.editBtn.clicked.connect(self.editRigPart)
        editBtnLayout.addWidget(self.editBtn)

    def deleteRigPart(self):
        """
        delete the rig part
        :return: None
        """
        self.setParent(None)
        self.setVisible(False)
        self.deleteLater()

    def editRigPart(self):
        """
        Set the rig part info
        :return: None
        """
        if self.rigTypeName == 'IK_FK_Spine':
            Edit_UI.IK_FK_Spine_EditUI(self, self.rigTypeName)
        elif self.rigTypeName == 'IK_FK_Arm':
            Edit_UI.IK_FK_Arm_EditUI(self, self.rigTypeName)
        elif self.rigTypeName == 'IK_AnimalLeg':
            Edit_UI.IK_AnimalLeg_EditUI(self, self.rigTypeName)
        elif self.rigTypeName == 'FK_Tail':
            Edit_UI.FK_Tail_EditUI(self, self.rigTypeName)
        elif self.rigTypeName == 'IK_FK_Head_Neck':
            Edit_UI.IK_FK_Head_Neck_EditUI(self, self.rigTypeName)
        else:
            logger.debug('Unknown rig type...')

        logger.info('Edit %s Rig Part...' % self.rigTypeName)

    def setRigPartName(self):
        """
        Set the rig part name of the widget
        :return: None
        """
        self.rigPartName = self.rigPartLineEdit.text()
