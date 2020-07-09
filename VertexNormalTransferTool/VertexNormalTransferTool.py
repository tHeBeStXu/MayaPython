import maya.cmds as cmds
import maya.OpenMayaUI as omui
from shiboken2 import wrapInstance
from PySide2 import QtWidgets, QtCore, QtGui
from functools import partial
import logging

logging.basicConfig()
logger = logging.getLogger('VertexNormalTool')
logger.setLevel(logging.INFO)


def getMayaMainWindow():
    ptr = omui.MQtUtil.mainWindow()
    return wrapInstance(long(ptr), QtWidgets.QMainWindow)


class MainUI(QtWidgets.QDialog):
    def __init__(self):
        try:
            cmds.deleteUI('VertexNormalTool')
        except :
            logger.info('No previous UI exists!')

        super(MainUI, self).__init__(parent=getMayaMainWindow())

        self.setModal(False)

        self.setObjectName('VertexNormalTool')
        self.setWindowTitle('Vertex Normal Tool  (tHeBeStXu)')

        self.sourceVertexNormal = None

        # build UI
        self.buildUI()

        # modify UI
        self.modifyUI()

        # show UI
        self.show()

    def buildUI(self):
        self.setFixedSize(500, 300)

        self.mainLayout = QtWidgets.QGridLayout()
        self.setLayout(self.mainLayout)

        sourceMeshLabel = QtWidgets.QLabel('Source Transform Mesh: ')
        targetMeshLabel = QtWidgets.QLabel('Target Transform Mesh: ')

        self.sourceMeshLineEdit = QtWidgets.QLineEdit()
        self.targetMeshLineEdit = QtWidgets.QLineEdit()

        self.sourceMeshBtn = QtWidgets.QPushButton('<<<')
        self.targetMeshBtn = QtWidgets.QPushButton('<<<')

        sourceVertexIDLabel = QtWidgets.QLabel('Vertex ID: ')
        targetVertexIDLabel = QtWidgets.QLabel('Vertex ID: ')

        self.sourceVertexIDLineEdit = QtWidgets.QLineEdit()
        self.targetVertexIDLineEdit = QtWidgets.QLineEdit()

        sourceVertexNormalLabel = QtWidgets.QLabel('Vertex Normal: ')
        targetVertexNormalLabel = QtWidgets.QLabel('Vertex Normal: ')

        sourceVertexNormalXLabel = QtWidgets.QLabel('X:')
        sourceVertexNormalYLabel = QtWidgets.QLabel('Y:')
        sourceVertexNormalZLabel = QtWidgets.QLabel('Z:')

        targetVertexNormalXLabel = QtWidgets.QLabel('X:')
        targetVertexNormalYLabel = QtWidgets.QLabel('Y:')
        targetVertexNormalZLabel = QtWidgets.QLabel('Z:')

        self.sourceVertexNormalXLineEdit = QtWidgets.QLineEdit()
        self.sourceVertexNormalYLineEdit = QtWidgets.QLineEdit()
        self.sourceVertexNormalZLineEdit = QtWidgets.QLineEdit()

        self.targetVertexNormalXLineEdit = QtWidgets.QLineEdit()
        self.targetVertexNormalYLineEdit = QtWidgets.QLineEdit()
        self.targetVertexNormalZLineEdit = QtWidgets.QLineEdit()

        self.transferNormalBtn = QtWidgets.QPushButton('Transfer Normal!')

        # add widgets
        self.mainLayout.addWidget(sourceMeshLabel, 0, 0, 1, 6)
        self.mainLayout.addWidget(targetMeshLabel, 0, 7, 1, 6)

        self.mainLayout.addWidget(self.sourceMeshLineEdit, 1, 0, 1, 4)
        self.mainLayout.addWidget(self.targetMeshLineEdit, 1, 7, 1, 4)

        self.mainLayout.addWidget(self.sourceMeshBtn, 1, 4, 1, 2)
        self.mainLayout.addWidget(self.targetMeshBtn, 1, 11, 1, 2)

        self.mainLayout.addWidget(sourceVertexIDLabel, 2, 0, 1, 6)
        self.mainLayout.addWidget(targetVertexIDLabel, 2, 7, 1, 6)

        self.mainLayout.addWidget(self.sourceVertexIDLineEdit, 3, 2, 1, 3)
        self.mainLayout.addWidget(self.targetVertexIDLineEdit, 3, 9, 1, 3)

        self.mainLayout.addWidget(sourceVertexNormalLabel, 4, 0, 1, 6)
        self.mainLayout.addWidget(targetVertexNormalLabel, 4, 7, 1, 6)

        self.mainLayout.addWidget(sourceVertexNormalXLabel, 5, 0, 1, 1)
        self.mainLayout.addWidget(sourceVertexNormalYLabel, 5, 2, 1, 1)
        self.mainLayout.addWidget(sourceVertexNormalZLabel, 5, 4, 1, 1)

        self.mainLayout.addWidget(targetVertexNormalXLabel, 5, 7, 1, 1)
        self.mainLayout.addWidget(targetVertexNormalYLabel, 5, 9, 1, 1)
        self.mainLayout.addWidget(targetVertexNormalZLabel, 5, 11, 1, 1)

        self.mainLayout.addWidget(self.sourceVertexNormalXLineEdit, 5, 1, 1, 1)
        self.mainLayout.addWidget(self.sourceVertexNormalYLineEdit, 5, 3, 1, 1)
        self.mainLayout.addWidget(self.sourceVertexNormalZLineEdit, 5, 5, 1, 1)

        self.mainLayout.addWidget(self.targetVertexNormalXLineEdit, 5, 8, 1, 1)
        self.mainLayout.addWidget(self.targetVertexNormalYLineEdit, 5, 10, 1, 1)
        self.mainLayout.addWidget(self.targetVertexNormalZLineEdit, 5, 12, 1, 1)

        self.mainLayout.addWidget(Splitter(), 6, 0, 1, 13)

        self.mainLayout.addWidget(self.transferNormalBtn, 7, 4, 1, 6)

    def modifyUI(self):
        """
        Modify UI
        :return: None
        """
        self.sourceMeshBtn.clicked.connect(partial(self.loadVertexNormalInfo, self.sourceMeshLineEdit,
                                                   self.sourceVertexIDLineEdit, self.sourceVertexNormalXLineEdit,
                                                   self.sourceVertexNormalYLineEdit, self.sourceVertexNormalZLineEdit,
                                                   True))

        self.targetMeshBtn.clicked.connect(partial(self.loadVertexNormalInfo, self.targetMeshLineEdit,
                                                   self.targetVertexIDLineEdit, self.targetVertexNormalXLineEdit,
                                                   self.targetVertexNormalYLineEdit, self.targetVertexNormalZLineEdit,
                                                   False))

        self.transferNormalBtn.clicked.connect(self.transferNormalInfo)

    def loadVertexNormalInfo(self, meshLineEdit, vertexIDLineEdit,
                             xLineEdit, yLineEdit, zLineEdit, isSource):
        """
        Load Selected Vertex Normal Information.
        :param meshLineEdit: QlineEdit, mesh LineEdit.
        :param vertexIDLineEdit:
        :param xLineEdit:
        :param yLineEdit:
        :param zLineEdit:
        :param isSource:
        :return:
        """
        # Mesh Name
        vertexStr = str(cmds.ls(sl=1, long=1)[0])
        transformShapeName = vertexStr.split('.')[0]
        if transformShapeName:
            meshLineEdit.setText(transformShapeName)

        # Vertex ID
        vertexID = vertexStr.split('[')[-1]
        vertexID = int(vertexID.split(']')[0])
        vertexIDLineEdit.setText(str(vertexID))

        # Normal Info

        vertexNormal = cmds.polyNormalPerVertex(q=1, xyz=1)
        if isSource:
            self.sourceVertexNormal = vertexNormal

        xValue = vertexNormal[0]
        yValue = vertexNormal[1]
        zValue = vertexNormal[2]

        xLineEdit.setText(str(xValue))
        yLineEdit.setText(str(yValue))
        zLineEdit.setText(str(zValue))

    def transferNormalInfo(self):
        """
        Transfer source normal info to target.
        :return: None
        """
        # Transform or Mesh Name
        if self.targetMeshLineEdit.text():
            transformMeshName = self.targetMeshLineEdit.text()

        # Vertex ID
        if self.targetVertexIDLineEdit.text():
            vertexID = self.targetVertexIDLineEdit.text()
        else:
            logger.warning('Please select a valid vertex!')

        # Normal Value
        xValue = float(self.sourceVertexNormalXLineEdit.text())
        yValue = float(self.sourceVertexNormalYLineEdit.text())
        zValue = float(self.sourceVertexNormalZLineEdit.text())

        if xValue and yValue and zValue:
            vertexNormal = [xValue, yValue, zValue]
        else:
            logger.warning('Vertex normal value is invalid!')

        if transformMeshName and vertexID and vertexNormal:
            fullTargetMeshName = transformMeshName + '.vtx[' + vertexID + ']'
            cmds.polyNormalPerVertex(fullTargetMeshName, xyz=(vertexNormal[0], vertexNormal[1], vertexNormal[2]))


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


