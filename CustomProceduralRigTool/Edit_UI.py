import Main_UI
reload(Main_UI)
from PySide2 import QtCore, QtWidgets
import pymel.core as pm
from functools import partial
import logging
logging.basicConfig()
logger = logging.getLogger('EditUI')
logger.setLevel(logging.DEBUG)


class EditUI(QtWidgets.QWidget):
    def __init__(self, instance):
        try:
            pm.deleteUI('EditUI')
        except:
            logger.debug('No Editing UI exists!')

        parent = QtWidgets.QDialog(parent=Main_UI.getMayaMainWindow())
        parent.setObjectName('EditUI')
        parent.setWindowTitle('Editing UI')
        super(EditUI, self).__init__(parent=parent)

        self.buildUI()

        self.specifiedInstance = instance
        self.rigArguments = {}
        self.instance2Parent = None

        layout = QtWidgets.QVBoxLayout()
        self.parent().setLayout(layout)
        self.parent().layout().addWidget(self)

        self.parent().show()

    def buildUI(self):

        layout = QtWidgets.QVBoxLayout(self)

        formWidget = QtWidgets.QWidget()
        self.formlayout = QtWidgets.QFormLayout(formWidget)
        layout.addWidget(formWidget)

        self.name_LE = QtWidgets.QLineEdit()
        self.text_LE = QtWidgets.QLineEdit()
        self.test_LE = QtWidgets.QLineEdit()

        self.formlayout.addRow("Name:", self.name_LE)
        self.formlayout.addRow("Text:", self.text_LE)
        self.formlayout.addRow("Test:", self.test_LE)

        btnWidget = QtWidgets.QWidget()
        btnLayout = QtWidgets.QHBoxLayout(btnWidget)
        layout.addWidget(btnWidget)

        cancel_Btn = QtWidgets.QPushButton('Cancel')
        OK_Btn = QtWidgets.QPushButton('OK')

        btnLayout.addWidget(cancel_Btn)
        btnLayout.addWidget(OK_Btn)

        OK_Btn.clicked.connect(self.setData)

    def setData(self):
        print self.specifiedInstance
        self.specifiedInstance.rigArgs['name'] = self.name_LE.text()
        self.specifiedInstance.rigArgs['text'] = self.text_LE.text()
        self.specifiedInstance.rigArgs['test'] = self.test_LE.text()

        self.parent().close()

