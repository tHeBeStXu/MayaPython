from PySide2 import QtWidgets, QtCore, QtGui

from functools import partial

class simpleUI(QtWidgets.QDialog):
    def __init__(self):
        super(simpleUI, self).__init__()
        self.buildUI()

    def buildUI(self):
        self.setWindowTitle('Simple UI')
        self.setWindowFlags(QtCore.Qt.WindowStaysOnTopHint)
        self.setModal(0)
        self.setMinimumWidth(300)
        self.setFixedHeight(250)
        vBoxLayout = QtWidgets.QVBoxLayout()
        self.setLayout(vBoxLayout)

        # adjust the margin between each widget
        vBoxLayout.setContentsMargins(0, 0, 0, 0)

        # add 3 frames to the layout
        """QFrame: just like a QtWidget"""

        topFrame = QtWidgets.QFrame()
        topFrame.setFrameStyle(QtWidgets.QFrame.Panel | QtWidgets.QFrame.Raised)

        middleFrame = QtWidgets.QFrame()
        middleFrame.setFrameStyle(QtWidgets.QFrame.Panel | QtWidgets.QFrame.Raised)

        bottomFrame = QtWidgets.QFrame()
        bottomFrame.setFrameStyle(QtWidgets.QFrame.Panel | QtWidgets.QFrame.Raised)

        vBoxLayout.addWidget(topFrame)
        vBoxLayout.addWidget(middleFrame)
        vBoxLayout.addWidget(bottomFrame)

        # adjust middle frame
        middleFrame.setLayout(QtWidgets.QHBoxLayout())
        middleFrame.layout().setContentsMargins(0, 0, 0, 0)
        # set the spacing between buttons in layout
        middleFrame.layout().setSpacing(0)
        # set the buttons Alignment
        middleFrame.layout().setAlignment(QtCore.Qt.AlignTop)

        middleFrame.setSizePolicy(QtWidgets.QSizePolicy.Maximum, QtWidgets.QSizePolicy.Maximum)
        # middleFrame.setSizePolicy(QtWidgets.QSizePolicy.Minimum, QtWidgets.QSizePolicy.Maximum)

        bttn_1 = QtWidgets.QPushButton('1')
        bttn_2 = QtWidgets.QPushButton('2')
        bttn_3 = QtWidgets.QPushButton('3')
        bttn_4 = QtWidgets.QPushButton('4')
        bttn_5 = QtWidgets.QPushButton('5')

        middleFrame.layout().addWidget(bttn_1)
        middleFrame.layout().addWidget(bttn_2)
        middleFrame.layout().addWidget(bttn_3)
        middleFrame.layout().addWidget(bttn_4)
        middleFrame.layout().addWidget(bttn_5)


