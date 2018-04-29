"""
Standard Widgets: QFont, QLineEdit, QTextEdit, QPushButton, QRadioButton, QButtonGroup, QCheckBox
Signal, Slots and Connection.
"""
from PySide2 import QtCore, QtGui, QtWidgets

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
        self.textLayout = QtWidgets.QHBoxLayout()
        self.textLayout.setContentsMargins(5, 5, 5, 5)
        self.textLayout.setSpacing(0)

        self.layout().addLayout(self.textLayout)


        """QLabel"""
        example_lb = QtWidgets.QLabel('Title: ')
        # example_lb.setText('Foo')
        boldFont = QtGui.QFont()
        boldFont.setBold(1)
        example_lb.setFont(boldFont)

        """QLineEdit"""
        example_le = QtWidgets.QLineEdit()
        example_le.setPlaceholderText("Type Something....")
        # QLineEdit just could input text a-z, A-Z and "_"
        reg_ex = QtCore.QRegExp("[a-zA-Z_]+")
        textValidator = QtGui.QRegExpValidator(reg_ex, example_le)
        example_le.setValidator(textValidator)

        """QTextEdit"""
        self.example_te = QtWidgets.QTextEdit()
        # Auto wrap shut off
        # self.example_te.setWordWrapMode(QtGui.QTextOption.NoWrap)

        # Auto wrap with complete words
        # self.example_te.setWordWrapMode(QtGui.QTextOption.WordWrap)

        # Auto wrap anywhere whenever word long
        # self.example_te.setWordWrapMode(QtGui.QTextOption.WrapAnywhere)

        # Default wrap model
        self.example_te.setWordWrapMode(QtGui.QTextOption.WrapAtWordBoundaryOrAnywhere)

        self.textLayout.addWidget(example_lb)
        self.textLayout.addWidget(example_le)
        self.textLayout.addWidget(self.example_te)

        # button layout
        buttonLayout = QtWidgets.QHBoxLayout()
        buttonLayout.setSpacing(5)
        self.layout().addLayout(buttonLayout)

        """QPushButton"""
        example_bttn = QtWidgets.QPushButton('Button')

        buttonLayout.addWidget(example_bttn)

        """QRadioButton"""
        radioBttn1 = QtWidgets.QRadioButton('a')
        radioBttn2 = QtWidgets.QRadioButton('b')
        radioBttn3 = QtWidgets.QRadioButton('c')
        radioBttn4 = QtWidgets.QRadioButton('d')

        radioBttn1.setChecked(1)
        # Use the QButtonGroup to group the radio button with group ranged exclusive.(i.e. radioBttn1 ON, radioBttn2 OFF)
        radioButtonGrp1 = QtWidgets.QButtonGroup(self)
        radioButtonGrp2 = QtWidgets.QButtonGroup(self)

        radioButtonGrp1.addButton(radioBttn1)
        radioButtonGrp1.addButton(radioBttn2)

        radioButtonGrp2.addButton(radioBttn3)
        radioButtonGrp2.addButton(radioBttn4)


        buttonLayout.addWidget(radioBttn1)
        buttonLayout.addWidget(radioBttn2)
        buttonLayout.addWidget(radioBttn3)
        buttonLayout.addWidget(radioBttn4)

        """QCheckBox"""
        self.example_checkBox = QtWidgets.QCheckBox('Check Out')
        buttonLayout.addWidget(self.example_checkBox)

        # slot & slider layout
        slot_sliderLayout = QtWidgets.QHBoxLayout()
        slot_sliderLayout.setSpacing(5)
        self.layout().addLayout(slot_sliderLayout)

        """SIGNAL AND SLOT"""
        example_slider = QtWidgets.QSlider()
        example_slider.setOrientation(QtCore.Qt.Horizontal)
        example_slider.setRange(0, 10)

        example_spin = QtWidgets.QSpinBox()
        example_spin.setRange(0, 10)

        slot_sliderLayout.addWidget(example_slider)
        slot_sliderLayout.addWidget(example_spin)

        # Connect the Signal and Slot method 1
        # self.connect(example_slider, QtCore.SIGNAL('valueChanged(int)'), example_spin.setValue)
        # self.connect(example_spin, QtCore.SIGNAL('valueChanged(int)'), example_slider.setValue)

        # Connect the Signal and Slot method 2  ##### BETTER  #####
        example_slider.valueChanged.connect(example_spin.setValue)
        example_spin.valueChanged.connect(example_slider.setValue)

        example_bttn.clicked.connect(self.printText)

        self.example_checkBox.stateChanged.connect(example_bttn.setDisabled)
        # When SIGNAL buttonClicked emits, the buttonGrp also returns the clicked button index (i.e. button instance)
        radioButtonGrp1.buttonClicked.connect(self.addToTextEdit)



    def printText(self):

        print self.example_te.toPlainText()

    def addToTextEdit(self, buttonName):
        buttonText = buttonName.text()
        self.example_te.setText(str(self.example_te.toPlainText()) + str(buttonText))











