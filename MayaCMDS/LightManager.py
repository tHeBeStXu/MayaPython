from PySide2 import QtGui, QtWidgets, QtCore
import pymel.core as pm
from functools import partial

class LightManager(QtWidgets.QDialog):

    lightTypes = {"Point Light": pm.pointLight,
                  "Spot Light": pm.spotLight,
                  "Directional Light": pm.directionalLight,
                  "Area Light": partial(pm.shadingNode, 'areaLight', asLight=1),
                  "Volume Light": partial(pm.shadingNode, 'volumeLight', asLight=1)}

    def __init__(self):
        super(LightManager, self).__init__()
        self.setWindowTitle("Lighting Manager")

        self.buildUI()

    def buildUI(self):
        layout = QtWidgets.QGridLayout(self)

        self.lightTypeCB = QtWidgets.QComboBox()

        for lightType in sorted(self.lightTypes):
            self.lightTypeCB.addItem(lightType)

        layout.addWidget(self.lightTypeCB, 0, 0)

        createBtn = QtWidgets.QPushButton('Create')
        createBtn.clicked.connect(self.createLight)
        layout.addWidget(createBtn, 0, 1)

        # New Widget
        scrollWidget = QtWidgets.QWidget()
        scrollWidget.setSizePolicy(QtWidgets.QSizePolicy.Maximum, QtWidgets.QSizePolicy.Maximum)
        self.scrollLayout = QtWidgets.QVBoxLayout(scrollWidget)

        scrollArea = QtWidgets.QScrollArea()
        scrollArea.setWidgetResizable(True)
        scrollArea.setWidget(scrollWidget)
        layout.addWidget(scrollArea, 1, 0, 1, 2)


    def createLight(self):
        lightType = self.lightTypeCB.currentText()
        func = self.lightTypes[lightType]

        light = func()
        self.addLight(light)

    def addLight(self, light):

        widget = LightWidget(light)
        self.scrollLayout.addWidget(widget)
        widget.onSolo.connect(self.onSolo)

    def onSolo(self, value):

        lightWidgets = self.findChildren(LightWidget)

        for widget in lightWidgets:
            if widget != self.sender():
                widget.disableLight(value)




class LightWidget(QtWidgets.QWidget):

    # Pyside use Signal while PyQt5 use pyqtSignal()
    onSolo = QtCore.Signal(bool)

    def __init__(self, light):
        super(LightWidget, self).__init__()
        if isinstance(light, basestring):
            light = pm.PyNode(light)

        self.light = light
        self.buildUI()

    def buildUI(self):
        layout = QtWidgets.QGridLayout(self)
        self.name = QtWidgets.QCheckBox(str(self.light.getTransform()))
        self.name.setChecked(self.light.visibility.get())
        self.name.toggled.connect(lambda val: self.light.getTransform().visibility.set(val))
        """
        lamba val: self.light.getTransform().visibility.set*(val)
        
        The up is same as below function
        
        def setLightVisibility(self, val):
            transform = self.light.getTransform()
            transform.visibility.set(val)
        """

        layout.addWidget(self.name, 0, 0)

        soloBtn = QtWidgets.QPushButton('Solo')
        soloBtn.setCheckable(True)
        soloBtn.toggled.connect(lambda val: self.onSolo.emit(val))

        layout.addWidget(soloBtn, 0, 1)

        deleteBtn = QtWidgets.QPushButton('X')
        deleteBtn.clicked.connect(self.deleteLight)
        deleteBtn.setMaximumWidth(20)
        layout.addWidget(deleteBtn, 0, 2)

        intensity = QtWidgets.QSlider(QtCore.Qt.Horizontal)
        intensity.setMinimum(1)
        intensity.setMaximum(1000)

        intensity.setValue(self.light.intensity.get())
        intensity.valueChanged.connect(lambda val: self.light.intensity.set(val))

        layout.addWidget(intensity, 1, 0, 1, 2)



    def disableLight(self, val):
        self.name.setChecked(not val)

    def deleteLight(self):
        self.setParent(None)
        self.setVisible(False)
        self.deleteLater()

        pm.delete(self.light.getTransform())


def showUI():
    """
    This shows and return the handle of the UI.
    :return: the handle of a Dialog instance.
    """
    ui = LightManager()
    ui.show()
    return ui