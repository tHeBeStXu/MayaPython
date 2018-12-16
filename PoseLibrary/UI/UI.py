import maya.cmds as cmds
from PySide2 import QtCore, QtGui, QtWidgets
import maya.OpenMayaUI as omui
from shiboken2 import wrapInstance
import logging
import os

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

        self.currentDirectory = os.path.abspath(os.path.dirname(__file__))
        self.rootDirectory = os.path.abspath(os.path.join(self.currentDirectory, os.path.pardir))

        self.iconsDirectory = '%s\Icons' % self.rootDirectory
        self.iconsDirectory = self.iconsDirectory.replace('\\', '/')
        self.dataDirectory = '%s\Data' % self.rootDirectory
        self.dataDirectory = self.dataDirectory.replace('\\', '/')

        self.buildUI()

        self.loadFolderStructure(self.dataDirectory)

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

        # folder menu
        self.folderMenu = QtWidgets.QMenu(self)
        # Action
        self.folderAction = QtWidgets.QAction('Create Folder', self.fileDir)
        self.folderAction.triggered.connect(self.createFolder)

        self.folderMenu.addAction(self.folderAction)

        # custom context menu
        self.fileDir.setContextMenuPolicy(QtCore.Qt.CustomContextMenu)
        self.fileDir.customContextMenuRequested.connect(self.onFolderContextMenu)

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
        self.historyEditLine.isReadOnly()
        self.poseGroupLayout.addWidget(self.historyEditLine)

        self.sliderLayout = QtWidgets.QHBoxLayout()
        self.poseBlendSlider = QtWidgets.QSlider(QtCore.Qt.Horizontal)
        self.blendValueButton = QtWidgets.QPushButton('0')
        self.sliderLayout.addWidget(self.poseBlendSlider)
        self.sliderLayout.addWidget(self.blendValueButton)
        self.poseGroupLayout.addLayout(self.sliderLayout)

        self.saveButton = QtWidgets.QPushButton('Save')
        self.saveButton.setFixedSize(100, 45)
        self.poseGroupLayout.addWidget(self.saveButton)

        self.mainLayout.addWidget(self.fileDir)
        self.mainLayout.addWidget(self.poseLib)
        self.mainLayout.addWidget(self.poseGroup)

    def onFolderContextMenu(self, paint):

        self.folderMenu.exec_(self.fileDir.mapToGlobal(paint))

    def createFolder(self):
        """
        create folder dialog on treeWidget
        :return: None
        """
        folderName, ok = QtWidgets.QInputDialog.getText(self, 'Folder Name', 'Enter the folder name :',
                                                        QtWidgets.QLineEdit.Normal)

        if ok:
            os.makedirs('%s/%s' % (self.dataDirectory, folderName))

    def getFolderStructure(self, path):
        """
        get folder structure with specified path
        :param path: rootPath
        :return: dict, directory list
        """
        directoryList = {}
        for root, dirs, files in os.walk(path):
            folderList = root.split(os.sep)

            folders = directoryList

            for eachFolder in folderList:
                folders = folders.setdefault(eachFolder, {})
        return directoryList

    def loadFolder2TreeWidget(self, directoryList, parent, path):
        """
        load folder structure to treeWidget
        :param directoryList: dict, directory list
        :param parent: QtreeWidget, self.fileDir
        :param path: file path
        :return: None
        """
        for eachDirectory in directoryList:

            self.folderPath = '%s/%s' % (path, eachDirectory)

            item = QtWidgets.QTreeWidgetItem(parent)

            item.setText(0, eachDirectory)

            item.setToolTip(0,  self.folderPath)

            item.toolTip(QtCore.Qt.WA_AlwaysShowToolTips)

            # connect icon
            icon = QtGui.QIcon()
            # icon.addPixmap(QtGui.QPixmap('%s/folder.png' % (self.iconsDirectory)), QtGui.QIcon.Normal, QtGui.QIcon.Off)
            # item.setIcon(0, icon)

            self.loadFolder2TreeWidget(directoryList[eachDirectory], item, self.folderPath)

        self.folderPath = path

    def loadFolderStructure(self, path):
        """
        load folder structure of given path
        :param path: str, self.libraryDirectory
        :return: None
        """
        directoryList = self.getFolderStructure(path)

        self.folderPath = path

        self.loadFolder2TreeWidget(directoryList[path], self.fileDir, self.folderPath)






