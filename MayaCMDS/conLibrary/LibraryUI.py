import pprint

import maya.cmds as cmds
import ControllerLibrary
reload(ControllerLibrary)
# import and refresh ControllerLibrary module
from PySide2 import QtWidgets, QtGui, QtCore

class ControllerLibraryUI(QtWidgets.QDialog):
    """
    The ControllerLibraryUI is a dialog that let us save and import controllers
    """

    def __init__(self):
        super(ControllerLibraryUI, self).__init__()

        self.setWindowTitle("Controller Library Window")

        # The library variable(attribute) points to an instance of our controller library
        self.library = ControllerLibrary.ControllerLibrary()

        # Every time we create a new instance, we will automatically build our UI and populate it
        self.buildUI()
        self.populate()

    def buildUI(self):
        """
        This method builds out the UI
        :return: None
        """
        # This is the master UI
        layout = QtWidgets.QVBoxLayout(self)
        """ 
        Because the ControllerLibraryUI class is derived from QDialog class,
        set the QVBoxLayout PARENT to self(QDialog)
        """
        # This is the child horizontal widget
        saveWidget = QtWidgets.QWidget()
        saveLayout = QtWidgets.QHBoxLayout(saveWidget)
        layout.addWidget(saveWidget)

        self.saveNameField = QtWidgets.QLineEdit()
        saveLayout.addWidget(self.saveNameField)

        saveBtn = QtWidgets.QPushButton('Save')
        saveBtn.clicked.connect(self.save)
        saveLayout.addWidget(saveBtn)

        # These are the parameters for our thumbnail size
        size = 100
        buffer = 15
        # This will create a grid list widget to display our controller thumbnails
        self.listWidget = QtWidgets.QListWidget()
        self.listWidget.setViewMode(QtWidgets.QListWidget.IconMode)
        self.listWidget.setIconSize(QtCore.QSize(size, size))
        self.listWidget.setResizeMode(QtWidgets.QListWidget.Adjust)
        self.listWidget.setGridSize(QtCore.QSize(size+buffer, size+buffer))
        layout.addWidget(self.listWidget)

        # This is our child widget that holds all the buttons
        btnWidget = QtWidgets.QWidget()
        btnLayout = QtWidgets.QHBoxLayout(btnWidget)
        layout.addWidget(btnWidget)

        importBtn = QtWidgets.QPushButton('import!')
        importBtn.clicked.connect(self.load)
        btnLayout.addWidget(importBtn)

        refreshBtn = QtWidgets.QPushButton('Refresh!')
        refreshBtn.clicked.connect(self.populate)
        btnLayout.addWidget(refreshBtn)

        closeBtn = QtWidgets.QPushButton('Close')
        closeBtn.clicked.connect(self.close)
        btnLayout.addWidget(closeBtn)

    def populate(self):
        """
        This clears the listWidget and then repopulates it with the contents in the library
        :return: None
        """
        self.listWidget.clear()

        self.library.find()


        for name, info in self.library.items():
            item = QtWidgets.QListWidgetItem(name)
            self.listWidget.addItem(item)

            screenshot = info.get('screenshot')
            if screenshot:
                icon = QtGui.QIcon(screenshot)
                item.setIcon(icon)

            item.setToolTip(pprint.pformat(info))

    def load(self):
        """
        This loads the currently selected controller
        :return: None
        """
        currentItem = self.listWidget.currentItem()

        if not currentItem:
            return

        name = currentItem.text()
        self.library.load(name)

    def save(self):
        """
        This saves the controller with the given file name
        :return: None
        """
        name = self.saveNameField.text()
        if not name.strip():
            cmds.warning("You must give a name!")
            return

        self.library.save(name)
        # refresh listWidgets
        self.populate()
        # refresh the saveNameField to empty string
        self.saveNameField.setText('')

def showUI():
    """
    This shows and returns a handle to the UI
    :return: QDialog handle to the UI
    """
    UI = ControllerLibraryUI()
    UI.show()
    return UI


