import string
from functools import partial
import maya.cmds as cmds
from . import base, fbxExport, modelExport, export, animLayerExport, animationExport

reload(base)
reload(fbxExport)
reload(modelExport)
reload(export)
reload(animLayerExport)
reload(animationExport)


class MainUI(object):

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
        cmds.menuItem(parent=self.helpMenu, label='Help on Animation Export', command=self.animHelpWindow)
        cmds.menuItem(parent=self.helpMenu, label='Help on Export', command=self.modelHelpWindow)

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
                                                            allowMultiSelection=0, parent=self.animationFormLayout,
                                                            sc=self.animPopulateExportNodePanel)
        self.animExportNodeTextScrollList = cmds.textScrollList(width=250, height=325, numberOfRows=18,
                                                                allowMultiSelection=0, parent=self.animationFormLayout,
                                                                sc=self.animUpdateExportNodeSettings)
        self.animNewNodeBtn = cmds.button(width=250, height=50, label='New Export Node', parent=self.animationFormLayout,
                                          command=self.animCreateNewExportNode)
        self.animExportCheckBoxGrp = cmds.checkBoxGrp(numberOfCheckBoxes=1, label='Export', columnWidth2=[85, 70],
                                                      enable=0, parent=self.animationFormLayout,
                                                      cc=self.animUpdateExportNodeFromAnimSetting)

        self.animZeroOriginCheckBoxGrp = cmds.checkBoxGrp(numberOfCheckBoxes=1, label='Move to Origin',
                                                          columnWidth2=[85, 70], enable=0,
                                                          parent=self.animationFormLayout,
                                                          cc=self.animSubRangeUpdateSetting)
        self.animZeroOriginMotionCheckBoxGrp = cmds.checkBoxGrp(numberOfCheckBoxes=1, label='Zero Motion on Origin',
                                                                columnWidth2=[120, 70], enable=0,
                                                                parent=self.animationFormLayout,
                                                                cc=self.animUpdateExportNodeFromAnimSetting)
        self.animSubRangeCheckBoxGrp = cmds.checkBoxGrp(numberOfCheckBoxes=1, label='Use Sub Range',
                                                        columnWidth2=[85, 70], enable=0, parent=self.animationFormLayout,
                                                        cc=self.animSubRangeUpdateSetting)
        self.animStartFrameFloatFieldGrp = cmds.floatFieldGrp(numberOfFields=1, label='Start Frame',
                                                              columnWidth2=[75, 70], enable=0, value1=0.0,
                                                              parent=self.animationFormLayout,
                                                              cc=self.animUpdateExportNodeFromAnimSetting)
        self.animEndFrameFloatFieldGrp = cmds.floatFieldGrp(numberOfFields=1, label='End Frame', columnWidth2=[75, 70],
                                                            enable=0, value1=1.0, parent=self.animationFormLayout,
                                                            cc=self.animUpdateExportNodeFromAnimSetting)
        self.animExportFileNameTextFieldButtonGrp = cmds.textFieldButtonGrp(label='Export File Name',
                                                                            columnWidth3=[100, 300, 30], enable=0, text='',
                                                                            buttonLabel='Browse...',
                                                                            parent=self.animationFormLayout,
                                                                            bc=partial(self.browseExportFileName, 1),
                                                                            cc=self.animUpdateExportNodeFromAnimSetting)
        self.animRecordAnimLayersBtn = cmds.button(width=150, height=50, label='Record Anim Layers', enable=0,
                                                   backgroundColor=[1, 0.25, 0.25], parent=self.animationFormLayout,
                                                   c=self.animRecordAnimLayer)
        self.animPreviewAnimLayersBtn = cmds.button(width=250, height=50, label='Preview Anim Layers', enable=0,
                                                    parent=self.animationFormLayout,
                                                    c=self.animPreveiwAnimLayer)
        self.animClearAnimLayersBtn = cmds.button(width=250, height=50, label='Clear Anim Layers', enable=0,
                                                  parent=self.animationFormLayout, c=self.animClearAnimLayer)
        self.animActorText = cmds.text(label='Actors', parent=self.animationFormLayout)
        self.animExportNodesText = cmds.text(label='Export Nodes', parent=self.animationFormLayout)
        self.animExportSelectedAnimationBtn = cmds.button(width=300, height=50, label='Export Selected Animation',
                                                          parent=self.animationFormLayout,
                                                          c=self.animExportSelectedAnim)
        self.animExportAllAnimationForSelectedCharacterBtn = cmds.button(width=300, height=50,
                                                                         label='Export All Animation for Selected Character',
                                                                         parent=self.animationFormLayout,
                                                                         c=self.animExportAllAnimationForSelectedCharacter)
        self.animExportAllAnimationBtn = cmds.button(width=300, height=50, label='Export All Animations',
                                                     parent=self.animationFormLayout,
                                                     c=self.animExportAllAnimation)

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
        cmds.formLayout(self.animationFormLayout, edit=1, attachControl=[(self.animExportNodeTextScrollList, 'left', 5, self.animActorsTextScrollList),
                                                                         (self.animExportCheckBoxGrp, 'left', 20, self.animExportNodeTextScrollList),
                                                                         (self.animZeroOriginCheckBoxGrp, 'left', 5, self.animExportCheckBoxGrp),
                                                                         (self.animZeroOriginMotionCheckBoxGrp, 'left', 5, self.animZeroOriginCheckBoxGrp)])
        cmds.formLayout(self.animationFormLayout, edit=1, attachControl=[(self.animSubRangeCheckBoxGrp, 'left', 20, self.animExportNodeTextScrollList),
                                                                         (self.animSubRangeCheckBoxGrp, 'top', 5, self.animZeroOriginCheckBoxGrp)])
        cmds.formLayout(self.animationFormLayout, edit=1, attachControl=[(self.animStartFrameFloatFieldGrp, 'left', 30, self.animExportNodeTextScrollList),
                                                                         (self.animStartFrameFloatFieldGrp, 'top', 5, self.animSubRangeCheckBoxGrp)])
        cmds.formLayout(self.animationFormLayout, edit=1, attachControl=[(self.animEndFrameFloatFieldGrp, 'left', 1, self.animStartFrameFloatFieldGrp),
                                                                         (self.animEndFrameFloatFieldGrp, 'top', 5, self.animSubRangeCheckBoxGrp)])
        cmds.formLayout(self.animationFormLayout, edit=1, attachControl=[(self.animExportFileNameTextFieldButtonGrp, 'left', 5, self.animExportNodeTextScrollList),
                                                                         (self.animExportFileNameTextFieldButtonGrp, 'top', 5, self.animStartFrameFloatFieldGrp)])
        cmds.formLayout(self.animationFormLayout, edit=1, attachControl=[(self.animNewNodeBtn, 'left', 5, self.animActorsTextScrollList),
                                                                         (self.animNewNodeBtn, 'top', 5, self.animExportNodeTextScrollList)])
        cmds.formLayout(self.animationFormLayout, edit=1, attachControl=[(self.animActorsTextScrollList, 'top', 5, self.animActorText),
                                                                         (self.animExportNodeTextScrollList, 'top', 5, self.animExportNodesText),
                                                                         (self.animExportNodesText, 'left', 255, self.animActorText)])
        cmds.formLayout(self.animationFormLayout, edit=1, attachControl=[(self.animRecordAnimLayersBtn, 'top', 10, self.animExportFileNameTextFieldButtonGrp),
                                                                         (self.animPreviewAnimLayersBtn, 'top', 10, self.animExportFileNameTextFieldButtonGrp),
                                                                         (self.animClearAnimLayersBtn, 'top', 10, self.animExportFileNameTextFieldButtonGrp)])
        cmds.formLayout(self.animationFormLayout, edit=1, attachControl=[(self.animRecordAnimLayersBtn, 'left', 10, self.animExportNodeTextScrollList),
                                                                         (self.animPreviewAnimLayersBtn, 'left', 10, self.animRecordAnimLayersBtn),
                                                                         (self.animClearAnimLayersBtn, 'left', 10, self.animPreviewAnimLayersBtn)])
        cmds.formLayout(self.animationFormLayout, edit=1, attachControl=[(self.animExportSelectedAnimationBtn, 'top', 10, self.animRecordAnimLayersBtn),
                                                                         (self.animExportAllAnimationForSelectedCharacterBtn, 'top', 10, self.animExportSelectedAnimationBtn),
                                                                         (self.animExportAllAnimationBtn, 'top', 10, self.animExportAllAnimationForSelectedCharacterBtn)])
        cmds.formLayout(self.animationFormLayout, edit=1, attachControl=[(self.animExportSelectedAnimationBtn, 'left', 100, self.animExportNodeTextScrollList),
                                                                         (self.animExportAllAnimationForSelectedCharacterBtn, 'left', 100, self.animExportNodeTextScrollList),
                                                                         (self.animExportAllAnimationBtn, 'left', 100, self.animExportNodeTextScrollList)])
        # Animation Popup Menu
        self.animExportNodesPopupMenu = cmds.popupMenu(button=3, parent=self.animExportNodeTextScrollList)
        self.animSelectNodeMenuItem = cmds.menuItem(label='Select', parent=self.animExportNodesPopupMenu,
                                                    command=partial(self.selectExportNode, self.animExportNodeTextScrollList))
        self.animRenameNodeMenuItem = cmds.menuItem(label='Rename', parent=self.animExportNodesPopupMenu,
                                                    command=partial(self.renameExportNodeUI, self.animExportNodeTextScrollList))
        self.animDeleteNodeMenuItem = cmds.menuItem(label='Delete', parent=self.animExportNodesPopupMenu,
                                                    command=partial(self.deleteExportNode, self.animExportNodeTextScrollList))


        # create model UI elements
        self.modelOriginTextScrollList = cmds.textScrollList(width=175, height=220, numberOfRows=18,
                                                             allowMultiSelection=0, parent=self.modelFormLayout,
                                                             sc=self.modelPopulateExportNodePanel)
        self.modelExportNodesTextScrollList = cmds.textScrollList(width=175, height=220, numberOfRows=18,
                                                                  allowMultiSelection=0, parent=self.modelFormLayout,
                                                                  sc=self.populateGeomPanel)
        self.modelGeomTextScrollList = cmds.textScrollList(width=175, height=220, numberOfRows=18, allowMultiSelection=1,
                                                           parent=self.modelFormLayout)
        self.modelTagAsOriginBtn = cmds.button(width=175, height=50, label='Tag as Origin', parent=self.modelFormLayout,
                                               command=self.modelTagAsOrigin)
        self.modelNewExportNodeBtn = cmds.button(width=175, height=50, label='New Export Node', parent=self.modelFormLayout,
                                                 command=self.modelCreateNewExportNode)
        self.modelAddRemoveMeshesBtn = cmds.button(width=175, height=50, label='Add / Remove Meshes', parent=self.modelFormLayout,
                                                   command=self.modelAddRemoveMeshes)
        self.modelExportCheckBoxGrp = cmds.checkBoxGrp(numberOfCheckBoxes=1, label='Export', columnWidth2=[85, 70], enable=0,
                                                       parent=self.modelFormLayout, cc=self.modelUpdateExportNodeFromModelSetting)
        self.modelOriginText = cmds.text(label='Root Joints', parent=self.modelFormLayout)
        self.modelExportNodesText = cmds.text(label='Export', parent=self.modelFormLayout)
        self.modelMeshesText = cmds.text(label='Meshes', parent=self.modelFormLayout)
        self.modelExportFileNameTextFieldButtonGrp = cmds.textFieldButtonGrp(label='Export File Name',
                                                                             columnWidth3=[100, 300, 30], enable=0, text='',
                                                                             buttonLabel='Browse...', parent=self.modelFormLayout,
                                                                             bc=partial(self.browseExportFileName, 2))
        self.modelExportMeshBtn = cmds.button(width=175, height=50, label='Export Selected Character', parent=self.modelFormLayout,
                                              command=self.modelExportSelectedCharacter)
        self.modelExportAllMeshesBtn = cmds.button(width=175, height=50, label='Export All Characters', parent=self.modelFormLayout,
                                                   command=self.modelExportAllCharacters)


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

        # Model Popup Menu
        self.modelExportNodesPopupMenu = cmds.popupMenu(button=3, parent=self.modelExportNodesTextScrollList)
        self.modelSelectMenuItem = cmds.menuItem(label='Select', command=partial(self.selectExportNode, self.modelExportNodesTextScrollList),
                                                 parent=self.modelExportNodesPopupMenu)
        self.modelRenameMenuItem = cmds.menuItem(label='Rename', command=partial(self.renameExportNodeUI, self.modelExportNodesTextScrollList),
                                                 parent=self.modelExportNodesPopupMenu)
        self.modelDeleteMenuItem = cmds.menuItem(label='Delete', command=partial(self.deleteExportNode, self.modelExportNodesTextScrollList),
                                   parent=self.modelExportNodesPopupMenu)

        # set up tab
        cmds.tabLayout(self.tabLayout, edit=1, tabLabel=((self.animationFrameLayout, 'Animation'),
                                                         (self.modelFrameLayout, 'Model')))

        # Populate UI
        self.populateModelRootJointsPanel()
        self.animPopulateActorPanel()

        # scriptJob to refresh it
        cmds.scriptJob(parent=self.mainWindow, e=['PostSceneRead', "import CustomExporter\nCustomExporter.UI.MainUI().populateModelRootJointsPanel()"])
        cmds.scriptJob(parent=self.mainWindow, e=['PostSceneRead', "import CustomExporter\nCustomExporter.UI.MainUI().populateAnimActorPanel()"])

        cmds.showWindow(self.mainWindow)


    # help on animation
    def animHelpWindow(self, *args):
        if cmds.window('animHelpWindowUI', exists=1):
            cmds.deleteUI('animHelpWindowUI')

        self.animHelpWindowUI = cmds.window('animHelpWindowUI', s=1, width=500, height=500, menuBar=1, title='Help on Animation Export')
        cmds.paneLayout(configuration='horizontal4')
        cmds.scrollField(editable=0, wordWrap=1, text="Animation Export: \nAnimation export assumes single-level referencing with proper namesapce.\n\nActors: \nAll referenced characters with a origin joint tagged with the origin attribute will be listed in the Actor's field by their namespace. Please see the modeling help window for how to tage a character's origin with the origin attribute.\n\nExport Nodes:\nThe Export Nodes panel will fill in with export nodes connected to the origin of the selected actor from the Actor's field. Clicking on the New Export Node will create a new node. Each export node represents a seperate animation.\n\nExport:\nThe Export flag means the current export ndoe will be available for export. All nodes wihtout this checked will not be exported.\n\nMove to origin:\nNot yet supported\n\nSub Range:\nTurn this on to enable the sub-range option for the selected node. This will enable the Start Frame and End Frame fields where you can set the range for the specified animation. Otherwise, the animation will use the frame range of the file.\n\nExport File Name:\nClick on the Browse button to browse to where you want the file to go. The path will be project relative.\n\nExport Selected Animation:\nClick this button to export the animation selected in Export Nodes\n\nExport All Animations For Selected Character:\nClick this button to export all animations for the selected actor in the Actors filed. This flag will ignore what is selected in Export Nodes and export from all found nodes for the character\n\nExport All Animations:\nClick this button to export all animations for all characters. All selections will be ignored")
        cmds.showWindow('animHelpWindowUI')

    # help on model
    def modelHelpWindow(self, *args):
        if cmds.window('modelHelpWindowUI', exists=1):
            cmds.deleteUI('modelHelpWindowUI')

        self.modelHelpWindowUI = cmds.window('modelHelpWindowUI', s=1, width=500, height=500, menuBar=1, title='Help on Model Export')
        cmds.paneLayout(configuration='horizontal4')
        cmds.scrollField(editable=0, wordWrap=1, text="Model Export: \nModel exporter assumes one skeleton for export. Referencing for model export is not supported\n\nRoot Joints: \nPanel will list all the joints tagged with the \"origin\" attribute. If no joint is tagged with the attribute, it will list all joints in the scene and turn red. Select the root joint and click the Tag as Origin button.\n\nExport Nodes:\nThe Export Nodes panel will fill in with export nodes connected to the origin of the selected actor from the Actor's field. Clicking on the New Export Node will create a new node. Each export node represents a seperate character export (for example, seperate LOD's).\n\nMeshes:\nThe Meshes panel shows all the geometry associated with the selected export node. This can be used if you have mesh variations skinned to the same rig or LOD's.\n\nExport File Name:\nClick on the Browse button to browse to where you want the file to go. The path will be project relative.\n\nExport Selected Character:\nClick this button to export the character selected in Export Nodes\n\nExport All Characters:\nClick this button to export all character definitions for the skeleton. All selections will be ignored")
        cmds.showWindow(self.modelHelpWindowUI)

    def selectExportNode(self, uiElement, *args):
        exportNode = cmds.textScrollList(uiElement, q=1, selectItem=1)

        if exportNode and cmds.objExists(exportNode[0]):
            cmds.select(cl=1)
            cmds.select(exportNode)

    def deleteExportNode(self, uiElement, *args):
        exportNode = cmds.textScrollList(uiElement, q=1, selectItem=1)

        if exportNode and cmds.objExists(exportNode[0]):

            fbxExport.deleteFBXExportNode(exportNode[0])

        self.animPopulateExportNodePanel()
        self.modelPopulateExportNodePanel()

    def renameExportNodeUI(self, uiElement, *args):
        exportNode = cmds.textScrollList(uiElement, q=1, selectItem=1)

        if cmds.window('renameExportNodeWindow', exists=1):
            cmds.deleteUI('renameExportNodeWindow')

        self.renameExportNodeWindow = cmds.window('renameExportNodeWindow', s=0, width=225, height=100, menuBar=1,
                                                  title='Rename Export Node')

        self.renameFrameLayout = cmds.frameLayout(collapsable=0, label='', borderVisible=0)
        self.renameFormLayout = cmds.formLayout(numberOfDivisions=100, parent=self.renameFrameLayout)

        self.renameTextFieldGrp = cmds.textFieldGrp(label='New name: ', columnWidth2=[75, 175], parent=self.renameFormLayout)

        self.renameBtn = cmds.button(label='Rename', width=75, parent=self.renameFormLayout, command=partial(self.renameExportNode, exportNode[0]))
        self.cancelBtn = cmds.button(label='Cancel', width=75, parent=self.renameFormLayout, command=self.renameCloseWindow)

        cmds.formLayout(self.renameFormLayout, edit=1, attachForm=[(self.renameTextFieldGrp, 'top', 5),
                                                                   (self.renameTextFieldGrp, 'left', 5),
                                                                   (self.renameBtn, 'left', 50)])
        cmds.formLayout(self.renameFormLayout, edit=1, attachControl=[(self.renameBtn, 'top', 10, self.renameTextFieldGrp),
                                                                      (self.cancelBtn, 'top', 10, self.renameTextFieldGrp),
                                                                      (self.cancelBtn, 'left', 50, self.renameBtn)])

        cmds.showWindow(self.renameExportNodeWindow)

    def renameExportNode(self, exportNode, *args):
        newName = cmds.textFieldGrp(self.renameTextFieldGrp, q=1, text=1)
        cmds.rename(exportNode, newName)

        self.animPopulateExportNodePanel()
        self.modelPopulateExportNodePanel()

        self.renameCloseWindow()

    def renameCloseWindow(self, *args):
        cmds.deleteUI(self.renameExportNodeWindow)
    # model ui Proc
    def populateModelRootJointsPanel(self):
        cmds.textScrollList(self.modelOriginTextScrollList, edit=1, removeAll=1)

        origin = base.returnOrigin('')

        if origin != 'Error':
            cmds.textScrollList(self.modelOriginTextScrollList, edit=1, ebg=0, append=origin)
        else:
            joints = cmds.ls(type='joint')
            for curJoint in joints:
                cmds.textScrollList(self.modelOriginTextScrollList, edit=1, bgc=[1, 0.1, 0.1], append=curJoint)

    def modelTagAsOrigin(self, *args):
        joints = cmds.textScrollList(self.modelOriginTextScrollList, q=1, selectItem=1)
        base.tagForOrigin(joints[0])
        self.populateModelRootJointsPanel()

    def modelPopulateExportNodePanel(self, *args):
        origin = cmds.textScrollList(self.modelOriginTextScrollList, q=1, selectItem=1)
        cmds.textScrollList(self.modelExportNodesTextScrollList, edit=1, removeAll=1)

        if origin:

            exportNodes = fbxExport.returnFBXExportNodes(origin[0])

            if exportNodes:
                for cur in exportNodes:
                    cmds.textScrollList(self.modelExportNodesTextScrollList, edit=1, append=cur)

    def modelCreateNewExportNode(self, *args):
        origin = cmds.textScrollList(self.modelOriginTextScrollList, q=1, selectItem=1)

        if origin[0] != 'Error':
            exportNode = fbxExport.createFBXExportNode(origin[0])

            if exportNode:
                fbxExport.connectFBXExportNodeToOrigin(exportNode, origin[0])
                self.modelPopulateExportNodePanel()

    def populateGeomPanel(self, *args):
        cmds.textScrollList(self.modelGeomTextScrollList, edit=1, removeAll=1)
        exportNode = cmds.textScrollList(self.modelExportNodesTextScrollList, q=1, selectItem=1)
        meshes = modelExport.returnConnectedMeshes(exportNode[0])

        if meshes:
            for curMesh in meshes:
                cmds.textScrollList(self.modelGeomTextScrollList, edit=1, append=curMesh)

        self.modelUpdateExportSetting()

    def modelAddRemoveMeshes(self, *args):
        exportNode = cmds.textScrollList(self.modelExportNodesTextScrollList, q=1, selectItem=1)
        meshes = cmds.textScrollList(self.modelGeomTextScrollList, q=1, selectItem=1)

        if exportNode:
            if meshes:
                modelExport.disconnectFBXExportNodeToMeshes(exportNode[0], meshes)
            else:
                sel = cmds.ls(selection=1)
                if sel:
                    modelExport.connectFBXExportNodeToMeshes(exportNode[0], sel)

        self.populateGeomPanel()

    def modelUpdateExportSetting(self, *args):
        exportNode = cmds.textScrollList(self.modelExportNodesTextScrollList, q=1, selectItem=1)

        cmds.textFieldButtonGrp(self.modelExportFileNameTextFieldButtonGrp, edit=1, enable=1, text='')

        fbxExport.addFBXNodeAttrs(exportNode[0])

        if exportNode:
            cmds.textFieldButtonGrp(self.modelExportFileNameTextFieldButtonGrp, edit=1, text=cmds.getAttr(exportNode[0] + '.exportName'))
            cmds.checkBoxGrp(self.modelExportCheckBoxGrp, edit=1, enable=1, value1=cmds.getAttr(exportNode[0] + '.export'))

    def modelUpdateExportNodeFromModelSetting(self, *args):
        exportNode = cmds.textScrollList(self.modelExportNodesTextScrollList, q=1, selectItem=1)

        if exportNode:
            cmds.setAttr(exportNode[0] + '.exportName', cmds.textFieldButtonGrp(self.modelExportFileNameTextFieldButtonGrp,
                                                                                q=1, text=1), type='string')
            cmds.setAttr(exportNode[0] + '.export', cmds.checkBoxGrp(self.modelExportCheckBoxGrp, q=1, value1=1))

    def modelExportAllCharacters(self, *args):
        origin = base.returnOrigin('')

        exportNode = fbxExport.returnFBXExportNodes(origin)

        for cur in exportNode:
            if cmds.objExists(cur):
                export.exportFBXCharacter(cur)

    def modelExportSelectedCharacter(self, *args):

        exportNode = cmds.textScrollList(self.modelExportNodesTextScrollList, q=1, selectItem=1)
        export.exportFBXCharacter(exportNode[0])

    # anim ui proc
    def animPopulateActorPanel(self):
        cmds.textScrollList(self.animActorsTextScrollList, edit=1, removeAll=1)

        reference = cmds.file(query=1, reference=1)

        for curRef in reference:
            if not cmds.file(curRef, query=1, deferReference=1):
                ns = cmds.file(curRef, query=1, namespace=1)
                origin = base.returnOrigin(ns)

                if origin != 'Error':
                    cmds.textScrollList(self.animActorsTextScrollList, edit=1, append=ns)

    def animPopulateExportNodePanel(self, *args):
        cmds.textScrollList(self.animExportNodeTextScrollList, edit=1, removeAll=1)
        ns = cmds.textScrollList(self.animActorsTextScrollList, q=1, selectItem=1)
        if ns:
            origin = base.returnOrigin(ns[0])

            if origin != 'Error':
                exportNode = fbxExport.returnFBXExportNodes(origin)

                if exportNode:
                    for cur in exportNode:
                        testForMeshes = modelExport.returnConnectedMeshes(cur)
                        if not testForMeshes:
                            cmds.textScrollList(self.animExportNodeTextScrollList, edit=1, append=cur)

    def animCreateNewExportNode(self, *args):
        ns = cmds.textScrollList(self.animActorsTextScrollList, q=1, selectItem=1)

        if ns:
            origin = base.returnOrigin(ns[0])

            if origin != 'Error':
                exportNode = fbxExport.createFBXExportNode(ns[0])

                if exportNode:
                    fbxExport.connectFBXExportNodeToOrigin(exportNode, origin)

                    self.animPopulateExportNodePanel()

    def animUpdateExportNodeSettings(self, *args):
        exportNode = cmds.textScrollList(self.animExportNodeTextScrollList, q=1, selectItem=1)

        if exportNode:
            fbxExport.addFBXNodeAttrs(exportNode[0])

            cmds.checkBoxGrp(self.animExportCheckBoxGrp, edit=1, value1=cmds.getAttr(exportNode[0] + '.export'),
                             enable=1)
            cmds.checkBoxGrp(self.animZeroOriginCheckBoxGrp, edit=1, value1=cmds.getAttr(exportNode[0] + '.moveToOrigin'),
                             enable=1)
            cmds.checkBoxGrp(self.animSubRangeCheckBoxGrp, edit=1, value1=cmds.getAttr(exportNode[0] + '.useSubRange'),
                             enable=1)

            # use subRange
            if cmds.getAttr(exportNode[0] + '.useSubRange'):
                cmds.floatFieldGrp(self.animStartFrameFloatFieldGrp, edit=1, enable=1,
                                   value1=cmds.getAttr(exportNode[0] + '.startFrame'))
                cmds.floatFieldGrp(self.animEndFrameFloatFieldGrp, edit=1, enable=1,
                                   value1=cmds.getAttr(exportNode[0] + '.endFrame'))

            else:
                cmds.floatFieldGrp(self.animStartFrameFloatFieldGrp, edit=1, enable=0)
                cmds.floatFieldGrp(self.animEndFrameFloatFieldGrp, edit=1, enable=0)

            # move to origin
            if cmds.getAttr(exportNode[0] + '.moveToOrigin'):
                print 'ok'
                cmds.checkBoxGrp(self.animZeroOriginMotionCheckBoxGrp, edit=1, enable=True,
                                 value1=cmds.getAttr(exportNode[0] + '.zeroOrigin'))
            else:
                print 'no'
                cmds.checkBoxGrp(self.animZeroOriginMotionCheckBoxGrp, edit=1, enable=0)

            # anim layer
            text = cmds.getAttr(exportNode[0] + '.animLayers')

            if text:
                cmds.button(self.animRecordAnimLayersBtn, edit=1, enable=1, label='Re-Record', bgc=[0.25, 0.25, 1.0])
            else:
                cmds.button(self.animRecordAnimLayersBtn, edit=1, enable=1, label='Record', bgc=[1.0, 0.25, 0.25])

            cmds.button(self.animPreviewAnimLayersBtn, edit=1, enable=1)
            cmds.button(self.animClearAnimLayersBtn, edit=1, enable=1)

            cmds.textFieldButtonGrp(self.animExportFileNameTextFieldButtonGrp, edit=1, enable=1,
                                    text=cmds.getAttr(exportNode[0] + '.exportName'))

    def animUpdateExportNodeFromAnimSetting(self, *args):
        exportNode = cmds.textScrollList(self.animExportNodeTextScrollList, q=1, selectItem=1)

        if exportNode and cmds.objExists(exportNode[0]):
            fbxExport.addFBXNodeAttrs(exportNode[0])

            cmds.setAttr(exportNode[0] + '.export', cmds.checkBoxGrp(self.animExportCheckBoxGrp, query=1, value1=1))
            cmds.setAttr(exportNode[0] + '.moveToOrigin', cmds.checkBoxGrp(self.animZeroOriginCheckBoxGrp, query=1, value1=1))
            cmds.setAttr(exportNode[0] + '.zeroOrigin', cmds.checkBoxGrp(self.animZeroOriginMotionCheckBoxGrp, query=1, value1=1))
            cmds.setAttr(exportNode[0] + '.useSubRange', cmds.checkBoxGrp(self.animSubRangeCheckBoxGrp, query=1, value1=1))

            if cmds.getAttr(exportNode[0] + '.useSubRange'):
                cmds.setAttr(exportNode[0] + '.startFrame', cmds.floatFieldGrp(self.animStartFrameFloatFieldGrp, q=1, value1=1))
                cmds.setAttr(exportNode[0] + '.endFrame', cmds.floatFieldGrp(self.animEndFrameFloatFieldGrp, q=1, value1=1))

            cmds.setAttr(exportNode[0] + '.exportName',
                         cmds.textFieldButtonGrp(self.animExportFileNameTextFieldButtonGrp, q=1, text=1), type="string")

    def animSubRangeUpdateSetting(self, *args):
        self.animUpdateExportNodeFromAnimSetting()
        self.animUpdateExportNodeSettings()

    def animRecordAnimLayer(self, *args):
        exportNode = cmds.textScrollList(self.animExportNodeTextScrollList, q=1, selectItem=1)

        if exportNode and cmds.objExists(exportNode[0]):
            animLayerExport.setAnimLayerSettings(exportNode[0])

            cmds.button(self.animRecordAnimLayersBtn, edit=1, label='Re-Record', bgc=[0.25, 0.25, 1.0])

    def animPreveiwAnimLayer(self, *args):
        exportNode = cmds.textScrollList(self.animExportNodeTextScrollList, q=1, selectItem=1)

        if exportNode and cmds.objExists(exportNode[0]):
            animLayerExport.setAnimLayerFromSettings(exportNode[0])

    def animClearAnimLayer(self, *args):
        exportNode = cmds.textScrollList(self.animExportNodeTextScrollList, q=1, selectItem=1)

        if exportNode and cmds.objExists(exportNode[0]):
            animLayerExport.clearAnimLayerSettings(exportNode[0])

            cmds.button(self.animRecordAnimLayersBtn, edit=1, label='Record', bgc=[1.0, 0.25, 0.25])

    def animExportSelectedAnim(self, *args):
        exportNode = cmds.textScrollList(self.animExportNodeTextScrollList, q=1, selectItem=1)
        ns = cmds.textScrollList(self.animActorsTextScrollList, q=1, selectItem=1)

        if exportNode and ns:
            export.exportFBXAnimation(ns[0], exportNode[0])

    def animExportAllAnimationForSelectedCharacter(self, *args):
        ns = cmds.textScrollList(self.animActorsTextScrollList, q=1, selectItem=1)

        export.exportFBXAnimation(ns[0], '')

    def animExportAllAnimation(self, *args):
        ns = cmds.textScrollList(self.animActorsTextScrollList, q=1, allItems=1)

        for cur in ns:
            origin = base.returnOrigin(cur)

            if origin != 'Error':
                export.exportFBXAnimation(cur, '')

    # General UI Proc
    def browseExportFileName(self, flag, *args):
        """
        browse export file name for different tab
        :param flag: flag of 1 = animation tab, flag of 2 = model tab.
        :param args: used for callback function for maya
        :return: None
        """
        temp = ''

        if flag == 1:
            temp = cmds.textFieldButtonGrp(self.animExportFileNameTextFieldButtonGrp, q=1, text=1)
        elif flag == 2:
            temp = cmds.textFieldButtonGrp(self.modelExportFileNameTextFieldButtonGrp, q=1, text=1)
        else:
            cmds.error('Unknown tab flag!')

        project = cmds.workspace(q=1, rd=1)
        dirmask = project + '/' + temp

        newFileList = cmds.fileDialog2(fm=0, startingDirectory=dirmask, fileFilter='FBX export (*.fbx)')

        newFile = ''

        if newFileList:
            newFile = newFileList[0]
            newFile = string.replace(newFile, project, '')
        else:
            newFile = temp

        # update text field button grp
        if flag == 1:
            cmds.textFieldButtonGrp(self.animExportFileNameTextFieldButtonGrp, edit=1, text=newFile)
            self.animUpdateExportNodeFromAnimSetting()
        elif flag == 2:
            cmds.textFieldButtonGrp(self.modelExportFileNameTextFieldButtonGrp, edit=1, text=newFile)
            self.modelUpdateExportNodeFromModelSetting()
        else:
            cmds.error('Unknown tab flag!')
