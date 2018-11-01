from PySide2 import QtWidgets, QtCore, QtGui
import maya.OpenMayaUI as omui
import pymel.core as pm
import json
import time
import os
import Splitter_UI
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
reload(Splitter_UI)


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

    twistTypes = {'Blend_RollChain': ''}

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
                logger.info('No previous UI exists!')

            parent = QtWidgets.QDialog(parent=getMayaMainWindow())
            parent.setObjectName('ProceduralRiggingTool')
            parent.setWindowTitle('Procedural Rigging Tool')
            parent.setFixedSize(270, 780)
            layout = QtWidgets.QVBoxLayout(parent)

        super(RiggingMainUI, self).__init__(parent=parent)

        self.mainSpine = {}
        self.attachSpine = {}

        self.buildUI()

        self.parent().layout().addWidget(self)

        # self.projectName = ''

        if not dock:
            self.parent().show()

    def buildUI(self):
        """
        Build the Main UI
        :return: None
        """
        self.setFixedSize(250, 750)
        self.mainLayout = QtWidgets.QVBoxLayout()
        self.setLayout(self.mainLayout)

        # tabWidget
        self.mainWidget = QtWidgets.QTabWidget()

        self.mainWidget.setFixedSize(250, 680)
        self.layout().addWidget(self.mainWidget)
        # rigTab
        self.firstWidget = QtWidgets.QWidget()
        self.mainWidget.addTab(self.firstWidget, 'Rig')

        gridLayout = QtWidgets.QGridLayout(self)
        self.firstWidget.setLayout(gridLayout)

        self.layout().setContentsMargins(0, 0, 0, 0)

        # Rig File Name
        self.proSplitter = Splitter_UI.Splitter(text='Procedural Rigging Tool')
        gridLayout.addWidget(self.proSplitter, 0, 0, 1, 3)

        proNameLabel = QtWidgets.QLabel('Rig Name: ')
        proNameLabel.setAlignment(QtCore.Qt.AlignCenter)

        self.rigProNameLineEdit = QtWidgets.QLineEdit('')
        self.rigProNameLineEdit.setPlaceholderText('Enter a Project Name')

        gridLayout.addWidget(proNameLabel, 1, 0, 1, 1)
        gridLayout.addWidget(self.rigProNameLineEdit, 1, 1, 1, 2)

        # combo part
        self.comboSplitter = Splitter_UI.Splitter(text='Select & Add')
        gridLayout.addWidget(self.comboSplitter, 2, 0, 1, 3)

        self.rigTypeCB = QtWidgets.QComboBox()

        for rigType in sorted(self.rigTypes.keys()):
            self.rigTypeCB.addItem(rigType)
        gridLayout.addWidget(self.rigTypeCB, 3, 0, 1, 2)

        addBtn = QtWidgets.QPushButton('Add')
        addBtn.clicked.connect(self.addRigWidget)
        gridLayout.addWidget(addBtn, 3, 2, 1, 1)

        # Scroll Widget
        self.rigScrollWidget = QtWidgets.QWidget()
        self.rigScrollLayout = QtWidgets.QVBoxLayout()
        self.rigScrollLayout.setAlignment(QtCore.Qt.AlignTop | QtCore.Qt.AlignLeft)
        self.rigScrollWidget.setLayout(self.rigScrollLayout)

        scrollArea = QtWidgets.QScrollArea()
        scrollArea.setFixedSize(230, 390)
        scrollArea.setWidgetResizable(True)
        scrollArea.setWidget(self.rigScrollWidget)
        scrollArea.setFocusPolicy(QtCore.Qt.NoFocus)
        scrollArea.setHorizontalScrollBarPolicy(QtCore.Qt.ScrollBarAlwaysOff)

        gridLayout.addWidget(scrollArea, 4, 0, 1, 3)

        # utils splitter
        self.utilsSplitter = Splitter_UI.Splitter(text='Rig Utils')
        gridLayout.addWidget(self.utilsSplitter, 5, 0, 1, 3)

        self.actionWidget = QtWidgets.QWidget()
        self.actionLayout = QtWidgets.QHBoxLayout()
        self.actionWidget.setLayout(self.actionLayout)

        gridLayout.addWidget(self.actionWidget, 6, 0, 1, 3)
        # Save Button
        saveBtn = QtWidgets.QPushButton('Save Rig')
        saveBtn.clicked.connect(self.saveRig)
        self.actionLayout.addWidget(saveBtn)

        # Import Button
        importBtn = QtWidgets.QPushButton('Import Rig')
        importBtn.clicked.connect(self.importRig)
        self.actionLayout.addWidget(importBtn)

        # Clear Button
        clearBtn = QtWidgets.QPushButton('Clear Rig')
        clearBtn.clicked.connect(self.clearRig)
        self.actionLayout.addWidget(clearBtn)

        # rig splitter
        self.rigSplitter = Splitter_UI.Splitter(text='Rig Action')
        gridLayout.addWidget(self.rigSplitter, 7, 0, 1, 3)

        # Create Rig Button
        self.rigWidget = QtWidgets.QWidget()
        self.rigLayout = QtWidgets.QHBoxLayout()

        self.rigWidget.setLayout(self.rigLayout)

        self.rigLayout.setAlignment(QtCore.Qt.AlignCenter)

        createBtn = QtWidgets.QPushButton('Create Rig!')
        createBtn.setFixedWidth(120)
        createBtn.clicked.connect(self.createRig)
        self.rigLayout.addWidget(createBtn)

        gridLayout.addWidget(self.rigWidget, 8, 0, 1, 3)

        ########################################################################
        # twist joints widget
        self.twistTabWidget = QtWidgets.QWidget()
        self.mainWidget.addTab(self.twistTabWidget, 'Twist')

        self.twistTabLayout = QtWidgets.QGridLayout()
        self.twistTabWidget.setLayout(self.twistTabLayout)

        self.layout().setContentsMargins(0, 0, 0, 0)

        # Rig File Name
        self.twistProSplitter = Splitter_UI.Splitter(text='Twist Module')
        self.twistTabLayout.addWidget(self.twistProSplitter, 0, 0, 1, 3)

        twistProLabel = QtWidgets.QLabel('Twist Name:')
        twistProLabel.setAlignment(QtCore.Qt.AlignCenter)

        self.twistProNameLineEdit = QtWidgets.QLineEdit('')
        self.twistProNameLineEdit.setPlaceholderText('Enter Twist Rig Name')

        self.twistTabLayout.addWidget(twistProLabel, 1, 0, 1, 1)
        self.twistTabLayout.addWidget(self.twistProNameLineEdit, 1, 1, 1, 2)

        # combo splitter
        self.twistCBSplitter = Splitter_UI.Splitter(text='Select & Add')
        self.twistTabLayout.addWidget(self.twistCBSplitter, 2, 0, 1, 3)

        self.twistTypeCB = QtWidgets.QComboBox()

        self.twistTypeCB.clear()

        for twistType in sorted(self.twistTypes.keys()):
            self.twistTypeCB.addItem(twistType)

        self.twistTabLayout.addWidget(self.twistTypeCB, 3, 0, 1, 2)

        self.twistAddBtn = QtWidgets.QPushButton('Add')
        self.twistAddBtn.clicked.connect(self.addTwistWidget)
        self.twistTabLayout.addWidget(self.twistAddBtn, 3, 2, 1, 1)

        # rigScrollWidget
        self.twistScrollWidget = QtWidgets.QWidget()
        self.twistScrollLayout = QtWidgets.QVBoxLayout()
        self.twistScrollLayout.setAlignment(QtCore.Qt.AlignTop | QtCore.Qt.AlignLeft)
        self.twistScrollWidget.setLayout(self.twistScrollLayout)

        self.twistScrollArea = QtWidgets.QScrollArea()
        self.twistScrollArea.setFixedSize(230, 390)
        self.twistScrollArea.setWidgetResizable(True)
        self.twistScrollArea.setWidget(self.twistScrollWidget)
        self.twistScrollArea.setFocusPolicy(QtCore.Qt.NoFocus)
        self.twistScrollArea.setHorizontalScrollBarPolicy(QtCore.Qt.ScrollBarAlwaysOff)

        self.twistTabLayout.addWidget(self.twistScrollArea, 4, 0, 1, 3)

        # utils part
        self.twistUtilsSplitter = Splitter_UI.Splitter(text='Twist Utils')
        self.twistTabLayout.addWidget(self.twistUtilsSplitter, 5, 0, 1, 3)

        # action Widget
        self.twistActionWidget = QtWidgets.QWidget()
        self.twistActionLayout = QtWidgets.QHBoxLayout()

        self.twistActionWidget.setLayout(self.twistActionLayout)

        self.twistTabLayout.addWidget(self.twistActionWidget, 6, 0, 1, 3)

        # save button
        self.twistSaveBtn = QtWidgets.QPushButton('Save Twist')
        self.twistSaveBtn.clicked.connect(self.saveTwist)
        self.twistActionLayout.addWidget(self.twistSaveBtn)

        # import button
        self.twistImportBtn = QtWidgets.QPushButton('Import Twist')
        self.twistImportBtn.clicked.connect(self.importTwist)
        self.twistActionLayout.addWidget(self.twistImportBtn)

        # clear button
        self.twistClearBtn = QtWidgets.QPushButton('Clear Twist')
        self.twistClearBtn.clicked.connect(self.clearTwist)
        self.twistActionLayout.addWidget(self.twistClearBtn)

        # twist action
        self.twistActionSplitter = Splitter_UI.Splitter(text='Twist Action')
        self.twistTabLayout.addWidget(self.twistActionSplitter, 7, 0, 1, 3)

        self.twistWidget = QtWidgets.QWidget()
        self.twistLayout = QtWidgets.QHBoxLayout()

        self.twistWidget.setLayout(self.twistLayout)

        self.twistLayout.setAlignment(QtCore.Qt.AlignCenter)

        self.twistCreateBtn = QtWidgets.QPushButton('Create TWIST')
        self.twistCreateBtn.setFixedWidth(120)
        self.twistCreateBtn.clicked.connect(self.createTwist)
        self.twistLayout.addWidget(self.twistCreateBtn)

        self.twistTabLayout.addWidget(self.twistWidget, 8, 0, 1, 3)

