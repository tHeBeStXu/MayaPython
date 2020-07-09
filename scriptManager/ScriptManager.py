"""
Script Manager v1.0 by Yixiong Xu 2020.03.09
"""

import maya.cmds as cmds
from maya import OpenMayaUI as omui
import os
import logging
import sys
import json
from functools import partial

logging.basicConfig()
logger = logging.getLogger('ScriptManager')
logger.setLevel(logging.INFO)

# Whether it is Pyside or Pyside2
QtVersion = cmds.about(qtVersion=True)
if QtVersion.startswith("4") or type(QtVersion) not in [str, unicode]:
    from PySide.QtGui import *
    from PySide.QtCore import *
    import shiboken

else:
    from PySide2.QtGui import *
    from PySide2.QtCore import *
    from PySide2.QtWidgets import *
    import shiboken2 as shiboken


def getMayaMainWindow():
    win = omui.MQtUtil.mainWindow()
    ptr = shiboken.wrapInstance(long(win), QMainWindow)
    return ptr


def deleteDock(name='ScriptManager'):
    if cmds.workspaceControl(name, q=1, exists=1):
        cmds.deleteUI(name)


def getDock(name='ScriptManager'):
    deleteDock()
    ctrl = cmds.workspaceControl(name, dockToMainWindow=['right', 1], label='ScriptManager')

    qtCtrl = omui.MQtUtil.findControl(ctrl)
    ptr = shiboken.wrapInstance(long(qtCtrl), QWidget)

    return ptr


class MainUI(QWidget):
    def __init__(self, dock=1):
        parent = None

        if dock:
            parent=getDock()
        else:
            deleteDock()
            try:
                cmds.deleteUI('ScriptManager')
            except:
                logger.info('No previous UI exists!')

            parent = QDialog(parent=getMayaMainWindow())
            parent.setObjectName('ScriptManager')
            parent.setWindowTitle('Script Manager  v1.0  Yixiong Xu')
            parent.setMinimumSize(270, 570)
            layout = QVBoxLayout()
            parent.setLayout(layout)

        super(MainUI, self).__init__(parent=parent)

        # init variable

        # Build UI
        self.buildUI()

        # Modify UI
        self.modifyUI()

        self.parent().layout().addWidget(self)

        # Show UI
        if not dock:
            self.parent().show()

    def buildUI(self):
        """
        Build the widget UI.
        :return:None
        """
        self.mainLayout = QVBoxLayout()
        self.mainLayout.setAlignment(Qt.AlignTop)
        self.setLayout(self.mainLayout)

        self.databaseLayout = QGridLayout()
        self.databaseComboBox = QComboBox()
        self.loadScriptBtn = QPushButton('Load Scripts')

        self.splitter = Splitter('Scripts')

        self.flowGroupBox = QGroupBox('')
        self.flowGroupBox.setSizePolicy(QSizePolicy.MinimumExpanding, QSizePolicy.MinimumExpanding)
        self.flowLayout = FlowLayout()
        self.flowGroupBox.setLayout(self.flowLayout)

        self.databaseLayout.addWidget(self.loadScriptBtn, 0, 3, 1, 1)
        self.databaseLayout.addWidget(self.databaseComboBox, 0, 0, 1, 3)
        self.mainLayout.addLayout(self.databaseLayout)
        self.mainLayout.addWidget(self.splitter)
        self.mainLayout.addWidget(self.flowGroupBox)

    def modifyUI(self):
        """
        Modify UI
        :return:None
        """
        self.loadScriptBtn.clicked.connect(self.openDataBase)

        self.databaseComboBox.currentIndexChanged.connect(self.loadScripts)

    def openDataBase(self):
        """Load Data Base"""
        (filePath, selectedFilter) = QFileDialog.getOpenFileName(self,
                                                                 str('Open Scripts Init File: '),
                                                                 os.getcwd(),
                                                                 str("Json (*.json)"))

        if filePath:
            self.addDataBase(filePath)
        else:
            logger.error('Please select a valid file!')

    def addDataBase(self, filePath):
        """
        Add Data Base to the combo box
        :param filePath: str, file path of the data base
        :return:
        """
        fileName = os.path.splitext(os.path.split(filePath)[-1])[0]

        if fileName:
            index = self.databaseComboBox.findText(fileName, Qt.MatchExactly)

            if index < 0:
                self.databaseComboBox.addItem(fileName, userData=filePath)
            else:
                self.databaseComboBox.removeItem(index)
                self.databaseComboBox.addItem(fileName, userData=filePath)
        else:
            logger.error('Invalid file name!')

    def loadScripts(self):
        """
        Load scripts in the json file
        :return:
        """
        # clean the flow layout
        self.clearLayout()

        # load scripts
        index = self.databaseComboBox.currentIndex()
        filePath = self.databaseComboBox.itemData(index)

        scriptData = None
        if filePath:
            with open(filePath, 'r') as f:
                scriptData = json.load(f)

        if scriptData:
            self.loadDataBase(scriptData)

    def loadDataBase(self, scriptData):
        """
        Load data base
        :param scriptData:
        :return: None
        """
        for key in scriptData:
            path = scriptData[key]
            toolBtn = QToolButton()
            toolBtn.setText(key)
            toolBtn.setToolTip(path)
            toolBtn.setFixedSize(90, 90)
            self.flowLayout.addWidget(toolBtn)
            fileFolder = os.path.split(path)[0]
            #print fileFolder
            toolBtn.clicked.connect(partial(self.loadModule, key, fileFolder))

    def clearLayout(self):
        """
        Clear the flow layout
        :return: None
        """
        for index in range(self.flowLayout.count()):
            if self.flowLayout.itemAt(index).widget():
                self.flowLayout.itemAt(index).widget().deleteLater()

    def loadModule(self, moduleName, modulePath):
        """
        Load Module when button clicked
        :param moduleName: str, module name
        :param modulePath: str, module path
        :return: None
        """
        # print 'moduleName : %s' % moduleName
        # print 'modulePath : %s' % modulePath
        # get module path
        modulePath = r'%s' % modulePath
        if modulePath not in sys.path:
            sys.path.append(modulePath)

        # dynamic import the module
        importedModule = __import__(moduleName)
        logger.info('Import Module: %s' % moduleName)
        reload(importedModule)


