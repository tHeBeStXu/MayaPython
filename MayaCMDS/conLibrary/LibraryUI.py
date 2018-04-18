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
        pass

    def populate(self):
        pass


def showUI():
    UI = ControllerLibraryUI()
    UI.show()
    return UI


