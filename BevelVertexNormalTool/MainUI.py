import maya.cmds as cmds
import maya.OpenMayaUI as omui
import logging

from . import Lib
reload(Lib)

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


logging.basicConfig()
logger = logging.getLogger('BevelVertexNormalTool')
logger.setLevel(logging.INFO)


def getMayaMainWindow():
    win = omui.MQtUtil.mainWindow()
    ptr = shiboken.wrapInstance(long(win), QMainWindow)
    return ptr


class MainUI(QDialog):
    def __init__(self):
        try:
            cmds.deleteUI('BevelVertexNormalTool')
        except:
            logger.info('No previous UI exists!')

        super(MainUI, self).__init__(parent=getMayaMainWindow())

        self.setModal(False)

        self.setObjectName('BevelVertexNormalTool')
        self.setWindowTitle('Bevel Vertex Normal Tool  (Yixiong Xu)')

        self.initFacesIDs = None
        self.surroundFacesIDs = None

        self.buildUI()

        self.modifyUI()

        self.show()

    def buildUI(self):
        """
        Build UI
        :return: None
        """
        self.setFixedSize(300, 680)

        self.mainLayout = QVBoxLayout()
        self.setLayout(self.mainLayout)

        self.step1Splitter = Splitter('Step 1: Select Beveled Faces')
        self.meshNameLabel = QLabel('Selected Mesh Name:')
        self.meshNameLineEdit = QLineEdit()
        self.selectedFaceLabel = QLabel('Selected Face ID:')
        self.step1ListWidget = QListWidget()
        self.step1Btn = QPushButton('Select')

        self.step2Splitter = Splitter('Step 2: Select Surround Faces')
        self.surroundFaceLabel = QLabel('Surround Face ID:')
        self.step2ListWidget = QListWidget()
        self.step2Btn = QPushButton('Select')

        self.step3Splitter = Splitter('')
        self.step3Btn = QPushButton('Go!')

        self.mainLayout.addWidget(self.step1Splitter)
        self.mainLayout.addWidget(self.meshNameLabel)
        self.mainLayout.addWidget(self.meshNameLineEdit)
        self.mainLayout.addWidget(self.selectedFaceLabel)
        self.mainLayout.addWidget(self.step1ListWidget)
        self.mainLayout.addWidget(self.step1Btn)

        self.mainLayout.addWidget(self.step2Splitter)
        self.mainLayout.addWidget(self.surroundFaceLabel)
        self.mainLayout.addWidget(self.step2ListWidget)
        self.mainLayout.addWidget(self.step2Btn)

        self.mainLayout.addWidget(self.step3Splitter)
        self.mainLayout.addWidget(self.step3Btn)

    def modifyUI(self):
        """
        Modify UI
        :return: None
        """
        self.meshNameLineEdit.setReadOnly(True)
        self.step3Btn.setFixedHeight(50)

        self.step1Btn.clicked.connect(self.selectInitFaces)
        self.step2Btn.clicked.connect(self.selectSurroundFaces)
        self.step3Btn.clicked.connect(self.editBevelVertexNormal)

    def selectInitFaces(self):
        """
        Step 1: Select Init Faces
        :return: None
        """
        # Mesh Name
        self.meshNameLineEdit.clear()
        self.meshName = Lib.getMeshName()
        self.meshNameLineEdit.setText(self.meshName)

        # Selected Init Faces IDs
        self.initFacesIDs = Lib.getSelectedFacesIDs()
        self.editListWidget(facesIDsList=self.initFacesIDs,
                            listWidget=self.step1ListWidget)

        # Select Raw Surround Faces IDs
        self.surroundFacesIDs = Lib.getConnectedFacesIDs()

        cmds.select(cl=1)
        for id in self.surroundFacesIDs:
            cmds.select(self.meshName + '.f[' + str(id) + ']', add=1)

    def selectSurroundFaces(self):
        """
        Step 2: Select Surround Faces
        :return: None
        """
        self.surroundFacesIDs = Lib.getSelectedFacesIDs()
        self.editListWidget(facesIDsList=self.surroundFacesIDs,
                            listWidget=self.step2ListWidget)

        logger.info('Select Surround Faces Success!')

    def editBevelVertexNormal(self):
        """
        Step 3: Edit Selected Bevel Vertex Normal
        :return: None
        """
        vertexIDs = Lib.getVertexIDs(shapeName=self.meshName,
                                     faceIDs=self.initFacesIDs)

        Lib.calculateAndSetVertexNormal(shapeName=self.meshName,
                                        vertexIDs=vertexIDs,
                                        initFacesIDs=self.initFacesIDs,
                                        connectedFacesIDs=self.surroundFacesIDs)
        logger.info('Edit Selected Bevel Vertex Normal Success!')

    def editListWidget(self, facesIDsList ,listWidget):
        listWidget.clear()
        if facesIDsList:
            for item in facesIDsList:
                listWidget.addItem(str(item))


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


MainUI()
