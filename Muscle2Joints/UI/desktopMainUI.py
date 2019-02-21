import sys
import os
import datetime
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

        self.mainWidget = QtWidgets.QWidget()
        self.mainWidgetLayout = QtWidgets.QFormLayout()
        self.mainWidget.setLayout(self.mainWidgetLayout)
        self.setCentralWidget(self.mainWidget)

        self.importBtn = QtWidgets.QPushButton('Import Data...')
        self.buildBtn = QtWidgets.QPushButton('Build Joints and Skin...')

        self.progressBar = QtWidgets.QProgressBar()
        progressBarStyle = """QProgressBar{text-align: center;}"""
        self.progressBar.setStyleSheet(progressBarStyle)
        self.progressBar.setValue(0)

        self.textEditLine = QtWidgets.QTextEdit()
        self.textEditLine.setReadOnly(True)
        self.textEditLine.setFixedHeight(145)

        self.mainWidgetLayout.addRow(Splitter(text='Import Data'))
        self.mainWidgetLayout.addRow(self.importBtn)
        self.mainWidgetLayout.addRow(Splitter(text='Data General View'))
        self.mainWidgetLayout.addRow(self.textEditLine)
        self.mainWidgetLayout.addRow(Splitter(text='Build Data'))
        self.mainWidgetLayout.addRow(self.buildBtn)
        self.mainWidgetLayout.addRow(Splitter())
        self.mainWidgetLayout.addRow(self.progressBar)
        self.mainWidgetLayout.addRow(Splitter())

        self.importBtn.clicked.connect(self.importData)
        self.buildBtn.clicked.connect(self.buildData)

        self.setGeometry(700, 350, 380, 320)
        self.setFixedSize(380, 350)
        self.setWindowTitle('Muscle2Joints Builder')

        self.recordStatusAndTime('Initialized Finished!')

    def importData(self):
        self.recordStatusAndTime('Import Data...')

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

            numVertexStr = "Num Vertex: %s \n" % len(self.data['vertexTransBindPose'].keys())
            primaryJntsStr = "Num Primary Joints: %s \n" % len(self.data['primaryJntsBindPose'].keys())
            vertexWorldStr = "Num Vertex Trans: %s \n" % len(self.data['vertexWorldTransAtDiffPoses'].keys())
            primaryJntsWorldStr = "Num Primary Joints Trans: %s \n" % len(self.data['primaryJntsWorldTransAtDiffPoses'].keys())
            text = numVertexStr + primaryJntsStr + vertexWorldStr + primaryJntsWorldStr
            self.textEditLine.append(text)

            self.textEditLine.append(fileName[0] + '\n')

            self.recordStatusAndTime('Data Imported Successfully!')
        else:
            self.recordStatusAndTime('No Data Imported')

    def buildData(self):

        if self.data:
            self.recordStatusAndTime('Build Data...')
        else:
            self.recordStatusAndTime('No data exists, please check again!')

    def recordStatusAndTime(self, text):
        self.textEditLine.append(text)
        self.textEditLine.append('### %s ### \n' % datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"))


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


if __name__ == '__main__':
    app = QtWidgets.QApplication(sys.argv)
    UI = MainUI()
    sys.exit(app.exec_())
