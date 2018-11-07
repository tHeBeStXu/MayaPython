from PySide2 import QtWidgets, QtGui, QtCore
from shiboken2 import wrapInstance
import maya.OpenMayaUI as omui
import maya.cmds as cmds
import logging
from ..rigLib import lib
from functools import partial

reload(lib)

logging.basicConfig()
logger = logging.getLogger('nCloth2JointRigTool')
logger.setLevel(logging.DEBUG)


def getMayaWindow():
    """
    get the mayaMainWindow as parent
    :return: mayaMainWindow Ptr
    """
    ptr = omui.MQtUtil.mainWindow()
    return wrapInstance(long(ptr), QtWidgets.QMainWindow)

class MainUI(QtWidgets.QDialog):
    def __init__(self):
        try:
            cmds.deleteUI('nCloth2JointRigTool')
        except:
            logger.info('No previous UI exists!')

        super(MainUI, self).__init__(parent=getMayaWindow())

        self.setModal(False)
        self.setObjectName('nCloth2JointRigTool')
        self.setWindowTitle('nCloth To Joints')

        self.buildUI()
        self.show()

    def buildUI(self):
        """
        Build the Main UI
        :return: None
        """
        self.setFixedSize(380, 480)
        self.mainLayout = QtWidgets.QVBoxLayout()