########################################################################################################################
        # Skin Splitter
        self.skinSplitter = Splitter_UI.Splitter(text='Skin Action')
        self.layout().addWidget(self.skinSplitter)

        skinWidget = QtWidgets.QWidget()

        self.layout().addWidget(skinWidget)
        skinLayout = QtWidgets.QHBoxLayout()
        skinWidget.setLayout(skinLayout)

        # export skin weights btn
        skinExportBtn = QtWidgets.QPushButton('Export Skin')
        skinLayout.addWidget(skinExportBtn)
        skinExportBtn.clicked.connect(skinLib.SkinCluster.export)

        # import skin weights btn
        skinImportBtn = QtWidgets.QPushButton('Import Skin')
        skinLayout.addWidget(skinImportBtn)
        skinImportBtn.clicked.connect(skinLib.SkinCluster.createAndImport)

    def clearRig(self):
        for rig in self.rigScrollWidget.findChildren(rigWidget):
            rig.deleteRigPart()

    def createRig(self):
        """
        Use the info to create the Rig
        :return:
        """
        if not self.rigProNameLineEdit.text():
            logger.error('No rig name found , please input a rig name!')
            return None
        # Before create the rig, save the rig first!
        self.saveRig()

        project = module.Base(characterName=self.rigProNameLineEdit.text())
        # Spine parts
        for rig in self.rigScrollWidget.findChildren(rigWidget):
            if rig.typeName == 'IK_FK_Spine' and not rig.rigArgs['mainSpineAttach']:
                self.mainSpine = IK_FK_Spine.build(spineJoints=eval(rig.rigArgs['spineJoints']),
                                                   prefix=rig.rigArgs['prefix'],
                                                   rigScale=eval(rig.rigArgs['rigScale']),
                                                   numFK_Jnt=eval(rig.rigArgs['numFK_Jnt']),
                                                   spineBackUpAxis=rig.rigArgs['spineBackUpAxis'],
                                                   baseRig=project)
                logger.debug('%s IK_FK_MainSpine finished!' % rig.partLineEdit.text())
                continue
            elif rig.typeName == 'IK_FK_Spine' and rig.rigArgs['mainSpineAttach']:
                self.attachSpine = IK_FK_Spine.build(spineJoints=eval(rig.rigArgs['spineJoints']),
                                                     prefix=rig.rigArgs['prefix'],
                                                     rigScale=eval(rig.rigArgs['rigScale']),
                                                     numFK_Jnt=eval(rig.rigArgs['numFK_Jnt']),
                                                     spineBackUpAxis=rig.rigArgs['spineBackUpAxis'],
                                                     mainSpineAttach=rig.rigArgs['mainSpineAttach'],
                                                     baseRig=project)
                logger.debug('%s IK_FK_AttachSpine finished!' % rig.partLineEdit.text())
                continue
            else:
                logger.debug("Can't find Spine part, please check your joints.")
                continue

        # Other parts
        if self.mainSpine or self.attachSpine:
            for rig in self.rigScrollWidget.findChildren(rigWidget):
                if rig.typeName == 'IK_FK_Arm' and rig.rigArgs:
                    IK_FK_HumanArm.build(armJoints=eval(rig.rigArgs['armJoints']),
                                         prefix=rig.rigArgs['prefix'],
                                         rigScale=eval(rig.rigArgs['rigScale']),
                                         FK_Parent=rig.rigArgs['FK_Parent'],
                                         switchCtrlPos=rig.rigArgs['switchCtrlPos'],
                                         baseRig=project)
                    logger.info('%s IK_FK_Arm build complete!' % rig.partLineEdit.text())
                    continue

                elif rig.typeName == 'IK_AnimalLeg' and rig.rigArgs:
                    IK_AnimalLeg.build(legJoints=eval(rig.rigArgs['legJoints']),
                                       revJntlocList=eval(rig.rigArgs['revJntlocList']),
                                       ankleRollLoc=rig.rigArgs['ankleRollLoc'],
                                       prefix=rig.rigArgs['prefix'],
                                       rigScale=eval(rig.rigArgs['rigScale']),
                                       baseRig=project)
                    logger.info('%s IK_AnimalLeg build complete!' % rig.partLineEdit.text())
                    continue
                elif rig.typeName == 'IK_FK_Head_Neck' and rig.rigArgs:
                    IK_FK_Head_Neck.build(neckJoints=eval(rig.rigArgs['neckJoints']),
                                          rigScale=eval(rig.rigArgs['rigScale']),
                                          prefix=rig.rigArgs['prefix'],
                                          blendCtrl_Pos=rig.rigArgs['blendCtrl_Pos'],
                                          baseRig=project)
                    logger.info('%s IK_FK_Head_Neck build complete!' % rig.partLineEdit.text())
                    continue
                elif rig.typeName == 'FK_Tail' and rig.rigArgs:
                    FK_Tail.build(tailJoints=eval(rig.rigArgs['tailJoints']),
                                  FK_Parent=rig.rigArgs['FK_Parent'],
                                  rigScale=1.0,
                                  prefix=rig.rigArgs['prefix'],
                                  baseRig=project)
                    logger.info('%s FK_Tail build complete!' % rig.partLineEdit.text())
                    continue
                else:
                    logger.debug("Can't find the specified part, please check your rig type.")
        else:
            for rig in self.rigScrollWidget.findChildren(rigWidget):
                if rig.typeName == 'IK_FK_Arm' and rig.rigArgs:
                    IK_FK_HumanArm.build(armJoints=eval(rig.rigArgs['armJoints']),
                                         prefix=rig.rigArgs['prefix'],
                                         rigScale=eval(rig.rigArgs['rigScale']),
                                         switchCtrlPos=rig.rigArgs['switchCtrlPos'],
                                         baseRig=project)
                    logger.info('%s IK_FK_Arm build complete!' % rig.partLineEdit.text())
                    continue

                elif rig.typeName == 'IK_AnimalLeg' and rig.rigArgs:
                    IK_AnimalLeg.build(legJoints=eval(rig.rigArgs['legJoints']),
                                       revJntlocList=eval(rig.rigArgs['revJntlocList']),
                                       ankleRollLoc=rig.rigArgs['ankleRollLoc'],
                                       spineJnt=rig.rigArgs['spineJnt'],
                                       prefix=rig.rigArgs['prefix'],
                                       rigScale=eval(rig.rigArgs['rigScale']),
                                       baseRig=project)
                    logger.info('%s IK_Leg build complete!' % rig.partLineEdit.text())
                    continue
                elif rig.typeName == 'IK_FK_Head_Neck' and rig.rigArgs:
                    IK_FK_Head_Neck.build(neckJoints=eval(rig.rigArgs['neckJoints']),
                                          Neck_Parent=rig.rigArgs['Neck_Parent'],
                                          rigScale=eval(rig.rigArgs['rigScale']),
                                          prefix=rig.rigArgs['prefix'],
                                          blendCtrl_Pos=rig.rigArgs['blendCtrl_Pos'],
                                          baseRig=project)
                    logger.info('%s IK_FK_Head_Neck build complete!' % rig.partLineEdit.text())
                    continue
                elif rig.typeName == 'FK_Tail' and rig.rigArgs:
                    FK_Tail.build(tailJoints=eval(rig.rigArgs['tailJoints']),
                                  rigScale=1.0,
                                  prefix=rig.rigArgs['prefix'],
                                  baseRig=project)
                    logger.info('%s FK_Tail build complete!' % rig.partLineEdit.text())
                    continue
                else:
                    logger.debug("Can't find the specified part, please check your rig type.")

        logger.info("Create rig complete!")

    def importRig(self):
        """
        Get the rigLog file from the specified directory and set the rig
        :return: None
        """
        directory = self.getDirectory(type='rig')
        # fileName = ['','']
        fileName = QtWidgets.QFileDialog.getOpenFileName(self, 'Rig File Browser', directory)

        if not fileName[0]:
            logger.info('You have selected a null file, please check and select again.')
            return
        else:
            with open(fileName[0], 'r') as f:
                properties = json.load(f)

                # check the properties is None or not
                if not properties:
                    raise RuntimeError('Procedural Rig Name not found, please check the rig file')
                else:
                    # Set the rig project name first
                    self.rigProNameLineEdit.setText(str(properties['Procedural Rig Name']))
                    # Delete the key and info to get the other info in a for loop
                    del properties['Procedural Rig Name']

                # Set the info
                for key in properties.keys():
                    self.addRigWidget(properties[key]['rigType'])
                    self.widget.rigArgs = properties[key]['rigArgs']
                    self.widget.partLineEdit.setText(str(key))
                    # Be sure to set the rigPartName of each widget
                    self.widget.setRigPartName()

            logger.info('Import %s rig log file.' % fileName[0])

    def saveRig(self):
        """
        Save the rig info to a .json file at the specified directory
        :return: None
        """
        properties = {}
        properties['Procedural Rig Name'] = self.rigProNameLineEdit.text()

        for rig in self.rigScrollWidget.findChildren(rigWidget):
            if str(rig.partLineEdit.text()) in properties.keys():
                # raise RuntimeError("Rig file save failed, you have already same name rig part name!")
                logger.debug("Rig file save failed, you have already same name rig part!!!")
                break
            properties[str(rig.partLineEdit.text())] = {}
            properties[str(rig.partLineEdit.text())]['rigType'] = rig.typeName
            properties[str(rig.partLineEdit.text())]['rigArgs'] = rig.rigArgs

        if len(properties.keys()) == len(self.rigScrollWidget.findChildren(rigWidget)) + 1:

            rigLogDir = self.getDirectory(type='rig')
            rigLogFile = os.path.join(rigLogDir,
                                      self.rigProNameLineEdit.text() + '_rigLogFile_%s.json' % time.strftime('%m%d_%H_%M'))
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

        self.rigScrollLayout.addWidget(self.widget)

        logger.info('Add a %s Rig Part' % rigType)

    def addTwistWidget(self, twistType=None):
        """
        Add Twist widget to the scroll Layout with specified twistType
        :param twistType: twistType of the rig widget
        :return: None
        """
        if not twistType:
            twistType = self.twistTypeCB.currentText()

        self.widget = rigWidget(twistType)
        self.twistScrollLayout.addWidget(self.widget)

        logger.info('Add a %s Twist Part' % twistType)

    def getDirectory(self, type):
        """
        set and get the rig Log directory
        :return: rig log directory
        """
        if type == 'rig':
            fileName = 'rigLogFiles'
        elif type == 'twist':
            fileName = 'twistLogFiles'
        else:
            logger.info('Unknow directory type name, please check again!')
            return

        logDir = os.path.join(pm.internalVar(userAppDir=1), fileName)
        if not os.path.exists(logDir):
            os.mkdir(logDir)
        return logDir

    def clearTwist(self):
        for rig in self.twistScrollWidget.findChildren(rigWidget):
            rig.deleteRigPart()

    def saveTwist(self):
        """
        Save the twist info to a .json file at the specified directory
        :return: None
        """
        properties = {}
        properties['Twist Name'] = self.twistProNameLineEdit.text()

        for twist in self.twistScrollWidget.findChildren(rigWidget):
            if str(twist.partLineEdit.text()) in properties.keys():
                logger.debug('Twist file save failed, you have already same name twist part!!!')
                break
            properties[str(twist.partLineEdit.text())] = {}
            properties[str(twist.partLineEdit.text())]['twistType'] = twist.typeName
            properties[str(twist.partLineEdit.text())]['twistArgs'] = twist.rigArgs

        if len(properties.keys()) == len(self.twistScrollWidget.findChildren(rigWidget)) + 1:
            twistLogDir = self.getDirectory(type='twist')
            twistLogFile = os.path.join(twistLogDir,
                                        self.twistProNameLineEdit.text() + '_twistLogFile_%s.json' % time.strftime('%m%d_%H_%M'))

            with open(twistLogFile, 'w') as f:
                json.dump(properties, f, indent=4)

            logger.info('Savng twist file to %s' % twistLogFile)

    def importTwist(self):
        """
        Get the twistLog file from the specified directory and set the twist
        :return: None
        """
        directory = self.getDirectory(type='twist')
        fileName = QtWidgets.QFileDialog.getOpenFileName(self, 'Twist File Browser', directory)

        if not fileName[0]:
            logger.info('You have selected a null file, please check and select again.')
            return

        else:
            with open(fileName[0], 'r') as f:
                properties = json.load(f)

                # check the properties is None or not
                if not properties:
                    raise RuntimeError('Twist Name not found, please check the twist file')
                else:
                    self.twistProNameLineEdit.setText(str(properties['Twist Name']))
                    del properties['Twist Name']

                for key in properties.keys():
                    self.addTwistWidget(properties[key]['twistType'])
                    self.widget.rigArgs = properties[key]['twistArgs']
                    self.widget.partLineEdit.setText(str(key))

            logger.info('Import %s twist log file.' % fileName[0])

    def createTwist(self):
        """
        Use the info to create the twist
        :return:
        """
        if not self.twistProNameLineEdit.text():
            logger.error('No rig name found , please input a rig name!')
            return None
        # Before create the rig, save the rig first!
        self.saveTwist()

        for twist in self.twistScrollWidget.findChildren(rigWidget):
            if twist.typeName in self.twistTypes.keys() and twist.rigArgs:
                Blend_RollChain.build(rollStart=twist.rigArgs['rollStart'],
                                      rollEnd=twist.rigArgs['rollEnd'],
                                      numRollJoints=eval(twist.rigArgs['numRollJoints']),
                                      rollWithSameDir=eval(twist.rigArgs['rollWithSameDir']))
                logger.info('%s Blend_RollChain build complete!' % twist.partLineEdit.text())
                continue
            else:
                logger.info("Can't find the specified part, please check your rig type.")


