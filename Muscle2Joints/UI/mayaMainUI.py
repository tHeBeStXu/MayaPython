from PySide2 import QtCore, QtWidgets, QtGui
from functools import partial
from shiboken2 import wrapInstance
import maya.OpenMayaUI as omui
import maya.cmds as cmds
import logging
import os

from ..lib import mayaLib
reload(mayaLib)

logging.basicConfig()
logger = logging.getLogger('SSDS')
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
        Initialize and show the main window
        """
        try:
            cmds.deleteUI('SSDS')
        except:
            logger.info('No previous UI exists!')

        super(MainUI, self).__init__(parent=getMayaWindow())

        # Directories
        self.currentDir = os.path.abspath(os.path.dirname(__file__))
        self.rootDir = os.path.abspath(os.path.join(self.currentDir, os.path.pardir))
        self.rootDir = self.rootDir.replace('\\', '/')

        self.dataDir = '%s/Data' % self.rootDir
        self.tempDir = os.path.abspath(os.getenv('TEMP'))
        self.tempDir = self.tempDir.replace('\\', '/')

        self.setModal(False)
        self.setObjectName('SSDS')
        self.setWindowTitle('Muscle2Joints Converter')

        self.transformLimits = dict()

        self.buildUI()
        self.show()

    def buildUI(self):
        """
        Build the main UI
        :return: None
        """
        self.setFixedSize(380, 320)

        self.mainLayout = QtWidgets.QVBoxLayout()
        self.setLayout(self.mainLayout)

        self.mainWidget = QtWidgets.QTabWidget()
        self.mainLayout.addWidget(self.mainWidget)

        self.exportWidget = QtWidgets.QWidget()
        self.importWidget = QtWidgets.QWidget()

        self.exportTabLayout = QtWidgets.QHBoxLayout()
        self.importTabLayout = QtWidgets.QHBoxLayout()

        self.exportWidget.setLayout(self.exportTabLayout)
        self.importWidget.setLayout(self.importTabLayout)

        # add widget to TabWidget
        self.mainWidget.addTab(self.exportWidget, 'Export')
        self.mainWidget.addTab(self.importWidget, 'Import')

        #######################
        # build Export Widget #
        #######################

        attrWidget = QtWidgets.QWidget()
        attrLayout = QtWidgets.QFormLayout()
        attrWidget.setLayout(attrLayout)

        # Skin Mesh
        skinMeshLayout = QtWidgets.QHBoxLayout()
        skinMeshLabel = QtWidgets.QLabel('Skin Mesh:      ')
        self.skinMeshLineEdit = QtWidgets.QLineEdit()
        self.skinMeshBtn = QtWidgets.QPushButton('<<<')
        self.skinMeshBtn.setFixedWidth(60)

        skinMeshLayout.addWidget(skinMeshLabel)
        skinMeshLayout.addWidget(self.skinMeshLineEdit)
        skinMeshLayout.addWidget(self.skinMeshBtn)

        self.skinMeshBtn.clicked.connect(partial(self.setEditLine, self.skinMeshLineEdit))

        # Primary Joints
        primaryJntsLayout = QtWidgets.QHBoxLayout()
        primaryJntsLabel = QtWidgets.QLabel('Primary Joints:')
        self.primaryJntsLineEdit = QtWidgets.QLineEdit()
        self.primaryJntsBtn = QtWidgets.QPushButton('<<<')
        self.primaryJntsBtn.setFixedWidth(60)

        primaryJntsLayout.addWidget(primaryJntsLabel)
        primaryJntsLayout.addWidget(self.primaryJntsLineEdit)
        primaryJntsLayout.addWidget(self.primaryJntsBtn)

        self.primaryJntsBtn.clicked.connect(partial(self.setEditLine, self.primaryJntsLineEdit))

        # Default Angle Range
        defaultAngleLayout = QtWidgets.QHBoxLayout()
        defaultAngleLabel = QtWidgets.QLabel('Default Angle:')
        self.defaultAngleSpinBox = QtWidgets.QDoubleSpinBox()
        self.defaultAngleSpinBox.setValue(30)
        self.defaultAngleSpinBox.setSingleStep(5)
        self.defaultAngleSpinBox.setRange(0, 60)

        defaultAngleLayout.addWidget(defaultAngleLabel)
        defaultAngleLayout.addWidget(self.defaultAngleSpinBox)

        # Iter Angle
        iterAngleLayout = QtWidgets.QHBoxLayout()
        iterAngleLabel = QtWidgets.QLabel('Iter Angle: ')
        self.iterAngleSpinBox = QtWidgets.QDoubleSpinBox()
        self.iterAngleSpinBox.setValue(20)
        self.iterAngleSpinBox.setSingleStep(10)
        self.iterAngleSpinBox.setRange(10, 60)

        iterAngleLayout.addWidget(iterAngleLabel)
        iterAngleLayout.addWidget(self.iterAngleSpinBox)

        # Generate ROMs & Export Data
        buttonsLayout = QtWidgets.QHBoxLayout()
        self.ROMsBtn = QtWidgets.QPushButton('Generate ROMs')
        self.exportBtn = QtWidgets.QPushButton('Export Data')

        self.ROMsBtn.clicked.connect(partial(self.generateROMs, self.primaryJntsLineEdit, self.defaultAngleSpinBox,
                                             self.iterAngleSpinBox))
        self.exportBtn.clicked.connect(partial(self.exportData, self.skinMeshLineEdit, self.primaryJntsLineEdit))

        buttonsLayout.addWidget(self.ROMsBtn)
        buttonsLayout.addWidget(self.exportBtn)

        # ProgressBar
        progressLayout = QtWidgets.QHBoxLayout()
        self.progressBar = QtWidgets.QProgressBar()

        progressLayout.addWidget(self.progressBar)

        self.progressBar.setValue(0)

        # Splitters
        meshJointsSplitter = Splitter(text='Skin Mesh & Primary Joints')
        angleSplitter = Splitter(text='Default Angle & Iter Angle')
        buildSplitter = Splitter(text='Generate ROMs & Export Data')

        # Add All To Export Widget
        attrLayout.addRow(meshJointsSplitter)
        attrLayout.addRow(skinMeshLayout)
        attrLayout.addRow(primaryJntsLayout)

        attrLayout.addRow(angleSplitter)
        attrLayout.addRow(defaultAngleLayout)
        attrLayout.addRow(iterAngleLayout)

        attrLayout.addRow(buildSplitter)
        attrLayout.addRow(buttonsLayout)

        attrLayout.addRow(Splitter())
        attrLayout.addRow(progressLayout)

        self.exportTabLayout.addWidget(attrWidget)

    def setEditLine(self, editLine):
        """
        Set specified edit line for parameter
        :param editLine: QLineEdit(), editLine
        :return: None
        """
        selection = cmds.ls(sl=1)

        itemStr = []
        for i in selection:
            itemStr.append(i)

        if itemStr:
            if len(itemStr) < 2:
                editLine.setText(itemStr[0])
            else:
                editLine.setText(str(itemStr))

    def generateROMs(self, primaryJntsSel, defaultAngle, iterAngle):
        """

        :param primaryJntsSel: QLineEdit(), primary joints in correct order
        :param defaultAngle: QDoubleSpinBox(), half default angle range
        :param iterAngle: QDoubleSpinBox(), iter angle
        :return: None
        """
        primaryJnts = primaryJntsSel.text()
        defaultAngle = defaultAngle.value()
        iterAngle = iterAngle.value()

        if primaryJnts and defaultAngle:
            self.transformLimits = mayaLib.getTransformLimits(primaryJoints=eval(primaryJnts),
                                                              defaultAngle=defaultAngle)
            logger.info('Getting the %s transform limits successfully!!!' % primaryJnts)
        else:
            logger.info('You need to select the primary joints!')

        if self.transformLimits and iterAngle:
            mayaLib.uniformSampling(transformLimits=self.transformLimits,
                                    jointsOrder=eval(primaryJnts),
                                    iterAngle=iterAngle,
                                    progressBar=self.progressBar)
            logger.info('Uniform sampling successfully!!!')
        else:
            logger.info('Failed to uniform sampling, please check your input attributes!')

    def exportData(self, skinMesh, primaryJntsSel):
        """
        Export Data for further calculating
        :param skinMesh: QLineEdit(), transform node of skin mesh
        :param primaryJntsSel: QLineEdit(), primary joints in correct order
        :return: None
        """
        primaryJntsSel = primaryJntsSel.text()
        skinMesh = skinMesh.text()

        if primaryJntsSel and skinMesh:
            filePath = mayaLib.exportData(mesh=skinMesh,
                                          dataDir=self.dataDir,
                                          primaryJoints=eval(primaryJntsSel))
            logger.info('Export data successfully!!!\nFile: %s' % filePath)
        else:
            logger.info('Failed to export data, please check your input attributes!')


class Splitter(QtWidgets.QWidget):
    def __init__(self, text=None):
        """
        Splitter class for create splitter widget
        :param text: text between splitter lines
        """
        super(Splitter, self).__init__()

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
