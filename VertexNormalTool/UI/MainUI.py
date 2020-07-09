import maya.cmds as cmds
import maya.OpenMaya as om
import maya.OpenMayaUI as omui
import logging


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
logger = logging.getLogger('VertexNormalTool')
logger.setLevel(logging.INFO)


def getMayaMainWindow():
    win = omui.MQtUtil.mainWindow()
    ptr = shiboken.wrapInstance(long(win), QMainWindow)
    return ptr


class MainUI(QDialog):
    def __init__(self):
        try:
            cmds.deleteUI('VertexNormalTool')

        except:
            logger.info('No previous UI exists!')

        super(MainUI, self).__init__(parent=getMayaMainWindow())

        self.setModal(False)

        self.setObjectName('VertexNormalTool')
        self.setWindowTitle('Vertex Normal Tool  (Yixiong Xu)')

        # Initialize the properties
        self.sourceMeshName = None
        self.sourceVertPos = None

        self.targetMeshName = None
        self.targetIDs = None
        self.targetVertPos = None

        self.buildUI()

        self.modifyUI()

        self.show()

    def buildUI(self):
        """
        Build UI
        :return: None
        """
        self.setFixedSize(300, 450)

        self.mainLayout = QVBoxLayout()
        self.setLayout(self.mainLayout)

        self.sourceSplitter = Splitter('Source Mesh')

        self.sourceLineEdit = QLineEdit()
        self.sourceBtn = QPushButton(' <<< ')

        self.sourceLayout = QHBoxLayout()
        self.sourceLayout.addWidget(self.sourceLineEdit)
        self.sourceLayout.addWidget(self.sourceBtn)

        self.targetSplitter = Splitter('Target Vertex')
        self.targetListWidget = QListWidget()
        self.targetBtn = QPushButton(' <<< ')

        self.targetLayout = QHBoxLayout()
        self.targetLayout.addWidget(self.targetListWidget)
        self.targetLayout.addWidget(self.targetBtn)

        self.transferSplitter = Splitter()
        self.transferBtn = QPushButton('Transfer Normal')

        self.mainLayout.addWidget(self.sourceSplitter)
        self.mainLayout.addLayout(self.sourceLayout)
        self.mainLayout.addWidget(self.targetSplitter)
        self.mainLayout.addLayout(self.targetLayout)
        self.mainLayout.addWidget(self.transferSplitter)
        self.mainLayout.addWidget(self.transferBtn)

    def modifyUI(self):
        """
        Modify UI
        :return: None
        """
        self.sourceLineEdit.setReadOnly(True)

        self.sourceBtn.clicked.connect(self.getSourceValue)
        self.targetBtn.clicked.connect(self.getTargetValue)
        self.transferBtn.clicked.connect(self.transferNormals)

    def getIDsPositions(self, meshName, IDs=None):
        """
        Get vertex positions by vertex IDs
        :param meshName: str, mesh shape name
        :param IDs: MIntArray, int array of the IDs
        :return: MPointArray, vertex positions
        """
        mSelectionList = om.MSelectionList()
        mSelectionList.add(meshName)
        mDagPath = om.MDagPath()
        mSelectionList.getDagPath(0, mDagPath)
        mfnMesh = om.MFnMesh(mDagPath)

        mPointArray = om.MPointArray()

        if IDs:
            # get the specified point position of the mesh
            for i in IDs:
                mPoint = om.MPoint()
                mfnMesh.getPoint(i, mPoint, om.MSpace.kWorld)
                mPointArray.append(mPoint)
        else:
            # get all point position of the mesh
            indexNum = mfnMesh.numVertices()
            for i in xrange(indexNum):
                mPoint = om.MPoint()
                mfnMesh.getPoint(i, mPoint, om.MSpace.kWorld)
                mPointArray.append(mPoint)

        return mPointArray

    def getSelectedIndices(self):
        """
        Get selected vertices' id
        :return: MIntArray, vertices' id array.
        """
        mSelectionList = om.MSelectionList()
        om.MGlobal.getActiveSelectionList(mSelectionList)
        mDagPath = om.MDagPath()
        component = om.MObject()
        mSelectionList.getDagPath(0, mDagPath, component)
        compFn = om.MFnSingleIndexedComponent(component)
        ids = om.MIntArray()
        compFn.getElements(ids)
        return ids

    def getMeshName(self):
        """
        Get SELECTED mesh shape name
        :return: str, mesh shape name
        """
        mSelectionList = om.MSelectionList()
        om.MGlobal.getActiveSelectionList(mSelectionList)
        mDagPath = om.MDagPath()
        mSelectionList.getDagPath(0, mDagPath)
        mDagPath.extendToShape()

        return mDagPath.fullPathName()

    def transferNormals(self):
        """
        Get Closest vertex normal and transfer to the selected vertexes
        :return: None
        """
        if self.sourceMeshName and self.sourceVertPos and self.targetMeshName and self.targetIDs and self.targetVertPos:
            for targetIndex in xrange(self.targetVertPos.length()):

                sourceMSelectionList = om.MSelectionList()
                sourceMSelectionList.add(self.sourceMeshName)
                sourceMDagPath = om.MDagPath()
                sourceMSelectionList.getDagPath(0, sourceMDagPath)
                sourceMFnMesh = om.MFnMesh(sourceMDagPath)

                # get closest normal
                closestNormal = om.MVector()
                sourceMFnMesh.getClosestNormal(self.targetVertPos[targetIndex], closestNormal, om.MSpace.kWorld)
                closestNormal.normalize()

                # set normal
                targetMSelectionList = om.MSelectionList()
                targetMSelectionList.add(self.targetMeshName)
                targetMDagPath = om.MDagPath()
                targetMSelectionList.getDagPath(0, targetMDagPath)
                targetMFnMesh = om.MFnMesh(targetMDagPath)
                targetMFnMesh.setVertexNormal(closestNormal, self.targetIDs[targetIndex], om.MSpace.kWorld)

            logger.info('Transfer Complete!')
        else:
            logger.info('Missing Information, Please Selected Again!')

    def getSourceValue(self):
        """
        Get source mesh value
        :return: None
        """
        self.sourceLineEdit.setText('')
        self.sourceMeshName = self.getMeshName()
        self.sourceLineEdit.setText(self.sourceMeshName)
        self.sourceVertPos = self.getIDsPositions(meshName=self.sourceMeshName)

    def getTargetValue(self):
        """
        Get target mesh value
        :return: None
        """
        self.targetListWidget.clear()
        self.targetMeshName = self.getMeshName()
        self.targetIDs = self.getSelectedIndices()
        for ids in self.targetIDs:
            self.targetListWidget.addItem(str(ids))

        self.targetVertPos = self.getIDsPositions(meshName=self.targetMeshName, IDs=self.targetIDs)


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
