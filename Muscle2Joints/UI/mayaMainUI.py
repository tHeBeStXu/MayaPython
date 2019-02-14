from PySide2 import QtCore, QtWidgets, QtGui
from functools import partial
from shiboken2 import wrapInstance
import maya.OpenMayaUI as omui
import maya.cmds as cmds
import logging

from ..lib import mayaLib

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

        self.setModal(False)
        self.setObjectName('SSDS')
        self.setWindowTitle('SSDS Exporter & Importer')

        self.transformLimits = dict()

        self.buildUI()
        self.show()

    def buildUI(self):
        """
        Build the main UI
        :return: None
        """
        self.setFixedSize(380, 280)

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

        self.exportTabLayout.addWidget(attrWidget)

    def setEditLine(self, editLine):
        """
        Set specified edit line for parameter
        :param editLine: dict, editLine
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
        primaryJnts = primaryJntsSel.text()
        defaultAngle = defaultAngle.value()
        iterAngle = iterAngle.Value()

        print primaryJnts
        print defaultAngle
        print iterAngle

        # self.transformLimits = mayaLib.getTransformLimits()

    def exportData(self, skinMesh, primaryJntsSel):

        primaryJntsSel = primaryJntsSel.text()
        skinMesh = skinMesh.text()

        print 'Export Data'

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