"""
Flow Layout
"""
class FlowLayout(QLayout):
    def __init__(self, parent=None, margin=-1, hspacing=-1, vspacing=-1):
        super(FlowLayout, self).__init__(parent)
        self._hspacing = hspacing
        self._vspacing = vspacing
        self._items = []
        self.setContentsMargins(margin, margin, margin, margin)

    def __del__(self):
        del self._items[:]

    def addItem(self, item):
        self._items.append(item)

    def horizontalSpacing(self):
        if self._hspacing >= 0:
            return self._hspacing
        else:
            return self.smartSpacing(
                QStyle.PM_LayoutHorizontalSpacing)

    def verticalSpacing(self):
        if self._vspacing >= 0:
            return self._vspacing
        else:
            return self.smartSpacing(
                QStyle.PM_LayoutVerticalSpacing)

    def count(self):
        return len(self._items)

    def itemAt(self, index):
        if 0 <= index < len(self._items):
            return self._items[index]

    def takeAt(self, index):
        if 0 <= index < len(self._items):
            return self._items.pop(index)

    def expandingDirections(self):
        return Qt.Orientations(0)

    def hasHeightForWidth(self):
        return True

    def heightForWidth(self, width):
        return self.doLayout(QRect(0, 0, width, 0), True)

    def setGeometry(self, rect):
        super(FlowLayout, self).setGeometry(rect)
        self.doLayout(rect, False)

    def sizeHint(self):
        return self.minimumSize()

    def minimumSize(self):
        size = QSize()
        for item in self._items:
            size = size.expandedTo(item.minimumSize())
        left, top, right, bottom = self.getContentsMargins()
        size += QSize(left + right, top + bottom)
        return size

    def doLayout(self, rect, testonly):
        left, top, right, bottom = self.getContentsMargins()
        effective = rect.adjusted(+left, +top, -right, -bottom)
        x = effective.x()
        y = effective.y()
        lineheight = 0
        for item in self._items:
            widget = item.widget()
            hspace = self.horizontalSpacing()
            if hspace == -1:
                hspace = widget.style().layoutSpacing(
                    QSizePolicy.PushButton,
                    QSizePolicy.PushButton, Qt.Horizontal)
            vspace = self.verticalSpacing()
            if vspace == -1:
                vspace = widget.style().layoutSpacing(
                    QSizePolicy.PushButton,
                    QSizePolicy.PushButton, Qt.Vertical)
            nextX = x + item.sizeHint().width() + hspace
            if nextX - hspace > effective.right() and lineheight > 0:
                x = effective.x()
                y = y + lineheight + vspace
                nextX = x + item.sizeHint().width() + hspace
                lineheight = 0
            if not testonly:
                item.setGeometry(
                    QRect(QPoint(x, y), item.sizeHint()))
            x = nextX
            lineheight = max(lineheight, item.sizeHint().height())
        return y + lineheight - rect.y() + bottom

    def smartSpacing(self, pm):
        parent = self.parent()
        if parent is None:
            return -1
        elif parent.isWidgetType():
            return parent.style().pixelMetric(pm, None, parent)
        else:
            return parent.spacing()

class Splitter(QWidget):
    def __init__(self, text=None):
        """
        Splitter class for create splitter widget
        :param text: text between splitter lines
        """
        super(Splitter, self).__init__()

        self.setMinimumHeight(2)
        self.mainLayout = QHBoxLayout()
        self.setLayout(self.mainLayout)
        self.mainLayout.setContentsMargins(0, 0, 0, 0)
        self.mainLayout.setSpacing(0)
        self.mainLayout.setAlignment(Qt.AlignVCenter)

        firstLine = QFrame()
        firstLine.setFrameStyle(QFrame.HLine)
        self.mainLayout.addWidget(firstLine)

        if not text:
            return

        font = QFont()
        font.setBold(True)

        textWidth = QFontMetrics(font)
        width = textWidth.width(text) + 10

        label = QLabel()
        label.setText(text)
        label.setFont(font)
        label.setMaximumWidth(width)
        label.setAlignment(Qt.AlignVCenter | Qt.AlignHCenter)

        self.mainLayout.addWidget(label)

        secondLine = QFrame()
        secondLine.setFrameStyle(QFrame.HLine)
        self.mainLayout.addWidget(secondLine)

# Start UI
MainUI(dock=1)
