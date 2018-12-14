import maya.cmds as cmds
from PySide2 import QtCore, QtGui, QtWidgets
import maya.OpenMayaUI as omui
from shiboken2 import wrapInstance
import logging

logging.basicConfig()
logger = logging.getLogger('PoseLibrary')
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
            cmds.deleteUI('PoseLibrary')
        except:
            logger.info('No previous UI exists!')

        super(MainUI, self).__init__(parent=getMayaMainWindow())

        self.setModal(False)

        self.setObjectName('PoseLibrary')
        self.setWindowTitle('Pose Library')

        self.iconSize = 100
        self.buffer = 15


        self.buildUI()
        self.show()

    def buildUI(self):
        self.setFixedSize(800, 500)

        self.mainLayout = QtWidgets.QHBoxLayout()
        self.setLayout(self.mainLayout)

        ############
        # file Dir #
        ############
        self.fileDir = QtWidgets.QTreeWidget()
        self.fileDir.setFixedSize(180, 480)
        """
        self.poseLib = QtWidgets.QScrollArea()
        self.poseLib.setFixedSize(400, 480)
        self.poseLib.setWidgetResizable(True)
        self.poseLib.setFocusPolicy(QtCore.Qt.NoFocus)
        self.poseLib.setHorizontalScrollBarPolicy(QtCore.Qt.ScrollBarAlwaysOff)
        """

        ############
        # Pose Lib #
        ############
        self.poseLib = QtWidgets.QListWidget()
        self.poseLib.setViewMode(QtWidgets.QListWidget.IconMode)
        self.poseLib.setIconSize(QtCore.QSize(self.iconSize, self.iconSize))
        self.poseLib.setResizeMode(QtWidgets.QListWidget.Adjust)
        self.poseLib.setGridSize(QtCore.QSize(self.iconSize + self.buffer, self.iconSize + self.buffer))
        self.poseLib.setFocusPolicy(QtCore.Qt.NoFocus)
        self.poseLib.setHorizontalScrollBarPolicy(QtCore.Qt.ScrollBarAlwaysOff)

        ##############
        # Pose Group #
        ##############
        self.poseGroup = QtWidgets.QGroupBox()
        self.poseGroup.setFixedSize(170, 480)
        self.poseGroupLayout = QtWidgets.QVBoxLayout()
        self.poseGroup.setLayout(self.poseGroupLayout)

        self.snapButton = QtWidgets.QPushButton('Shot')
        self.snapButton.setFixedSize(QtCore.QSize(150, 150))
        self.poseGroupLayout.addWidget(self.snapButton)

        self.nameLayout = QtWidgets.QHBoxLayout()
        self.nameLayout.setAlignment(QtCore.Qt.AlignTop)
        self.poseGroupLayout.addLayout(self.nameLayout)
        self.nameLabel = QtWidgets.QLabel('Name: ')
        self.nameLayout.addWidget(self.nameLabel)
        self.nameEditLine = QtWidgets.QLineEdit()
        self.nameEditLine.setPlaceholderText('Enter a Pose Name')
        self.nameLayout.addWidget(self.nameEditLine)

        self.historyEditLine = QtWidgets.QLineEdit()
        self.historyEditLine.setFixedHeight(50)
        self.historyEditLine.isReadOnly(True)
        self.poseGroupLayout.addWidget(self.historyEditLine)

        self.sliderLayout = QtWidgets.QHBoxLayout()
        self.poseBlendSlider = QtWidgets.QSlider()
        self.blendValueButton = QtWidgets.QPushButton('0')
        self.sliderLayout.addWidget(self.poseBlendSlider)
        self.sliderLayout.addWidget(self.blendValueButton)
        self.poseGroupLayout.addLayout(self.sliderLayout)

        self.saveButton = QtWidgets.QPushButton('Save')
        self.saveButton.setFixedHeight(100, 45)
        self.poseGroupLayout.addWidget(self.saveButton)

        self.mainLayout.addWidget(self.fileDir)
        self.mainLayout.addWidget(self.poseLib)
        self.mainLayout.addWidget(self.poseGroup)