class rigWidget(QtWidgets.QFrame):

    types = {'IK_AnimalLeg': rigLib.rig.IK_AnimalLeg.build,
             'IK_FK_Arm': rigLib.rig.IK_FK_HumanArm.build,
             'IK_FK_Spine': rigLib.rig.IK_FK_Spine.build,
             'IK_FK_Head_Neck': rigLib.rig.IK_FK_Head_Neck.build,
             'FK_Tail': rigLib.rig.FK_Tail.build,
             'Blend_RollChain': rigLib.rig.Blend_RollChain.build}

    def __init__(self, rigTypeName):
        super(rigWidget, self).__init__()

        self.setFrameStyle(QtWidgets.QFrame.Panel)
        self.setFrameShadow(QtWidgets.QFrame.Raised)

        self.setFixedSize(200, 100)

        self.rigArgs = {}

        self.typeName = rigTypeName

        # self.rigPartName = None
        self.partLineEdit = None
        self.editBtn = None
        self.buildUI()

    def buildUI(self):
        """
        build the Rig UI
        :return: None
        """
        editWidgetLayout = QtWidgets.QVBoxLayout()
        self.setLayout(editWidgetLayout)

        editWidgetLayout.setSpacing(2)

        self.closeBtnLayout = QtWidgets.QHBoxLayout()
        self.editLineLayout = QtWidgets.QHBoxLayout()
        self.editBtnLayout = QtWidgets.QHBoxLayout()

        editWidgetLayout.addLayout(self.closeBtnLayout)
        editWidgetLayout.addLayout(self.editLineLayout)
        editWidgetLayout.addLayout(self.editBtnLayout)

        closeBtn = QtWidgets.QPushButton('X')
        closeBtn.clicked.connect(self.deleteRigPart)
        closeBtn.setFixedWidth(25)

        font = QtGui.QFont()
        font.setPointSize(10)
        font.setBold(1)
        self.TypeLabel = QtWidgets.QLabel('Type: %s' % self.typeName)
        self.TypeLabel.setFont(font)

        self.closeBtnLayout.addWidget(self.TypeLabel)
        self.closeBtnLayout.addWidget(closeBtn)

        label = QtWidgets.QLabel('Part Name:  ')
        self.partLineEdit = QtWidgets.QLineEdit()
        self.partLineEdit.setPlaceholderText('Enter a name')

        self.editLineLayout.addWidget(label)
        self.editLineLayout.addWidget(self.partLineEdit)

        self.editBtn = QtWidgets.QPushButton('Edit...')
        self.editBtn.setFixedWidth(80)

        self.editBtn.clicked.connect(self.editPart)
        self.editBtnLayout.addWidget(self.editBtn)

    def deleteRigPart(self):
        """
        delete the rig part
        :return: None
        """
        self.setParent(None)
        self.setVisible(False)
        self.deleteLater()

    def editPart(self):
        """
        Set the rig part info
        :return: None
        """
        if self.typeName in self.types.keys():
            Edit_UI.EditWidget(self, self.typeName, self.types[self.typeName])
        else:
            logger.debug('Unknown rig type...')

        logger.info('Edit %s Rig Part...' % self.typeName)

    def setRigPartName(self):
        """
        Set the rig part name of the widget
        :return: None
        """
        # self.rigPartName = self.rigPartLineEdit.text()
        pass
