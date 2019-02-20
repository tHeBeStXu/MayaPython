import maya.cmds as cmds
from PySide2 import QtCore, QtGui, QtWidgets
import maya.OpenMayaUI as omui
from shiboken2 import wrapInstance
import logging
import os
from functools import partial
import shutil
import imageio

from ..Lib import exportAnimCurve
from ..Lib import importAnimCurve
reload(exportAnimCurve)
reload(importAnimCurve)

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
        self.tempGIFDir = '%s/tempGIF.gif' % self.tempDir
        self.templateGIF = '%s/animTemplate.gif' % self.iconsDir

        # Current Mode
        self.currentMode = 'export'

        # Current anim Name
        self.currentAnimData = ''

        # QMovie
        self.movie = QtGui.QMovie(self.tempGIFDir, parent=self)

        # ButtonImageSize
        self.size = [150, 150]

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
        self.recordBtn = animatePushBtn(GIFPath=self.templateGIF, size=self.size, parent=self)
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
        self.historyEditLine.setFixedSize(160, 80)
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
        self.nameEditLine.returnPressed.connect(self.renameAnim)

        # Export Import Switch
        self.animExportImportSwitch(mode='export')

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
        """
        load folder structure of given path
        :param path: str, self.libraryDirectory
        :return: None
        """
        # first clear the existing file structure
        self.fileDir.clear()

        directoryList = self.getFolderStructure(path)

        self.folderPath = path

        self.loadFolder2TreeWidget(directoryList[path], self.fileDir, self.folderPath)

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
            icon.addPixmap(QtGui.QPixmap('%s/folder.png' % (self.iconsDir)), QtGui.QIcon.Normal, QtGui.QIcon.Off)
            item.setIcon(0, icon)

            self.loadFolder2TreeWidget(directoryList[eachDirectory], item, self.folderPath)

        self.folderPath = path

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
        """
        Expand folder structure
        :return: None
        """
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

    def removeFolder(self):
        """
        remove folder from folder structure
        :return: None
        """
        selectedItems = self.fileDir.selectedItems()
        if selectedItems:
            replay = QtWidgets.QMessageBox.question(self, 'Question',
                                                    'Are you sure, you want to remove the folder?',
                                                    QtWidgets.QMessageBox.Yes, QtWidgets.QMessageBox.Cancel)
            logger.warning('Are you sure you want to remove the folder?')

            if replay == QtWidgets.QMessageBox.Yes:
                for eachItem in selectedItems:
                    folderPath = str(eachItem.toolTip(0))
                    try:
                        os.chmod(folderPath, 0777)
                        shutil.rmtree(folderPath)
                        logger.info('Remove folder Path: \t%s !' % folderPath)
                    except Exception, result:
                        logger.warning(result)

                # refresh folders structure
                self.removeExistWidget(self.animWidgetLayout)
                self.loadFolderStructure(self.dataDir)
        else:
            QtWidgets.QMessageBox.warning(self, 'Warning',
                                          'No folder selected!\nPlease select the folder!',
                                          QtWidgets.QMessageBox.Ok)
            logger.warning('No folder selected!\nPlease select the folder!')

    def removeExistWidget(self, layout):
        """
        remove Exist widget(s) from animGridLayout
        :param layout: QGridLayout, self.animGridLayout
        :return: None
        """
        for index in range(layout.count()):
            if layout.itemAt(index).widget():
                layout.itemAt(index).widget().deleteLater()

    def renameFolder(self):
        """
        Rename selected folder
        :return: None
        """
        selectedItems = self.fileDir.selectedItems()
        if selectedItems:
            newName, ok = QtWidgets.QInputDialog.getText(self, 'Folder Name',
                                                         'Enter a new name: ',
                                                         QtWidgets.QLineEdit.Normal)

            if ok:
                currentFolderPath = str(selectedItems[-1].toolTip(0))

                newFolderPath = '%s/%s' % (os.path.dirname(currentFolderPath), str(newName))

                replay = 0
                try:
                    os.chmod(currentFolderPath, 0777)
                    os.rename(currentFolderPath, newFolderPath)
                    replay = 1
                except Exception, result:
                    logger.warning(result)
                    replay = 0

                if replay:
                    selectedItems[-1].setText(0, newName)
                    selectedItems[-1].setToolTip(0, newFolderPath)

        else:
            QtWidgets.QMessageBox.warning(self, 'Warning',
                                          'No folder selected!\nPlease select the folder!',
                                          QtWidgets.QMessageBox.Ok)
            logger.warning('No folder selected!\nPlease select the folder!')

    def onFolderContextMenu(self, paint):
        """
        Show folder Menu at correct position
        :param paint:
        :return: None
        """
        self.folderMenu.exec_(self.fileDir.mapToGlobal(paint))

    def recordAnim(self):
        """
        Record anim for saving animation
        :return: None
        """
        if self.currentMode == 'export':
            if os.path.isfile(self.tempGIFDir):
                try:
                    os.chmod(self.tempGIFDir, 0777)
                    os.remove(self.tempGIFDir)

                except Exception, result:
                    logger.warning(result)

            modelPanelList = cmds.getPanel(type='modelPanel')
            for eachModelPanel in modelPanelList:
                cmds.modelEditor(eachModelPanel, e=1, alo=0)
                cmds.modelEditor(eachModelPanel, e=1, pm=1)

            startFrame = cmds.playbackOptions(min=1, q=1)
            endFrame = cmds.playbackOptions(max=1, q=1)

            tempImageList = list()
            for i in range(int(startFrame), int(endFrame+1)):
                tempImage = cmds.playblast(st=i, et=i, fmt='image', cc=1, v=0, orn=0, fp=1, p=100, c='png',
                                           wh=[512, 512], cf='%s/tempImg_%s.png' % (self.tempDir, i))
                tempImageList.append(tempImage)

            # make GIF from tempImageList
            frames = list()
            for tempImage in tempImageList:
                frames.append(imageio.imread(tempImage))
            imageio.mimsave(self.tempGIFDir, frames, 'GIF', duration=0.1)

            # remove temp images
            for i in tempImageList:
                if os.path.isfile(i):
                    try:
                        os.chmod(i, 0777)
                        os.remove(i)
                    except Exception, result:
                        logger.warning(result)

            self.recordBtn.loadGIF2Button(path=self.tempGIFDir)

    def saveAnim(self):
        """
        Save pose to specified directory
        :return: None
        """
        animLabel = str(self.nameEditLine.text())
        selectionList = cmds.ls(sl=1)
        if animLabel:
            if selectionList:
                currentItem = self.fileDir.selectedItems()
                if currentItem:
                    # export anim curve

                    currentAnimGIFPath = exportAnimCurve.exportAnimCurve(selectionList, currentItem[-1].toolTip(0),
                                                                         animLabel, self.tempGIFDir, self.iconsDir)

                    self.nameEditLine.clear()
                    self.recordBtn.loadGIF2Button(path=currentAnimGIFPath)

                    # refresh
                    # self.loadCurrentFolder()
                    logger.info('Successfully Save Anim Curve')
                else:
                    QtWidgets.QMessageBox.warning(self, 'Warning', 'No folder selected!\nPlease select the folder!',
                                                  QtWidgets.QMessageBox.Ok)
                    logger.warning('No folder selected!\nPlease select the folder!')
            else:
                QtWidgets.QMessageBox.warning(self, 'Warning',
                                              'No item selected!\nPlease select the Control Object(s)!',
                                              QtWidgets.QMessageBox.Ok)
                logger.warning('No item selected!\nPlease select the Control Object(s)!')
        else:
            QtWidgets.QMessageBox.warning(self, 'Warning',
                                          'No pose file name enter!\nPlease input the pose file name!',
                                          QtWidgets.QMessageBox.Ok)
            logger.warning('No pose file name enter!\nPlease input the pose file name!')

    def loadCurrentFolder(self):
        """
        Load anim(s) and icon(s) of current folder
        :return: None
        """
        self.dependentList = []

        currentItems = self.fileDir.selectedItems()

        for eachItem in currentItems:
            self.dependentList.append(eachItem)
            self.collectChildItems(eachItem)

        # clean layout
        self.removeExistWidget(self.animWidgetLayout)
        # add toolButtons to layout
        self.loadAnim2Layout(self.dependentList)

        # switch to export mode
        self.animExportImportSwitch('export')

    def loadAnim2Layout(self, itemList):
        """
        load anim(s) to animGridLayout
        :param itemList: list(QToolButton),
        :return: None
        """
        animList = []

        for eachItem in itemList:
            currentPath = str(eachItem.toolTip(0))
            if os.path.isdir(currentPath):
                directoryList = os.listdir(currentPath)

                for eachFile in directoryList:
                    if os.path.isfile('%s/%s' % (currentPath, eachFile)):
                        if eachFile.endswith('.anim'):
                            animList.append('%s/%s' % (currentPath, eachFile))

        row = -1
        column = 0
        coordinateList = []
        for index in range(len(animList)):
            if index % 4:
                column += 1
                coordinateList.append([row, column])
            else:
                row += 1
                column = 0
                coordinateList.append([row, column])

        # tool buttons
        for index in range(len(animList)):
            animLabel = os.path.splitext(os.path.basename(animList[index]))[0]

            # tool button
            toolButton = hoverToolBtn(gifPath=animList[index].replace('.anim', '.gif'),
                                      templateGIFPath=self.templateGIF,
                                      movie=self.movie,
                                      recordBtn=self.recordBtn,
                                      parent=self.animWidget)
            toolButton.setFixedSize(90, 90)
            toolButton.setObjectName('toolButton_%s' % animLabel)
            toolButton.setText(animLabel)
            toolButton.setToolButtonStyle(QtCore.Qt.ToolButtonTextUnderIcon)

            # Icons
            animIconPath  = animList[index].replace('.anim', '.gif')
            icon = QtGui.QIcon()
            movie = QtGui.QMovie(animIconPath)
            movie.jumpToFrame(0)
            movie.stop()
            icon.addPixmap(QtGui.QPixmap(movie.currentPixmap()), QtGui.QIcon.Normal, QtGui.QIcon.Off)
            toolButton.setIcon(icon)
            toolButton.setIconSize(QtCore.QSize(80, 70))

            self.animWidgetLayout.addWidget(toolButton, coordinateList[index][0], coordinateList[index][1], 1, 1)

            # import anims
            toolButton.clicked.connect(partial(self.setCurrentAnim, animList[index]))

    def setCurrentAnim(self, animPath):
        """
        Import Anim Curve to selected
        :param animPath: str, anim path
        :return: None
        """
        selectionList = cmds.ls(sl=1)

        if selectionList:
            # import anim, refresh record button and name edit line
            historyList = importAnimCurve.importAnimCurve(selectionList=selectionList, animPath=animPath)

            currentGIFPath = animPath.replace('.anim', '.gif')
            self.recordBtn.loadGIF2Button(path=currentGIFPath)
            currentPoseNameLabel = os.path.splitext(os.path.basename(animPath))[0]
            self.nameEditLine.setText(currentPoseNameLabel)

            # import history data
            print historyList
            self.historyEditLine.setText("\n".join(historyList))

            # switch to import mode
            self.animExportImportSwitch('import')

            self.currentAnimData = animPath

            logger.info('Successfully import Anim Curve!')

    def renameAnim(self):
        """
        Rename specified anim
        :return: None
        """
        if self.currentMode == 'import':
            if self.currentAnimData:
                newAnimLabel = str(self.nameEditLine.text())

                if newAnimLabel:
                    newAnimPath = '%s/%s.anim' % (os.path.dirname(self.currentAnimData), newAnimLabel)

                    newGIFPath = newAnimPath.replace('.anim', '.gif')

                    existsGIFPath = self.currentAnimData.replace('.anim', '.gif')

                    if os.path.isfile(self.currentAnimData):
                        try:
                            os.chmod(self.currentAnimData, 0777)
                            os.rename(self.currentAnimData, newAnimPath)

                        except Exception, result:
                            logger.warning(result)

                        if os.path.isfile(existsGIFPath):
                            try:
                                os.chmod(existsGIFPath, 0777)
                                os.rename(existsGIFPath, newGIFPath)

                            except Exception, result:
                                logger.warning(result)

                        # refresh current folder
                        self.loadCurrentFolder()

    def animExportImportSwitch(self, mode):
        """
        Anim mode for export and import switch
        :param mode: str, 'export' or 'import'
        :return: None
        """

        self.saveBtn.hide()
        # self.sliderGroup.hide()

        if mode == 'export':
            self.nameEditLine.clear()
            self.historyEditLine.clear()

            self.saveBtn.show()
            self.recordBtn.loadGIF2Button(path=self.templateGIF)

            self.currentMode = 'export'

        if mode == 'import':
            self.sliderGroup.show()

            self.currentMode = 'import'


