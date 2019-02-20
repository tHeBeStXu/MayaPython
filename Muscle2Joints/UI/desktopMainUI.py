import sys
import os
from PyQt5 import QtWidgets, QtCore, QtGui, Qt
import pickle

from PyQt5.QtWidgets import qApp


class MainUI(QtWidgets.QMainWindow):
    def __init__(self):
        super(MainUI, self).__init__()

        # Directories
        self.currentDir = os.path.abspath(os.path.dirname(__file__))
        self.rootDir = os.path.abspath(os.path.join(self.currentDir, os.path.pardir))
        self.rootDir = self.rootDir.replace('\\', '/')

        self.dataDir = '%s/Data' % self.rootDir

        self.data = None

        # Build UI
        self.buildUI()
        self.show()

    def buildUI(self):
        # status bar
        self.statusBar()

        self.mainWidget = QtWidgets.QWidget()
        self.mainWidgetLayout = QtWidgets.QVBoxLayout()
        self.mainWidget.setLayout(self.mainWidgetLayout)
        self.setCentralWidget(self.mainWidget)

        self.importBtn = QtWidgets.QPushButton('Import...')
        self.buildBtn = QtWidgets.QPushButton('Build...')
        self.mainWidgetLayout.addWidget(self.importBtn)
        self.mainWidgetLayout.addWidget(self.buildBtn)

        self.importBtn.clicked.connect(self.importData)
        self.buildBtn.clicked.connect(self.buildData)

        self.setGeometry(700, 350, 500, 450)
        self.setMinimumSize(600, 600)
        self.setWindowTitle('Build Helper Joints')

    def importData(self):
        kFileExtension = '.data'
        fileName = QtWidgets.QFileDialog.getOpenFileName(self,
                                                         'Import Data', self.dataDir,
                                                         filter='Input Data(*%s)' % kFileExtension)
        if fileName[0]:
            fileHandle = open(fileName[0], 'rb')
            self.data = pickle.load(fileHandle)
            fileHandle.close()

        if self.data:
            # keys
            # 'vertexTransBindPose'
            # 'primaryJntsBindPose'
            # 'vertexWorldTransAtDiffPoses'
            # 'primaryJntsWorldTransAtDiffPoses'
            print 'data is valid'

        self.statusBar().showMessage('Import Data...')

    def buildData(self):
        print 'Build Data...'
        self.statusBar().showMessage('Build Data...')


if __name__ == '__main__':
    app = QtWidgets.QApplication(sys.argv)
    UI = MainUI()
    sys.exit(app.exec_())
