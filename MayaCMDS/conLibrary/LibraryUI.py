from ControllerLibrary import ControllerLibrary

from PySide2 import QtWidgets, QtGui, QtCore

class ControllerLibraryUI(QtWidgets.QDialog):

    def __init__(self):
        super(ControllerLibraryUI, self).__init__()

        self.setWindowTitle("Controller Library Window")
        self.library = ControllerLibrary()

        self.buildUI()
        self.populate()

    def buildUI(self):

        layout = QtWidgets.QVBoxLayout()

        saveWidget = QtWidgets.QWidget()
        saveLayout = QtWidgets.QHBoxLayout()
        layout.addWidget(saveWidget)

        self.saveNameField = QtWidgets.QLineEdit()
        saveLayout.addWidget(self.saveNameFielde)

        saveBtn = QtWidgets.QPushButton('Save')
        saveLayout.addWidget(saveBtn)

        self.listWidget = QtWidgets.QListWidget()
        layout.addWidget(self.listWidget)

        btnWidget = QtWidgets.QWidget()
        btnLayout = QtWidgets.QHBoxLayout(btnWidget)
        layout.addWidget(btnWidget)

        importBtn = QtWidgets.QPushButton('import!')
        btnLayout.addWidget(importBtn)

        refreshBtn = QtWidgets.QPushButton('Refresh!')
        btnLayout.addWidget(refreshBtn)

        closeBtn = QtWidgets.QPushButton('Close')
        btnLayout.addWidget(closeBtn)






    def populate(self):
        pass


def showUI():
    UI = ControllerLibraryUI()
    UI.show()
    return UI


