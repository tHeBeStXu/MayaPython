import maya.cmds as cmds
from functools import partial


class CharacterPicker():

    def __init__(self):

        # widget var
        self.widget = {}

        # call on the buildUI() method

        self.build_UI()

    def build_UI(self):

        if cmds.dockControl("characterPicker_dockControl", exists=True):
            cmds.deleteUI("characterPicker_dockControl")

        self.widget["window"] = cmds.window("CharacterPickerWindow", title="CharacterPicker",
                                            w=400, h=600, mnb=False, mxb=False)

        # LAYOUT
        self.widget["mainLayout"] = cmds.columnLayout(w=400, h=600)
        self.widget["formLayout"] = cmds.formLayout(w=400, h=600)

        # CREATE BUTTONS

        self.widget["headButton"] = cmds.button(label="", w=40, h=40, backgroundColor=[0, 0.593, 1.0])
        # buttonInfo = [  [(buttonName), (buttonBGC)]  ]
        cmds.button(self.widget["headButton"], edit=True, c=partial(self.selectControls, ["head"],
                                                                    [[(self.widget["headButton"]),
                                                                      ([0, 0.593, 1.0])]]))

        self.widget["spine03Button"] = cmds.button(label="", w=100, h=40, bgc=[0.824, 0.522, 0.275])
        cmds.button(self.widget["spine03Button"], edit=True, c=partial(self.selectControls, ["spine_03"],
                                                                       [[(self.widget["spine03Button"]),
                                                                         ([0.824, 0.522, 0.275])]]))

        self.widget["spine02Button"] = cmds.button(label="", w=100, h=40, bgc=[0.824, 0.522, 0.275])
        cmds.button(self.widget["spine02Button"], edit=True, c=partial(self.selectControls, ["spine_02"],
                                                                       [[(self.widget["spine02Button"]),
                                                                         ([0.824, 0.522, 0.275])]]))

        self.widget["spine01Button"] = cmds.button(label="", w=100, h=40, bgc=[0.824, 0.522, 0.275])
        cmds.button(self.widget["spine01Button"], edit=True, c=partial(self.selectControls, ["spine_01"],
                                                                       [[(self.widget["spine01Button"]),
                                                                         ([0.824, 0.522, 0.275])]]))

        self.widget["selectAllSpineButton"] = cmds.button(label="", w=30, h=30, bgc=[0, 1, 0])
        cmds.button(self.widget["selectAllSpineButton"], edit=True, c=partial(self.selectControls,
                                                                              ["spine_01", "spine_02", "spine_03"],
                                                                              [[self.widget["spine03Button"],
                                                                                [0.824, 0.522, 0.275]],
                                                                               [self.widget["spine02Button"],
                                                                                [0.824, 0.522, 0.275]],
                                                                               [self.widget["spine01Button"],
                                                                                [0.824, 0.522, 0.275]]]))



        # PLACE BUTTONS
        cmds.formLayout(self.widget["formLayout"], edit=True,
                        attachForm=[(self.widget["headButton"], 'left', 175), (self.widget["headButton"], 'top', 100)])
        cmds.formLayout(self.widget["formLayout"], edit=True,
                        attachForm=[(self.widget["spine03Button"], 'left', 145),
                                    (self.widget["spine03Button"], 'top', 150)])

        cmds.formLayout(self.widget["formLayout"], edit=True,
                        attachForm=[(self.widget["spine02Button"], 'left', 145),
                                    (self.widget["spine02Button"], 'top', 200)])

        cmds.formLayout(self.widget["formLayout"], edit=True,
                        attachForm=[(self.widget["spine01Button"], 'left', 145),
                                    (self.widget["spine01Button"], 'top', 250)])

        cmds.formLayout(self.widget["formLayout"], edit=True,
                        attachForm=[(self.widget["selectAllSpineButton"], 'left', 250),
                                    (self.widget["selectAllSpineButton"], 'top', 205)])



        # SHOW WINDOW
        # cmds.showWindow(self.widget["window"])

        cmds.dockControl("characterPicker_dockControl", label="Character Picker", area='right', allowedArea='right',
                         content=self.widget["window"])

    def selectControls(self, controls, buttonInfo, *args):

        # buttonInfo = [  [(buttonName), (buttonBGC)]  ]

        # if you have SHIFT held down
        mods = cmds.getModifiers()

        if (mods & 1) > 0:

            for i in range(len(controls)):

                cmds.select(controls[i], tgl=True)

                buttonName = buttonInfo[i][0]
                buttonBGC = buttonInfo[i][1]

                cmds.button(buttonName, edit=True, bgc=[1.0, 1.0, 1.0])

                # call the target scriptJob
                self.createSelectionScriptJob(controls[i], buttonName, buttonBGC)

        # if you have no modifiers:

        else:
            cmds.select(clear=True)

            for i in range(len(controls)):

                cmds.select(controls[i], add=True)

                buttonName = buttonInfo[i][0]
                buttonBGC = buttonInfo[i][1]

                cmds.button(buttonName, edit=True, bgc=[1.0, 1.0, 1.0])

                # call the target scriptJob
                self.createSelectionScriptJob(controls[i], buttonName, buttonBGC)


    def createSelectionScriptJob(self, control, buttonName, buttonBGC):

        scriptJobNum = cmds.scriptJob(event=["SelectionChanged", partial(self.deselectButton, control, buttonName, buttonBGC)],
                                      runOnce=True, parent=self.widget["window"])


    def deselectButton(self, control, buttonName, buttonBGC):

        selection = cmds.ls(sl=True)

        if control not in selection:
            cmds.button(buttonName, edit=True, bgc=buttonBGC)

        else:
            self.createSelectionScriptJob(control, buttonName, buttonBGC)










CharacterPicker()