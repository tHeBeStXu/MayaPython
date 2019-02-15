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
        self.fileDir.headerItem().setText(0, self.dataDir)
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

        self.namelabel = QtWidgets.QLabel('Name: ')
        self.nameEditLine = QtWidgets.QLineEdit()
        self.nameEditLine.setFixedWidth(120)
        self.nameEditLine.setPlaceholderText('Enter a Animation Name')

        nameLayout.addWidget(self.namelabel)
        nameLayout.addWidget(self.nameEditLine)

        #####################
        # History Edit Line #
        #####################
        self.historyGroup = QtWidgets.QGroupBox()
        historyLayout = QtWidgets.QHBoxLayout()
        self.historyGroup.setLayout(historyLayout)

        self.historyEditLine = QtWidgets.QTextEdit()
        self.historyEditLine.setFixedSize(160, 100)
        self.historyEditLine.setFocusPolicy(QtCore.Qt.NoFocus)
        self.historyEditLine.setReadOnly(True)

        historyLayout.addWidget(self.historyEditLine)
        self.animGroupLayout.addWidget(self.historyGroup)

        ###############
        # Save Button #
        ###############
        self.saveBtnGroup = QtWidgets.QGroupBox()
        saveBtnLayout = QtWidgets.QHBoxLayout()
        self.saveBtnGroup.setLayout(saveBtnLayout)

        self.saveBtn = QtWidgets.QPushButton('Save')
        self.saveBtn.setFixedSize(160, 35)
        saveBtnLayout.addWidget(self.saveBtn)
        self.animGroupLayout.addWidget(self.saveBtnGroup)

        # add all
        self.mainLayout.addWidget(self.fileDir)
        self.mainLayout.addWidget(self.animLib)
        self.mainLayout.addWidget(self.animGroup)

    def uiConfigure(self):
        """
        Adjust UI
        :return: None
        """
        # Folder Menu
        self.folderMenu = QtWidgets.QMenu(self)

        # Actions
        self.createAction = QtWidgets.QAction('Create Folder', self.fileDir)
        self.createAction.setObjectName('create_Folder')
        self.createAction.triggered.connect(self.createFolder)

        self.expandAction = QtWidgets.QAction('Expand', self.fileDir)
        self.expandAction.setObjectName('expand_Folder')
        self.expandAction.triggered.connect(self.expandFolder)

        self.collapseAction = QtWidgets.QAction('Collapse', self.fileDir)
        self.collapseAction.setObjectName('collapse_Folder')
        self.collapseAction.triggered.connect(self.collapseFolder)

        self.removeAction = QtWidgets.QAction('Remove', self.fileDir)
        self.removeAction.setObjectName('remove_Folder')
        self.removeAction.triggered.connect(self.removeFolder)

        self.renameAction = QtWidgets.QAction('Rename', self.fileDir)
        self.renameAction.setObjectName('rename_Folder')
        self.renameAction.triggered.connect(self.renameFolder)

        self.folderMenu.addAction(self.createAction)
        self.folderMenu.addSeparator()
        self.folderMenu.addAction(self.expandAction)
        self.folderMenu.addAction(self.collapseAction)
        self.folderMenu.addSeparator()
        self.folderMenu.addAction(self.renameAction)
        self.folderMenu.addAction(self.removeAction)

        # Custom Context Menu
        self.fileDir.setContextMenuPolicy(QtCore.Qt.CustomContextMenu)
        self.fileDir.customContextMenuRequested.connect(self.onFolderContextMenu)

        # Record Button
        self.recordBtn.clicked.connect(self.recordAnim)

        # Save Current Anim
        self.saveBtn.clicked.connect(self.saveAnim)

        # Load Anim To UI
        self.fileDir.itemClicked.connect(self.loadCurrentFolder)

        # Rename Anim
        self.nameEditLine.returnPressed.connect(self.renamePose)

        # Export Import Switch
        self.poseExportImportSwitch(mode='export')

    def iconConfigure(self):
        """
        Adjust icons
        :return: None
        """
        menuList = self.fileDir.findChildren(QtWidgets.QAction)

        for index in xrange(len(menuList)):
            objectName = menuList[index].objectName()

            if objectName:
                currentIcon = objectName.split('_')[0]

                icon = QtGui.QIcon()
                icon.addPixmap(QtGui.QPixmap('%s/%s.png' % (self.iconsDir, currentIcon)),
                               QtGui.QIcon.Normal, QtGui.QIcon.Off)
                menuList[index].setIcon(icon)

    def loadFolderStructure(self, path):
        pass

    def createFolder(self):
        """
        create folder dialog on treeWidget
        :return: None
        """
        folderName, ok = QtWidgets.QInputDialog.getText(self, 'Folder Name', 'Enter the folder name :',
                                                        QtWidgets.QLineEdit.Normal)

        if ok:
            parent = self.fileDir
            currentPath = self.dataDir
            if self.fileDir.selectedItems():
                parent = self.fileDir.selectedItems()[-1]
                currentPath = str(parent.toolTip(0))

            if not os.path.isdir('%s/%s' % (currentPath, str(folderName))):
                item = QtWidgets.QTreeWidgetItem(parent)

                item.setText(0, str(folderName))
                item.setToolTip(0, '%s/%s' % (currentPath, str(folderName)))

                # connect icon
                icon = QtGui.QIcon()
                icon.addPixmap(QtGui.QPixmap('%s/folder.png' % (self.iconsDir)), QtGui.QIcon.Normal,
                               QtGui.QIcon.Off)
                item.setIcon(0, icon)

                # be careful about shiboken2, you can use 'is' and 'is not' instead of using operator '==' and '!='
                if parent is not self.fileDir:
                    self.fileDir.setItemExpanded(parent, True)
                    self.fileDir.setItemSelected(parent, False)

                self.fileDir.setItemSelected(item, True)

                os.makedirs('%s/%s' % (currentPath, str(folderName)))

    def expandFolder(self):
        pass

    def collapseFolder(self):
        pass

    def removeFolder(self):
        pass

    def renameFolder(self):
        pass

    def onFolderContextMenu(self, paint):
        """
        Show folder Menu at correct position
        :param paint:
        :return: None
        """
        self.folderMenu.exec_(self.fileDir.mapToGlobal(paint))

    def recordAnim(self):
        pass

    def saveAnim(self):
        pass

    def loadCurrentFolder(self):
        pass

    def renamePose(self):
        pass

    def poseExportImportSwitch(self, mode):
        """
        Pose mode for export and import switch
        :param mode: str, 'export' or 'import'
        :return: None
        """
        pass



class gifButton(QtWidgets.QPushButton):
    def __init__(self, parent=None):
        QtWidgets.QPushButton.__init__(self, parent)

        self.label = QtWidgets.QLabel()



