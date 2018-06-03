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

        self.modelFrameLayout = cmds.frameLayout(collapsable=0, label='', borderVisible=0, parent=self.tabLayout)
        self.modelFormLayout = cmds.formLayout(numberOfDivisions=100, parent=self.modelFrameLayout)

        # set up animation form layout
        cmds.formLayout(self.animationFormLayout, edit=1, attachForm=[(self.animActorText, 'top', 5), (self.animActorText, 'left', 5),
                                                                      (self.animActorsTextScrollList, 'left', 5),
                                                                      (self.animExportNodesText, 'top', 5),
                                                                      (self.animExportCheckBoxGrp, 'top', 25),
                                                                      (self.animZeroOriginCheckBoxGrp, 'top', 25),
                                                                      (self.animZeroOriginMotionCheckBoxGrp, 'top', 25),
                                                                      (self.animExportFileNameTextFieldButtonGrp, 'right', 5)])
        cmds.formLayout(self.animationFormLayout, edit=1, attachControl=[(self.animExportNodesTextScrollList, 'left', 5, self.animActorsTextScrollList),
                                                                         (self.animExportCheckBoxGrp, 'left', 20, self.animExportNodesTextScrollList),
                                                                         (self.animZeroOriginCheckBoxGrp, 'left', 5, self.animExportCheckBoxGrp),
                                                                         (self.animZeroOriginMotionCheckBoxGrp, 'left', 5, self.animZeroOriginCheckBoxGrp)])
        cmds.formLayout(self.animationFormLayout, edit=1, attachControl=[(self.animSubRangeCheckBoxGrp, 'left', 20, self.animExportNodesTextScrollList),
                                                                         (self.animSubRangeCheckBoxGrp, 'top', 5, self.animZeroOriginCheckBoxGrp)])
        cmds.formLayout(self.animationFormLayout, edit=1, attachControl=[(self.animStartFrameFloatFieldGrp, 'left', 30, self.animExportNodesTextScrollList),
                                                                         (self.animStartFrameFloatFieldGrp, 'top', 5, self.animSubRangeCheckBoxGrp)])
        cmds.formLayout(self.animationFormLayout, edit=1, attachControl=[(self.animEndFrameFloatFieldGrp, 'left', 1, self.animStartFrameFloatFieldGrp),
                                                                         (self.animEndFrameFloatFieldGrp, 'top', 5, self.animSubRangeCheckBoxGrp)])
        cmds.formLayout(self.animationFormLayout, edit=1, attachControl=[(self.animExportFileNameTextFieldButtonGrp, 'left', 5, self.animExportNodesTextScrollList),
                                                                         (self.animExportFileNameTextFieldButtonGrp, 'top', 5, self.animStartFrameFloatFieldGrp)])
        cmds.formLayout(self.animationFormLayout, edit=1, attachControl=[(self.animNewNodeBtn, 'left', 5, self.animActorsTextScrollList),
                                                                         (self.animNewNodeBtn, 'top', 5, self.animExportNodesTextScrollList)])
        cmds.formLayout(self.animationFormLayout, edit=1, attachControl=[(self.animActorsTextScrollList, 'top', 5, self.animActorText),
                                                                         (self.animExportNodesTextScrollList, 'top', 5, self.animExportNodesText),
                                                                         (self.animExportNodesText, 'left', 255, self.animActorText)])
        cmds.formLayout(self.animationFormLayout, edit=1, attachControl=[(self.animRecordAnimLayersBtn, 'top', 10, self.animExportFileNameTextFieldButtonGrp),
                                                                         (self.animPreviewAnimLayersBtn, 'top', 10, self.animExportFileNameTextFieldButtonGrp),
                                                                         (self.animClearAnimLayersBtn, 'top', 10, self.animExportFileNameTextFieldButtonGrp)])
        cmds.formLayout(self.animationFormLayout, edit=1, attachControl=[(self.animRecordAnimLayersBtn, 'left', 10, self.animExportNodesTextScrollList),
                                                                         (self.animPreviewAnimLayersBtn, 'left', 10, self.animRecordAnimLayersBtn),
                                                                         (self.animClearAnimLayersBtn, 'left', 10, self.animPreviewAnimLayersBtn)])
        cmds.formLayout(self.animationFormLayout, edit=1, attachControl=[(self.animExportSelectedAnimationBtn, 'top', 10, self.animRecordAnimLayersBtn),
                                                                         (self.animAllAnimationForSelectedCharacterBtn, 'top', 10, self.animExportSelectedAnimationBtn),
                                                                         (self.animAllAnimationBtn, 'top', 10, self.animAllAnimationForSelectedCharacterBtn)])
        cmds.formLayout(self.animationFormLayout, edit=1, attachControl=[(self.animExportSelectedAnimationBtn, 'left', 100, self.animExportNodesTextScrollList),
                                                                         (self.animAllAnimationForSelectedCharacterBtn, 'left', 100, self.animExportNodesTextScrollList),
                                                                         (self.animAllAnimationBtn, 'left', 100, self.animExportNodesTextScrollList)])
        # create model UI elements
        self.modelOriginTextScrollList = cmds.textScrollList(width=175, height=220, numberOfRows=18,
                                                             allowMultiSelection=0, parent=self.modelFormLayout)
        self.modelExportNodesTextScrollList = cmds.textScrollList(width=175, height=220, numberOfRows=18,
                                                                  allowMultiSelection=0, parent=self.modelFormLayout)
        self.modelGeomTextScrollList = cmds.textScrollList(width=175, height=220, numberOfRows=18, allowMultiSelection=1,
                                                           parent=self.modelFormLayout)
        self.modelTagAsOriginBtn = cmds.button(width=175, height=50, label='Tag as Origin', parent=self.modelFormLayout)
        self.modelNewExportNodeBtn = cmds.button(width=175, height=50, label='New Export Node', parent=self.modelFormLayout)
        self.modelAddRemoveMeshesBtn = cmds.button(width=175, height=50, label='Add / Remove Meshes', parent=self.modelFormLayout)
        self.modelExportCheckBoxGrp = cmds.checkBoxGrp(numberOfCheckBoxes=1, label='Export', columnWidth2=[85, 70], enable=0,
                                                       parent=self.modelFormLayout)
        self.modelOriginText = cmds.text(label='Root Joints', parent=self.modelFormLayout)
        self.modelExportNodesText = cmds.text(label='Export', parent=self.modelFormLayout)
        self.modelMeshesText = cmds.text(label='Meshes', parent=self.modelFormLayout)
        self.modelExportFileNameTextFieldButtonGrp = cmds.textFieldButtonGrp(label='Export File Name',
                                                                             columnWidth3=[100, 300, 30], enable=0, text='',
                                                                             buttonLabel='Browse...', parent=self.modelFormLayout)
        self.modelExportMeshBtn = cmds.button(width=175, height=50, label='Export Selected Character', parent=self.modelFormLayout)
        self.modelExportAllMeshesBtn = cmds.button(width=175, height=50, label='Export All Characters', parent=self.modelFormLayout)

        # set up model form layout
        cmds.formLayout(self.modelFormLayout, edit=1, attachForm=[(self.modelOriginText, 'top', 5),
                                                                  (self.modelOriginText, 'left', 5),
                                                                  (self.modelExportNodesText, 'top', 5),
                                                                  (self.modelMeshesText, 'top', 5),
                                                                  (self.modelExportCheckBoxGrp, 'top', 25)])
        cmds.formLayout(self.modelFormLayout, edit=1, attachControl=[(self.modelExportNodesText, 'left', 125, self.modelOriginText),
                                                                     (self.modelMeshesText, 'left', 145, self.modelExportNodesText)])
        cmds.formLayout(self.modelFormLayout, edit=1, attachControl=[(self.modelOriginTextScrollList, 'top', 5, self.modelOriginText),
                                                                     (self.modelExportNodesTextScrollList, 'top', 5, self.modelExportNodesText),
                                                                     (self.modelGeomTextScrollList, 'top', 5, self.modelMeshesText)])
        cmds.formLayout(self.modelFormLayout, edit=1, attachControl=[(self.modelExportNodesTextScrollList, 'left', 5, self.modelOriginTextScrollList),
                                                                     (self.modelGeomTextScrollList, 'left', 5, self.modelExportNodesTextScrollList)])
        cmds.formLayout(self.modelFormLayout, edit=1, attachControl=[(self.modelNewExportNodeBtn, 'left', 5, self.modelOriginTextScrollList),
                                                                     (self.modelNewExportNodeBtn, 'top', 5, self.modelExportNodesTextScrollList)])
        cmds.formLayout(self.modelFormLayout, edit=1, attachControl=[(self.modelExportFileNameTextFieldButtonGrp, 'left', 5, self.modelGeomTextScrollList),
                                                                     (self.modelTagAsOriginBtn, 'top', 5, self.modelOriginTextScrollList)])
        cmds.formLayout(self.modelFormLayout, edit=1, attachControl=[(self.modelExportMeshBtn, 'top', 15, self.modelExportFileNameTextFieldButtonGrp),
                                                                     (self.modelExportMeshBtn, 'left', 125, self.modelGeomTextScrollList)])
        cmds.formLayout(self.modelFormLayout, edit=1, attachControl=[(self.modelAddRemoveMeshesBtn, 'top', 5, self.modelGeomTextScrollList),
                                                                     (self.modelAddRemoveMeshesBtn, 'left', 5, self.modelNewExportNodeBtn)])
        cmds.formLayout(self.modelFormLayout, edit=1, attachControl=[(self.modelExportAllMeshesBtn, 'top', 5, self.modelExportMeshBtn),
                                                                     (self.modelExportAllMeshesBtn, 'left', 125, self.modelGeomTextScrollList)])
        cmds.formLayout(self.modelFormLayout, edit=1, attachControl=[(self.modelExportFileNameTextFieldButtonGrp, 'top', 5, self.modelExportCheckBoxGrp),
                                                                     (self.modelExportCheckBoxGrp, 'left', 125, self.modelGeomTextScrollList)])

        # set up tab
        cmds.tabLayout(self.tabLayout, edit=1, tabLabel=((self.animationFrameLayout, 'Animation'),
                                                         (self.modelFrameLayout, 'Model')))

        cmds.showWindow(self.mainWindow)
