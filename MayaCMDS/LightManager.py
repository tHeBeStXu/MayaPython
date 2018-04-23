from PySide2 import QtGui, QtWidgets, QtCore
import pymel.core as pm
from functools import partial
import logging
import maya.OpenMayaUI as omui
import Qt
# www.github.com/mottosso
import json
import os
import time
# from shiboken2 import wrapInstance

logging.basicConfig()
logger = logging.getLogger('LightManager')
logger.setLevel(logging.DEBUG)
#logger.setLevel(logging.INFO)


if Qt.__binding__ == 'Pyside':
    logger.debug('Using PySide with shiboken')
    from shiboken import wrapInstance
    from Qt.QtCore import Signal
elif Qt.__binding__.startswith('PyQt'):
    logger.debug('Using PyQt with sip')
    from sip import wrapInstance as wrapInstance
    from Qt.QtCore import pyqtSignal as Signal
else:
    logger.debug('Using Pyside2 with shiboken2')
    from shiboken2 import wrapInstance
    from Qt.QtCore import Signal



def getMayaMainWindow():

    win = omui.MQtUtil_mainWindow()
    ptr = wrapInstance(long(win), QtWidgets.QMainWindow)
    return ptr


def getDock(name='LightingManagerDock'):
    deleteDock(name)
    ctrl = pm.workspaceControl(name, dockToMainWindow=('right', 1), label='Light Manager')

    qtCtrl = omui.MQtUtil_findControl(ctrl)
    ptr = wrapInstance(long(qtCtrl), QtWidgets.QWidget)
    return ptr


def deleteDock(name='LightingManagerDock'):
    if pm.workspaceControl(name, query=True, exists=True):
        pm.deleteUI(name)



