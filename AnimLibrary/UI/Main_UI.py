import maya.cmds as cmds
from PySide2 import QtCore, QtGui, QtWidgets
import maya.OpenMayaUI as omui
from shiboken2 import wrapInstance
import logging
import os
from functools import partial
import shutil

logging.basicConfig()
logger = logging.getLogger('AnimLibrary')
logger.setLevel(logging.INFO)


def getMayaMainWindow():
    """
    get the mayaMainWindow as parent
    :return: mayaMainWindow Ptr
    """
    ptr = omui.MQtUtil.mainWindow()
    return wrapInstance(long(ptr), QtWidgets.QMainWindow)


class MainUI(QtWidgets.QDialog):
    def __init__(self):
        try:
            cmds.deleteUI('AnimLibrary')
        except:
            logger.info('No previous UI exists!')

        super(MainUI, self).__init__(parent=getMayaMainWindow())

        self.setModal(False)

        self.setObjectName('AnimLibrary')
        self.setWindowTitle('Animation Library')

        ####################
        # Global Variables #
        ####################

        # Directories
        self.currentDir = os.path.abspath(os.path.dirname(__file__))
        self.rootDir = os.path.abspath(os.path.join(self.currentDir, os.path.pardir))
        self.rootDir = self.rootDir.replace('\\', '/')

        self.iconsDir = '%s/Icons' % self.rootDir
        self.dataDir = '%s/Data' % self.rootDir
        self.tempDir = os.path.abspath(os.getenv('TEMP'))
        self.tempDir = self.tempDir.replace('\\', '/')
        self.imagesDir = '%s/tempImages' % self.tempDir

        # Current Mode
        self.currentMode = 'export'

        # Current Pose Name
        self.currentPoseData = ''

        # Build UI
        self.buildUI()

        # Adjust UI
        self.uiConfigure()

        # Adjust Icons
        self.iconConfigure()

        # Load file structure
        self.loadFolderStructure(self.dataDir)

        self.show()

    def buildUI(self):
        self.setFixedSize(830, 500)

        self.mainLayout = QtWidgets.QHBoxLayout()
        self.setLayout(self.mainLayout)

        ############
        # File Dir #
        ############

        self.fileDir = QtWidgets.QTreeWidget()
        self.fileDir.setFixedSize(180, 480)

        ####################
        # Anim Scroll Area #
        ####################
        self.animWidget = QtWidgets.QWidget()
        self.animWidgetLayout = QtWidgets.QGridLayout()
        self.animWidgetLayout.setAlignment(QtCore.Qt.AlignCenter)
        self.animWidget.setLayout(self.animWidgetLayout)

        self.animLib = QtWidgets.QScrollArea()
        self.animLib.setFixedSize(400, 480)
        self.animLib.setWidget(self.animWidget)
        self.animLib.setWidgetResizable(1)
        self.animLib.setFocusPolicy(QtCore.Qt.NoFocus)
        self.animLib.setHorizontalScrollBarPolicy(QtCore.Qt.ScrollBarAlwaysOff)

        ##############
        # Anim Group #
        ##############
        self.animGroup = QtWidgets.QGroupBox()
        self.animGroup.setContentsMargins(0, 0, 0, 0)
        self.animGroup.setFixedSize(200, 480)
        self.animGroupLayout = QtWidgets.QVBoxLayout()
        self.animGroupLayout.setAlignment(QtCore.Qt.AlignTop | QtCore.Qt.AlignVCenter)
        self.animGroup.setLayout(self.animGroupLayout)

        self.recordGroup = QtWidgets.QGroupBox()
        recordLayout = QtWidgets.QHBoxLayout()
        recordLayout.setAlignment(QtCore.Qt.AlignCenter)
        self.recordGroup.setLayout(recordLayout)
        self.recordBtn = QtWidgets.QPushButton()
        self.recordBtn.setFixedSize(150, 150)

        recordLayout.addWidget(self.recordBtn)
        self.animGroupLayout.addWidget(self.recordGroup)

        ####################
        # Name Label Group #
        ####################

        self.nameLabelGroup = QtWidgets.QGroupBox()
        nameLayout = QtWidgets.QHBoxLayout()
        nameLayout.setAlignment(QtCore.Qt.AlignCenter)
        self.nameLabelGroup.setLayout(nameLayout)
        self.animGroupLayout.addWidget(self.nameLabelGroup)

        self.namelabel = QtWidgets.QLabel()




    def uiConfigure(self):
        pass

    def iconConfigure(self):
        pass

    def loadFolderStructure(self, path):
        pass


class gifButton(QtWidgets.QPushButton):
    def __init__(self, parent=None):
        QtWidgets.QPushButton.__init__(self, parent)

        self.label = QtWidgets.QLabel()



