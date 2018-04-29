"""
QMainWindow: just like Maya Main Window
QDialog: Pop up small dialog Window
QWidget: QWidget is any object that has its own functionality to it. For example, Button, Laybel, Dialog
QLayout: Qlayout is purely responsible for spline the QWidgets it contains, it decides on the position and size base on
         a couple of rules.
"""
from functools import partial

from PySide2 import QtCore, QtGui, QtWidgets


class simpleUI(QtWidgets.QDialog):

    def __init__(self):
        super(simpleUI, self).__init__()

        self.buildUI()

    def buildUI(self):

        self.setWindowTitle('Simple UI')
        # show window all the top
        self.setWindowFlags(QtCore.Qt.WindowStaysOnTopHint)
        # whether you can active the backgroud window or not
        self.setModal(False)
        self.setMaximumHeight(300)
        self.setMaximumWidth(500)

        # box layout
        """
        HBLayout = QtWidgets.QHBoxLayout(self)

        bttn_1 = QtWidgets.QPushButton('Button 1')
        bttn_2 = QtWidgets.QPushButton('Button 2')
        bttn_3 = QtWidgets.QPushButton('Button 3')
        bttn_4 = QtWidgets.QPushButton('Button 4')
        bttn_5 = QtWidgets.QPushButton('Button 5')

        HBLayout.addWidget(bttn_1)
        HBLayout.addWidget(bttn_2)
        HBLayout.addWidget(bttn_3)
        HBLayout.addWidget(bttn_4)
        HBLayout.addWidget(bttn_5)
        """

        # form layout
        """
        FormLayout = QtWidgets.QFormLayout(self)
        #self.setLayout(QtWidgets.QFormLayout(self))

        name_le = QtWidgets.QLineEdit()
        email_le = QtWidgets.QLineEdit()
        age_le = QtWidgets.QSpinBox()

        FormLayout.addRow("Name:", name_le)
        FormLayout.addRow("Email:", email_le)
        FormLayout.addRow("Age:", age_le)
        """

        # Grid layout
        """
        gridLayout = QtWidgets.QGridLayout(self)

        font_name_lb = QtWidgets.QLabel('Font')
        font_style_lb = QtWidgets.QLabel('Font Style')
        font_size_lb = QtWidgets.QLabel('Size')

        font_name_list = QtWidgets.QListWidget()
        font_name_list.addItem('Times')
        font_name_list.addItem('Helvetica')
        font_name_list.addItem('Courier')
        font_name_list.addItem('Palatino')
        font_name_list.addItem('Gill Sans')

        font_style_list = QtWidgets.QListWidget()
        font_style_list.addItem('Roman')
        font_style_list.addItem('Italic')
        font_style_list.addItem('Oblique')

        font_size_list = QtWidgets.QListWidget()
        for index in range(10, 30, 2):
            font_size_list.addItem(str(index))

        gridLayout.addWidget(font_name_lb, 0, 0)
        gridLayout.addWidget(font_name_list, 1, 0)

        gridLayout.addWidget(font_size_lb, 0, 2)
        gridLayout.addWidget(font_size_list, 1, 2)

        gridLayout.addWidget(font_style_lb, 0, 1)
        gridLayout.addWidget(font_style_list, 1, 1)
        """

        self.vBoxLayout = QtWidgets.QVBoxLayout(self)

        self.stackedLayout = QtWidgets.QStackedLayout()

        self.vBoxLayout.addLayout(self.stackedLayout)

        buttonLayout = QtWidgets.QHBoxLayout()

        layoutBtn_1 = QtWidgets.QPushButton('Layout_1')
        layoutBtn_2 = QtWidgets.QPushButton('Layout_2')
        layoutBtn_3 = QtWidgets.QPushButton('Layout_3')
        layoutBtn_4 = QtWidgets.QPushButton('Layout_4')

        buttonLayout.addWidget(layoutBtn_1)
        buttonLayout.addWidget(layoutBtn_2)
        buttonLayout.addWidget(layoutBtn_3)
        buttonLayout.addWidget(layoutBtn_4)

        self.vBoxLayout.addLayout(buttonLayout)

        # Horizontal box layout
        hBoxWidget = QtWidgets.QWidget()
        hBoxWidget.setLayout(QtWidgets.QHBoxLayout())

        bttn_1 = QtWidgets.QPushButton('Button 1')
        bttn_2 = QtWidgets.QPushButton('Button 2')
        bttn_3 = QtWidgets.QPushButton('Button 3')
        bttn_4 = QtWidgets.QPushButton('Button 4')
        bttn_5 = QtWidgets.QPushButton('Button 5')

        hBoxWidget.layout().addWidget(bttn_1)
        hBoxWidget.layout().addWidget(bttn_2)
        hBoxWidget.layout().addWidget(bttn_3)
        hBoxWidget.layout().addWidget(bttn_4)
        hBoxWidget.layout().addWidget(bttn_5)

        # Vertical box layout
        vBoxWidget = QtWidgets.QWidget()
        vBoxWidget.setLayout(QtWidgets.QVBoxLayout())

        bttn_1 = QtWidgets.QPushButton('Button 1')
        bttn_2 = QtWidgets.QPushButton('Button 2')
        bttn_3 = QtWidgets.QPushButton('Button 3')
        bttn_4 = QtWidgets.QPushButton('Button 4')
        bttn_5 = QtWidgets.QPushButton('Button 5')

        vBoxWidget.layout().addWidget(bttn_1)
        vBoxWidget.layout().addWidget(bttn_2)
        vBoxWidget.layout().addWidget(bttn_3)
        vBoxWidget.layout().addWidget(bttn_4)
        vBoxWidget.layout().addWidget(bttn_5)

        # form layout
        formWidget = QtWidgets.QWidget()
        formWidget.setLayout(QtWidgets.QFormLayout())

        name_le = QtWidgets.QLineEdit()
        email_le = QtWidgets.QLineEdit()
        age_le = QtWidgets.QSpinBox()

        formWidget.layout().addRow("Name:", name_le)
        formWidget.layout().addRow("Email:", email_le)
        formWidget.layout().addRow("Age:", age_le)

        # Grid layout
        gridWidget = QtWidgets.QWidget()
        gridWidget.setLayout(QtWidgets.QGridLayout())

        font_name_lb = QtWidgets.QLabel('Font')
        font_style_lb = QtWidgets.QLabel('Font Style')
        font_size_lb = QtWidgets.QLabel('Size')

        font_name_list = QtWidgets.QListWidget()
        font_name_list.addItem('Times')
        font_name_list.addItem('Helvetica')
        font_name_list.addItem('Courier')
        font_name_list.addItem('Palatino')
        font_name_list.addItem('Gill Sans')

        font_style_list = QtWidgets.QListWidget()
        font_style_list.addItem('Roman')
        font_style_list.addItem('Italic')
        font_style_list.addItem('Oblique')

        font_size_list = QtWidgets.QListWidget()
        for index in range(10, 30, 2):
            font_size_list.addItem(str(index))

        gridWidget.layout().addWidget(font_name_lb, 0, 0)
        gridWidget.layout().addWidget(font_name_list, 1, 0)

        gridWidget.layout().addWidget(font_size_lb, 0, 2)
        gridWidget.layout().addWidget(font_size_list, 1, 2)

        gridWidget.layout().addWidget(font_style_lb, 0, 1)
        gridWidget.layout().addWidget(font_style_list, 1, 1)

        """add the different widget to the stacked layout"""
        self.stackedLayout.addWidget(hBoxWidget)    # index = 0
        self.stackedLayout.addWidget(vBoxWidget)    # index = 1
        self.stackedLayout.addWidget(formWidget)    # index = 2
        self.stackedLayout.addWidget(gridWidget)    # index = 3

        """Connect the layoutButton to the stackedLayout's index"""

        layoutBtn_1.clicked.connect(partial(self.stackedLayout.setCurrentIndex, 0))
        layoutBtn_2.clicked.connect(partial(self.stackedLayout.setCurrentIndex, 1))
        layoutBtn_3.clicked.connect(partial(self.stackedLayout.setCurrentIndex, 2))
        layoutBtn_4.clicked.connect(partial(self.stackedLayout.setCurrentIndex, 3))