class LightManager(QtWidgets.QWidget):

    lightTypes = {"Point Light": pm.pointLight,
                  "Spot Light": pm.spotLight,
                  "Directional Light": pm.directionalLight,
                  "Area Light": partial(pm.shadingNode, 'areaLight', asLight=1),
                  "Volume Light": partial(pm.shadingNode, 'volumeLight', asLight=1)}

    def __init__(self, dock=False):
        if dock:
            parent = getDock()
        else:
            deleteDock()
            try:
                pm.deleteUI('lightingManager')
            except:
                logger.debug('No previous UI exits!')

            parent = QtWidgets.QDialog(parent=getMayaMainWindow())
            parent.setObjectName('lightingManager')
            parent.setWindowTitle('Lighting Manager')
            layout = QtWidgets.QVBoxLayout(parent)

        super(LightManager, self).__init__(parent=parent)

        self.buildUI()
        self.populate()

        self.parent().layout().addWidget(self)
        if not dock:
            parent.show()

    def populate(self):
        for light in pm.ls(type=["areaLight", "spotLight", "pointLight", "directionalLight", "volumeLight"]):
            self.addLight(light)

    def refresh(self):
        """
        while self.scrollLayout.count():
            widget = self.scrollLayout.takeAt(0).widget()
            if widget:
                widget.setVisible(False)
                widget.deleteLater()
        """

        lightWidgets = self.findChildren(LightWidget)
        for widget in lightWidgets:
            if widget:
                #self.setParent(None)
                widget.setVisible(False)
                widget.deleteLater()

        self.populate()

    def buildUI(self):
        layout = QtWidgets.QGridLayout(self)

        self.lightTypeCB = QtWidgets.QComboBox()

        for lightType in sorted(self.lightTypes):
            self.lightTypeCB.addItem(lightType)

        layout.addWidget(self.lightTypeCB, 0, 0, 1, 2)

        createBtn = QtWidgets.QPushButton('Create')
        createBtn.clicked.connect(self.createLight)
        layout.addWidget(createBtn, 0, 2)

        # Scroll Widget
        scrollWidget = QtWidgets.QWidget()
        scrollWidget.setSizePolicy(QtWidgets.QSizePolicy.Maximum, QtWidgets.QSizePolicy.Maximum)
        self.scrollLayout = QtWidgets.QVBoxLayout(scrollWidget)

        scrollArea = QtWidgets.QScrollArea()
        scrollArea.setWidgetResizable(True)
        scrollArea.setWidget(scrollWidget)
        layout.addWidget(scrollArea, 1, 0, 1, 3)

        # Save Button
        saveBtn = QtWidgets.QPushButton('Save')
        saveBtn.clicked.connect(self.saveLight)
        layout.addWidget(saveBtn, 2, 0)

        # Import Button
        importBtn = QtWidgets.QPushButton('Import')
        importBtn.clicked.connect(self.importLight)
        layout.addWidget(importBtn, 2, 1)

        # Refresh Button
        refreshBtn = QtWidgets.QPushButton('Refresh')
        refreshBtn.clicked.connect(self.refresh)
        layout.addWidget(refreshBtn, 2, 2)

    def saveLight(self):
        properties = {}
        for lightWidget in self.findChildren(LightWidget):
            light = lightWidget.light
            transform = light.getTransform()

            properties[str(transform)] = {'translate': list(transform.translate.get()),
                                          'rotation': list(transform.rotate.get()),
                                          'lightType': pm.objectType(light),
                                          'intensity': light.intensity.get(),
                                          'color': light.color.get()}

        directory = self.getDirectory()

        lightFile = os.path.join(directory, 'lightFile_%s.json' % time.strftime('%m%d'))
        with open(lightFile, 'w') as f:
            json.dump(properties, f, indent=4)

        logger.info('Saving file to %s' % lightFile)

    def getDirectory(self):
        directory = os.path.join(pm.internalVar(userAppDir=True), 'lightManager')
        if not os.path.exists(directory):
            os.mkdir(directory)
        return directory

    def importLight(self):
        directory = self.getDirectory()
        fileName = QtWidgets.QFileDialog.getOpenFileName(self, "Light Browser", directory)
        with open(fileName[0], 'r') as f:
            properties = json.load(f)

        for light, info in properties.items():
            lightType = info.get('lightType')
            for lt in self.lightTypes:
                if ('%sLight' % lt.split()[0].lower()) == lightType:
                    break
            else:
                logger.info('Can not find a corresponding light type for %s (%s)' % (light, lightType))
                continue

            light = self.createLight(lightType=lt)

            light.intensity.set(info.get('intensity'))
            light.color.set(info.get('color'))

            transform = light.getTransform()
            transform.translate.set(info.get('translate'))
            transform.rotate.set(info.get('rotation'))

        self.refresh()

    def createLight(self, lightType=None, add=True):
        if not lightType:
            lightType = self.lightTypeCB.currentText()

        func = self.lightTypes[lightType]

        light = func()

        if add:
            self.addLight(light)

        return light

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
    onSolo = Signal(bool)

    def __init__(self, light):
        super(LightWidget, self).__init__()
        if isinstance(light, basestring):
            light = pm.PyNode(light)
        if isinstance(light, pm.nodetypes.Transform):
            light = light.getShape()

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

        self.colorBtn = QtWidgets.QPushButton()
        self.colorBtn.setMaximumWidth(20)
        self.colorBtn.setMaximumHeight(20)
        self.setButtonColor()
        self.colorBtn.clicked.connect(self.setColor)
        layout.addWidget(self.colorBtn, 1, 2)

    def setButtonColor(self, color=None):
        if not color:
            color = self.light.color.get()

        assert len(color) == 3, "You must provide a list of 3 colors"

        r, g, b = [c*255 for c in color]

        self.colorBtn.setStyleSheet('background-color: rgba(%s, %s, %s, 1.0)' % (r, g, b))

    def setColor(self):
        lightColor = self.light.color.get()
        color = pm.colorEditor(rgbValue=lightColor)

        r, g, b, a = [float(c) for c in color.split()]

        color = (r, g, b)

        self.light.color.set(color)

        self.setButtonColor(color)

    def disableLight(self, val):
        self.name.setChecked(not val)

    def deleteLight(self):
        self.setParent(None)
        self.setVisible(False)
        self.deleteLater()

        pm.delete(self.light.getTransform())


