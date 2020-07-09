import maya.cmds as cmds
import maya.OpenMayaUI as omui
from PySide2 import QtWidgets, QtCore, QtGui
from shiboken2 import wrapInstance
import logging

logging.basicConfig()
logger = logging.getLogger('VertexColorTool')
logger.setLevel(logging.INFO)


def getMayaMainWindow():
    ptr = omui.MQtUtil.mainWindow()
    return wrapInstance(long(ptr), QtWidgets.QMainWindow)


class MainUI(QtWidgets.QDialog):
    def __init__(self):
        try:
            cmds.deleteUI('VertexColorTool')
        except:
            logger.info('No previous UI exists!')

        super(MainUI, self).__init__(parent=getMayaMainWindow())

        self.setModal(False)

        self.setObjectName('VertexColorTool')

        self.setWindowTitle('Vertex Color Tool   (tHeBeStXu)')

        # Build UI
        self.buildUI()

        # Modify UI
        self.modifyUI()

        # Show UI
        self.show()

    def buildUI(self):
        """
        Build UI
        :return:None
        """
        self.mainLayout = QtWidgets.QVBoxLayout()
        self.setLayout(self.mainLayout)

        self.vertexColorLabel = QtWidgets.QLabel('Vertex Color')
        self.vertexColorLabel.setAlignment(QtCore.Qt.AlignCenter)

        self.showVertexColorBtn = QtWidgets.QPushButton('Show ')

        self.hideVertexColorBtn = QtWidgets.QPushButton('Hide ')
        self.btnLayout = QtWidgets.QHBoxLayout()

        self.mainLayout.addWidget(self.vertexColorLabel)
        self.mainLayout.addLayout(self.btnLayout)
        self.btnLayout.addWidget(self.showVertexColorBtn)
        self.btnLayout.addWidget(self.hideVertexColorBtn)

    def modifyUI(self):
        """
        Modify UI
        :return: Nont
        """
        self.showVertexColorBtn.clicked.connect(self.showVertexColor)
        self.hideVertexColorBtn.clicked.connect(self.hideVertexColor)

    def showVertexColor(self):
        """
        Show Vertex Color
        :return:
        """
        selectionList = cmds.ls(sl=1)

        for sel in selectionList:
            cmds.polyColorPerVertex(sel, colorDisplayOption=True)

    def hideVertexColor(self):
        """
        Hide Vertex Color
        :return: None
        """
        selectionList = cmds.ls(sl=1)

        for sel in selectionList:
            cmds.polyColorPerVertex(sel, remove=True)


