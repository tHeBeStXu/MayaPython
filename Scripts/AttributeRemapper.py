from functools import partial
import maya.OpenMayaUI as omui
from shiboken2 import wrapInstance
import maya.cmds as cmds
from PySide2 import QtWidgets
import logging

logging.basicConfig()
logger = logging.getLogger('AttributeRemaper')
logger.setLevel(logging.INFO)


def getMayaMainWindow():
    ptr = omui.MQtUtil.mainWindow()
    return wrapInstance(long(ptr), QtWidgets.QMainWindow)


class MainUI(QtWidgets.QDialog):
    def __init__(self):
        try:
            cmds.deleteUI('AttributeRemapper')
        except:
            logger.info('No previous UI exists!')

        super(MainUI, self).__init__(parent=getMayaMainWindow())

        self.setModal(False)

        self.setObjectName('AttributeRemapper')
        self.setWindowTitle('Attribute Remapper   (tHeBeStXu)')

        # build UI
        self.buildUI()

        # modify UI
        self.modifyUI()

        # show UI
        self.show()

    def buildUI(self):
        """
        Build UI
        :return: None
        """
        self.setFixedSize(500, 300)

        self.mainLayout = QtWidgets.QGridLayout()
        self.setLayout(self.mainLayout)

        self.sourceLabel = QtWidgets.QLabel('Source:')
        self.targetLabel = QtWidgets.QLabel('Target:')

        self.sourceLineEdit = QtWidgets.QLineEdit()
        self.targetLineEdit = QtWidgets.QLineEdit()
        self.sourceBtn = QtWidgets.QPushButton('<<<')
        self.targetBtn = QtWidgets.QPushButton('<<<')

        self.sourceAttrListWidget = QtWidgets.QListWidget()
        self.targetAttrListWidget = QtWidgets.QListWidget()
        self.transferLabel = QtWidgets.QLabel('------------->')

        self.invertAttrCheckBox = QtWidgets.QCheckBox(' * (-1) = ')
        self.transferAttrBtn = QtWidgets.QPushButton('Transfer Attribute!')

        self.mainLayout.addWidget(self.sourceLabel, 0, 0, 1, 3)
        self.mainLayout.addWidget(self.targetLabel, 0, 4, 1, 3)

        self.mainLayout.addWidget(self.sourceLineEdit, 1, 0, 1, 2)
        self.mainLayout.addWidget(self.sourceBtn, 1, 2, 1, 1)
        self.mainLayout.addWidget(self.targetLineEdit, 1, 4, 1, 2)
        self.mainLayout.addWidget(self.targetBtn, 1, 6, 1, 1)

        self.mainLayout.addWidget(self.sourceAttrListWidget, 2, 0, 4, 3)
        self.mainLayout.addWidget(self.invertAttrCheckBox, 3, 3, 1, 1)
        self.mainLayout.addWidget(self.transferLabel, 4, 3, 1, 1)
        self.mainLayout.addWidget(self.targetAttrListWidget, 2, 4, 4, 3)

        self.mainLayout.addWidget(self.transferAttrBtn, 6, 2, 1, 4)

    def modifyUI(self):
        """
        Modify UI
        :return: None
        """
        self.sourceBtn.clicked.connect(partial(self.selectObj, self.sourceLineEdit, self.sourceAttrListWidget))
        self.targetBtn.clicked.connect(partial(self.selectObj, self.targetLineEdit, self.targetAttrListWidget))

        self.transferAttrBtn.clicked.connect(self.remapAttribute)

    def listValidAttribute(self, lineEdit, listWidget):
        """
        List all valid attributes and add them to specified listwidget
        :param lineEdit:
        :param listWidget:
        :return: None
        """
        attrList = cmds.listAttr(lineEdit.text(), k=1, v=1)

        if attrList:
            for attr in attrList:
                item = QtWidgets.QListWidgetItem(str(attr))
                listWidget.addItem(item)

    def selectObj(self, lineEdit, listWidget):
        """
        Set current selected object and list its valid attribute
        :param lineEdit:
        :param listWidget:
        :return: None
        """
        selectObjsList = cmds.ls(sl=1)

        selectObj = selectObjsList[0]

        if selectObj:
            # clear lineEdit
            lineEdit.clear()
            # set text
            lineEdit.setText(str(selectObj))
            # clear listwidget
            listWidget.clear()
            # list attributes list widget
            self.listValidAttribute(lineEdit, listWidget)

        else:
            logger.info('Please Re-Select Object!')

    def remapAttribute(self):
        """
        Transfer Attributes
        :return:
        """
        sourceAttr = None
        targetAttr = None

        sourceObject = self.sourceLineEdit.text()
        if self.sourceAttrListWidget.currentItem():
            sourceAttr = self.sourceAttrListWidget.currentItem().text()

        targetObject = self.targetLineEdit.text()
        if self.targetAttrListWidget.currentItem():
            targetAttr = self.targetAttrListWidget.currentItem().text()


        # invert attr
        invertAttr = -1
        if not self.invertAttrCheckBox.isChecked():
            invertAttr = 1

        if sourceObject and sourceAttr and targetObject and targetAttr:

            # get start and end frame
            startFrame = cmds.playbackOptions(q=1, minTime=1)
            endFrame = cmds.playbackOptions(q=1, maxTime=1)

            logger.info('Start Transfer %s.%s to %s.%s' % (sourceObject, sourceAttr, targetObject, targetAttr))
            # set keys
            for i in xrange(int(endFrame - startFrame + 1)):
                sourceAttrVal = cmds.getAttr(sourceObject + '.' + sourceAttr, time=startFrame + i)

                cmds.setKeyframe(targetObject, at=targetAttr, v=invertAttr * sourceAttrVal, time=(startFrame + i))
            logger.info('Transfer Attribute Finished!')
        else:
            logger.info('Please Select Valid Objects and Attributes!')
