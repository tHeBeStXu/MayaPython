import maya.cmds as cmds


class MainUI():
    def __init__(self):

        self.buildUI()

    def buildUI(self):
        if cmds.window('FBXExporter_window', exists=1):
            cmds.deleteUI('FBXExporter_window')

        self.mainWindow = cmds.window('FBXExporter_window', s=1, width=700, height=500, menuBar=1, title='FBX Exporter')

        # Menu bar
        self.editMenu = cmds.menu(label='Edit')
        cmds.menuItem(parent=self.editMenu, label='Save Settings')
        cmds.menuItem(parent=self.editMenu, label='Reset Settings')

        self.helpMenu = cmds.menu(label='Help')
        cmds.menuItem(parent=self.helpMenu, label='Help on Animation Export')
        cmds.menuItem(parent=self.helpMenu, label='Help on Export')

        # tab layout
        self.formLayout = cmds.formLayout()
        self.tabLayout = cmds.tabLayout(innerMarginWidth=5, innerMarginHeight=5)
        cmds.formLayout(self.formLayout, edit=1, attachForm=((self.tabLayout, 'top', 0),
                                                             (self.tabLayout, 'left', 0),
                                                             (self.tabLayout, 'right', 0),
                                                             (self.tabLayout, 'bottom', 0)))

        # create animation UI elements
        self.animationFrameLayout = cmds.frameLayout(collapsable=0, label='', borderVisible=0, parent=self.tabLayout)
        self.animationFormLayout = cmds.formLayout(numberOfDivisions=100, parent=self.animationFrameLayout)

        self.animActorsTextScrollList = cmds.textScrollList(width=250, height=325, numberOfRows=18,
                                                            allowMultiSelection=0, parent=self.animationFormLayout)
        self.animExportNodesTextScrollList = cmds.textScrollList(width=250, height=325, numberOfRows=18,
                                                                 allowMultiSelection=0, parent=self.animationFormLayout)

        self.animNewNodeBtn = cmds.button(width=250, height=50, label='New Export Node', parent=self.animationFormLayout)
        self.animExportCheckBoxGrp = cmds.checkBoxGrp(numberOfCheckBoxes=1, label='Export', columnWidth2=[85, 70],
                                                      enable=0, parent=self.animationFormLayout)

        self.animZeroOriginCheckBoxGrp = cmds.checkBoxGrp(numberOfCheckBoxes=1, label='Move to Origin',
                                                          columnWidth2=[85, 80], enable=0,
                                                          parent=self.animationFormLayout)
        self.animZeroOriginMotionCheckBoxGrp = cmds.checkBoxGrp(numberOfCheckBoxes=1, label='Zero Motion on Origin',
                                                                columnWidth2=[120, 70], enable=0,
                                                                parent=self.animationFormLayout)
        self.animSubRangeCheckBoxGrp = cmds.checkBoxGrp(numberOfCheckBoxes=1, label='Use Sub Range',
                                                        columnWidth2=[85, 70], enable=0, parent=self.animationFormLayout)
        self.animStartFrameFloatFieldGrp = cmds.floatFieldGrp(numberOfFields=1, label='Start Frame',
                                                              columnWidth2=[75, 70], enable=0, value1=0.0,
                                                              parent=self.animationFormLayout)
        self.animEndFrameFloatFieldGrp = cmds.floatFieldGrp(numberOfFields=1, label='End Frame', columnWidth2=[75, 70],
                                                            enable=0, value1=1.0, parent=self.animationFormLayout)
        self.animExportFileNameTextFieldButtonGrp = cmds.textFieldButtonGrp(label='Export File Name',
                                                                            columnWidth3=[100, 300, 30], enable=0, text='',
                                                                            buttonLabel='Browse...',
                                                                            parent=self.animationFormLayout)
        self.animRecordAnimLayersBtn = cmds.button(width=150, height=50, label='Record Anim Layers', enable=0,
                                                   backgroundColor=[1, 0.25, 0.25], parent=self.animationFormLayout)
        self.animPreviewAnimLayersBtn = cmds.button(width=250, height=50, label='Preview Anim Layers', enable=0,
                                                    parent=self.animationFormLayout)
        self.animClearAnimLayersBtn = cmds.button(width=250, height=50, label='Clear Anim Layers', enable=0,
                                                  parent=self.animationFormLayout)
        self.animActorText = cmds.text(label='Actors', parent=self.animationFormLayout)
        self.animExportNodesText = cmds.text(label='Export Nodes', parent=self.animationFormLayout)
        self.animExportSelectedAnimationBtn = cmds.button(width=300, height=50, label='Export Selected Animation',
                                                          parent=self.animationFormLayout)
        self.animAllAnimationForSelectedCharacterBtn = cmds.button(width=300, height=50,
                                                                   label='Export All Animation for Selected Character',
                                                                   parent=self.animationFormLayout)
        self.animAllAnimationBtn = cmds.button(width=300, height=50, label='Export All Animations',
                                               parent=self.animationFormLayout)





        # create model UI elements
        self.modelFrameLayout = cmds.frameLayout(collapsable=0, label='', borderVisible=0, parent=self.tabLayout)
        self.modelFromLayout = cmds.formLayout(numberOfDivisions=100, parent=self.modelFrameLayout)
        # set up tab
        cmds.tabLayout(self.tabLayout, edit=1, tabLabel=((self.animationFrameLayout, 'Animation'),
                                                         (self.modelFrameLayout, 'Model')))

        cmds.showWindow(self.mainWindow)
