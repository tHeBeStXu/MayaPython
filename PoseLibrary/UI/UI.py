import maya.cmds as cmds
from PySide2 import QtCore, QtGui, QtWidgets
import maya.OpenMayaUI as omui
from shiboken2 import wrapInstance
import logging
import os
from ..Lib import exportPose
from ..Lib import importPose

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

        # Directories
        self.currentDirectory = os.path.abspath(os.path.dirname(__file__))
        self.rootDirectory = os.path.abspath(os.path.join(self.currentDirectory, os.path.pardir))
        self.rootDirectory = self.rootDirectory.replace('\\', '/')

        self.iconsDirectory = '%s/Icons' % self.rootDirectory
        self.dataDirectory = '%s/Data' % self.rootDirectory
        self.tempDirectory = os.path.abspath(os.getenv('TEMP'))
        self.tempDirectory = self.tempDirectory.replace('\\', '/')
        self.snapShotDir = '%s/myPose_snapShot.png' % self.tempDirectory

        # Build UI
        self.buildUI()
        # Adjust UI
        self.uiConfigure()
        # Adjust Icons
        self.iconConfigure()
        # load file structure
        self.loadFolderStructure(self.dataDirectory)

        self.show()

    def buildUI(self):
        """
        Build UI
        :return: None
        """
        self.setFixedSize(800, 500)

        self.mainLayout = QtWidgets.QHBoxLayout()
        self.setLayout(self.mainLayout)

        ############
        # file Dir #
        ############
        self.fileDir = QtWidgets.QTreeWidget()
        self.fileDir.setFixedSize(180, 480)

        ###################
        # Pose ScrollArea #
        ###################
        self.poseWidget = QtWidgets.QWidget()
        self.poseWidgetLayout = QtWidgets.QGridLayout()
        self.poseWidgetLayout.setAlignment(QtCore.Qt.AlignTop | QtCore.Qt.AlignLeft)
        self.poseWidget.setLayout(self.poseWidgetLayout)

        self.poseLib = QtWidgets.QScrollArea()
        self.poseLib.setFixedSize(400, 480)
        self.poseLib.setWidget(self.poseWidget)
        self.poseLib.setWidgetResizable(True)
        self.poseLib.setFocusPolicy(QtCore.Qt.NoFocus)
        self.poseLib.setHorizontalScrollBarPolicy(QtCore.Qt.ScrollBarAlwaysOff)

        ##############
        # Pose Group #
        ##############
        self.poseGroup = QtWidgets.QGroupBox()
        self.poseGroup.setFixedSize(170, 480)
        self.poseGroupLayout = QtWidgets.QVBoxLayout()
        self.poseGroup.setLayout(self.poseGroupLayout)

        self.snapShotButton = QtWidgets.QPushButton()
        self.snapShotButton.setFixedSize(QtCore.QSize(150, 150))
        self.poseGroupLayout.addWidget(self.snapShotButton)

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

    def uiConfigure(self):
        """
        Adjust UI
        :return: None
        """
        # folder menu
        self.folderMenu = QtWidgets.QMenu(self)

        # Actions
        self.folderAction = QtWidgets.QAction('Create Folder', self.fileDir)
        self.folderAction.setObjectName('create_Folder')
        self.folderAction.triggered.connect(self.createFolder)

        self.expandAction = QtWidgets.QAction('Expand', self.fileDir)
        self.expandAction.setObjectName('expand_Folder')
        self.expandAction.triggered.connect(self.expandFolder)

        self.collapseAction = QtWidgets.QAction('Collapse', self.fileDir)
        self.collapseAction.setObjectName('collapse_Folder')
        self.collapseAction.triggered.connect(self.collapseFolder)

        self.folderMenu.addAction(self.folderAction)
        self.folderMenu.addSeparator()
        self.folderMenu.addAction(self.expandAction)
        self.folderMenu.addAction(self.collapseAction)

        # custom context menu
        self.fileDir.setContextMenuPolicy(QtCore.Qt.CustomContextMenu)
        self.fileDir.customContextMenuRequested.connect(self.onFolderContextMenu)

        # snap shot button
        self.snapShotButton.clicked.connect(self.takeSnapShot)
        self.loadImage2Button(self.snapShotButton, '%s/snapshot.png' % self.iconsDirectory, [150, 150])

        # save current Pose
        self.saveButton.clicked.connect(self.savePose)

        # load pose to UI
        self.fileDir.itemClicked.connect(self.loadCurrentFolder)

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
            parent = self.fileDir
            currentPath = self.dataDirectory
            if self.fileDir.selectedItems():
                parent = self.fileDir.selectedItems()[-1]
                currentPath = str(parent.toolTip(0))

            if not os.path.isdir('%s/%s' % (currentPath, str(folderName))):
                item = QtWidgets.QTreeWidgetItem(parent)

                item.setText(0, str(folderName))
                item.setToolTip(0, '%s/%s' % (currentPath, str(folderName)))

                # connect icon
                icon = QtGui.QIcon()
                icon.addPixmap(QtGui.QPixmap('%s/folder.png' % (self.iconsDirectory)), QtGui.QIcon.Normal, QtGui.QIcon.Off)
                item.setIcon(0, icon)

                # be careful about shiboken2, you can use 'is' and 'is not' instead of using operator '==' and '!='
                if parent is not self.fileDir:
                    self.fileDir.setItemExpanded(parent, True)
                    self.fileDir.setItemSelected(parent, False)

                self.fileDir.setItemSelected(item, True)

                os.makedirs('%s/%s' % (currentPath, str(folderName)))

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
            icon.addPixmap(QtGui.QPixmap('%s/folder.png' % (self.iconsDirectory)), QtGui.QIcon.Normal, QtGui.QIcon.Off)
            item.setIcon(0, icon)

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

    def expandFolder(self):
        if self.fileDir.selectedItems():
            currentItem = self.fileDir.selectedItems()[-1]
            self.dependentList = [currentItem]
            self.collectChildItems(currentItem)

            for eachDepend in self.dependentList:
                self.fileDir.setItemExpanded(eachDepend, 1)

        else:
            self.fileDir.expandAll()

    def collapseFolder(self):
        """
        Collapse Folder action
        :return: None
        """
        currentItem = self.fileDir.invisibleRootItem()

        if self.fileDir.selectedItems():
            currentItem = self.fileDir.selectedItems()[-1]

        self.dependentList = [currentItem]
        self.collectChildItems(currentItem)
        for eachDepend in self.dependentList:
            self.fileDir.collapseItem(eachDepend)

    def collectChildItems(self, parent):
        """
        Collect child items
        :param parent: str, selected item
        :return: None
        """
        for index in range(parent.childCount()):
            currentChild = parent.child(index)
            self.dependentList.append(currentChild)
            self.collectChildItems(currentChild)

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
                icon.addPixmap(QtGui.QPixmap('%s/%s.png' % (self.iconsDirectory, currentIcon)),
                               QtGui.QIcon.Normal, QtGui.QIcon.Off)
                menuList[index].setIcon(icon)

    def takeSnapShot(self):
        """
        Take snap shot for saving pose
        :return: None
        """
        if os.path.isfile(self.snapShotDir):
            try:
                os.chmod(self.snapShotDir, 0777)
                os.remove(self.snapShotDir)
            except Exception, result:
                print result

        modelPanelList = cmds.getPanel(type='modelPanel')
        for eachModelPanel in modelPanelList:
            cmds.modelEditor(eachModelPanel, e=1, alo=0)
            cmds.modelEditor(eachModelPanel, e=1, pm=1)


        currentFrame = cmds.currentTime(q=1)
        playBlast = cmds.playblast(st=currentFrame, et=currentFrame, fmt='image',
                                   cc=1, v=0, orn=0, fp=1, p=100, c='png',
                                   wh=[512, 512], cf=self.snapShotDir)

        self.loadImage2Button(self.snapShotButton, self.snapShotDir, [150, 150])

    def loadImage2Button(self, button, path, size):
        """
        Load icon to snap shot button
        :param button: QPushButton, snap shot button
        :param path: str, icon path
        :param size: list(int), pixel size list
        :return: None
        """
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(path), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        button.setIcon(icon)
        button.setIconSize(QtCore.QSize(size[0], size[1]))

    def savePose(self):
        """
        Save pose to specified directory
        :return: None
        """
        poseLabel = str(self.nameEditLine.text())
        selectionList = cmds.ls(sl=1)
        if poseLabel:
            if selectionList:
                currentItem = self.fileDir.selectedItems()
                if currentItem:
                    # export file, clear nameLine and load icon to snapshot button
                    currentPoseIconPath = exportPose.exportPose(selectionList, currentItem[-1].toolTip(0),
                                                                poseLabel, self.snapShotDir, self.iconsDirectory)
                    self.nameEditLine.clear()
                    self.loadImage2Button(self.snapShotButton, currentPoseIconPath, [150, 150])
                    logger.info('Successfully Save Poses!')
                else:
                    QtWidgets.QMessageBox.warning(self, 'Warning',
                                                  'No folder selected!\nPlease select the folder!',
                                                  QtWidgets.QMessageBox.Ok)
            else:
                QtWidgets.QMessageBox.warning(self, 'Warning',
                                              'No item selected!\nPlease select the Control Object(s)!',
                                              QtWidgets.QMessageBox.Ok)
        else:
            QtWidgets.QMessageBox.warning(self, 'Warning',
                                          'No pose file name enter!\nPlease input the pose file name!',
                                          QtWidgets.QMessageBox.Ok)

    def loadCurrentFolder(self):
        """
        Load pose(s) and icon(s) of current folder
        :return: None
        """
        self.dependentList = []

        currentItems = self.fileDir.selectedItems()

        for eachItem in currentItems:
            self.dependentList.append(eachItem)
            self.collectChildItems(eachItem)

        # clean layout
        self.removeExistWidget(self.poseWidgetLayout)
        # add toolButtons to layout
        self.loadPose2Layout(self.dependentList)

    def loadPose2Layout(self, itemList):
        """
        load pose(s) to poseGridLayout
        :param itemList: list(QToolButton),
        :return: None
        """
        poseList = []

        for eachItem in itemList:
            currentPath = str(eachItem.toolTip(0))
            if os.path.isdir(currentPath):
                directoryList = os.listdir(currentPath)

                for eachFile in directoryList:
                    if os.path.isfile('%s/%s' % (currentPath, eachFile)):
                        if eachFile.endswith('.pose'):
                            poseList.append('%s/%s' % (currentPath, eachFile))

        row = -1
        column = 0
        coordinateList = []
        for index in range(len(poseList)):
            if index % 4:
                column += 1
                coordinateList.append([row, column])
            else:
                row += 1
                column = 0
                coordinateList.append([row, column])

        # tool buttons
        for index in range(len(poseList)):
            poseLabel = os.path.splitext(os.path.basename(poseList[index]))[0]

            # tool button
            toolButton = QtWidgets.QToolButton(self.poseWidget)
            toolButton.setFixedSize(90, 90)
            toolButton.setObjectName('toolButton_%s' % poseLabel)
            toolButton.setText(poseLabel)
            toolButton.setToolButtonStyle(QtCore.Qt.ToolButtonTextUnderIcon)

            # Icons
            poseIconPath  = poseList[index].replace('.pose', '.png')
            icon = QtGui.QIcon()
            icon.addPixmap(QtGui.QPixmap(poseIconPath), QtGui.QIcon.Normal, QtGui.QIcon.Off)
            toolButton.setIcon(icon)
            toolButton.setIconSize(QtCore.QSize(80, 70))

            self.poseWidgetLayout.addWidget(toolButton, coordinateList[index][0], coordinateList[index][1], 1, 1)

    def removeExistWidget(self, layout):
        """
        remove Exist widget(s) from poseGridLayout
        :param layout: QGridLayout, self.poseGridLayout
        :return: None
        """
        for index in range(layout.count()):
            if layout.itemAt(index).widget():
                layout.itemAt(index).widget().deleteLater()