class hoverToolBtn(QtWidgets.QToolButton):
    def __init__(self,
                 gifPath,
                 templateGIFPath,
                 movie,
                 recordBtn,
                 parent=None):
        super(hoverToolBtn, self).__init__(parent)

        self.gifPath = gifPath
        self.templateGIFPath = templateGIFPath
        self.movie = movie
        self.targetBtn = recordBtn

        self.setMouseTracking(True)

    def enterEvent(self, QEvent):
        if self.movie.fileName() != self.gifPath:
            self.movie.stop()
            self.targetBtn.loadGIF2Button(self.gifPath)

    def leaveEvent(self, QEvent):
        if self.movie.fileName() != self.gifPath:
            self.movie.stop()
            self.targetBtn.loadGIF2Button(self.templateGIFPath)


class animatePushBtn(QtWidgets.QPushButton):
    def __init__(self, GIFPath, size, parent=None):
        super(animatePushBtn, self).__init__(parent)

        self.GIFPath = GIFPath
        self.size = size
        self.movie = QtGui.QMovie(self.GIFPath, parent=parent)

    def loadGIF2Button(self, path):
        self.movie.stop()
        self.movie.setFileName(path)
        self.movie.frameChanged.connect(self.setBtnIcon)
        self.movie.start()

    def setBtnIcon(self):
        self.setIcon(QtGui.QIcon(self.movie.currentPixmap()))
        self.setIconSize(QtCore.QSize(self.size[0], self.size[1]))


