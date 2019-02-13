import sys
from PyQt5 import QtWidgets, QtCore, QtGui, Qt

from PyQt5.QtWidgets import qApp


class MainUI(QtWidgets.QMainWindow):
    def __init__(self):
        super(MainUI, self).__init__()

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
        print 'Import Data...'
        self.statusBar().showMessage('Import Data...')

    def buildData(self):
        print 'Build Data...'
        self.statusBar().showMessage('Build Data...')


if __name__ == '__main__':
    app = QtWidgets.QApplication(sys.argv)
    UI = MainUI()
    sys.exit(app.exec_())
