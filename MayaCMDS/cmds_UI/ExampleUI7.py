import maya.cmds as cmds
from functools import partial


class PresetUI():

    def __init__(self):

        if cmds.window("presetUI", exists=True):
            cmds.deleteUI("presetUI")

        # class var

        self.widgets = {}

        self.widgets["window"] = cmds.window("presetUI", title="Preset",
                                             w=500, h=300, mxb=0, mnb=0,
                                             sizeable=0)

        self.widgets["mainLayout"] = cmds.columnLayout(w=500, h=300)

        self.widgets["menuBarLayout"] = cmds.menuBarLayout()
        cmds.menu(label='File')
        cmds.menuItem(label='Save Preset', c=partial(self.savePreset))
        cmds.menuItem(label='Load Preset', c=partial(self.loadPreset))

        self.widgets["formLayout"] = cmds.formLayout(w=500, h=300)

        # Create controls

        self.widgets["floatField"] = cmds.floatFieldGrp(numberOfFields=3, label="Position", value1=0.0, value2=0.0, value3=0.0)

        self.widgets["floatSlider"] = cmds.floatSliderGrp(label="Example", field=True, minValue=-10, maxValue=10,
                                                          fieldMinValue=-10, fieldMaxValue=10, value=0)

        self.widgets["radioButtonGrp"] = cmds.radioButtonGrp(label="Radio Buttons", labelArray3=["Yes", "No", "Maybe"],
                                                             numberOfRadioButtons=3)

        self.widgets["inputTextField"] = cmds.textField(w=300, h=30, text="Input Directory", enable=False)
        self.widgets["outputTextField"] = cmds.textField(w=300, h=30, text="Output Directory",  enable=False)

        self.widgets["inputDirectoryButton"] = cmds.button(w=30, h=30, label="...")
        cmds.button(self.widgets["inputDirectoryButton"], edit=1, c=partial(self.inputDirectory))
        self.widgets["outputDirectoryButton"] = cmds.button(w=30, h=30, label="...")
        cmds.button(self.widgets["outputDirectoryButton"], edit=1, c=partial(self.outputDirectory))

        self.widgets["swatch"] = cmds.canvas(rgbValue=(0, 0, 1), w=50, h=50)
        self.widgets["colorEditor"] = cmds.button(label="Color Editor", w=100, h=50)
        cmds.button(self.widgets["colorEditor"], edit=1, c=partial(self.showColorEditor))
        self.widgets["checkBox1"] = cmds.checkBox(label='Yes', value=0)
        self.widgets["checkBox2"] = cmds.checkBox(label='No', value=0)

        self.widgets["iconTextCheckBox1"] = cmds.iconTextCheckBox(style='iconOnly', image1='spotlight.png', w=40, h=40)
        self.widgets["iconTextCheckBox2"] = cmds.iconTextCheckBox(style='iconOnly', image1='sphere.png', w=40, h=40)
        self.widgets["iconTextCheckBox3"] = cmds.iconTextCheckBox(style='iconOnly', image1='cube.png', w=40, h=40)
        self.widgets["iconTextCheckBox4"] = cmds.iconTextCheckBox(style='iconOnly', image1='cone.png', w=40, h=40)
        self.widgets["iconTextCheckBox5"] = cmds.iconTextCheckBox(style='textOnly', label='Toggle', w=40, h=40)

        # Place controls

        cmds.formLayout(self.widgets["formLayout"], edit=1, af=[(self.widgets["floatField"], 'top', 10),
                                                                (self.widgets["floatField"], 'left', -50)])

        cmds.formLayout(self.widgets["formLayout"], edit=1, af=[(self.widgets["floatSlider"], 'top', 40),
                                                                (self.widgets["floatSlider"], "left", -50)])

        cmds.formLayout(self.widgets["formLayout"], edit=1, af=[(self.widgets["radioButtonGrp"], 'top', 70),
                                                                (self.widgets["radioButtonGrp"], 'left', -60)])
        cmds.formLayout(self.widgets["formLayout"], edit=1, af=[(self.widgets["inputTextField"], 'top', 100),
                                                                (self.widgets["inputTextField"], 'left', 5)])
        cmds.formLayout(self.widgets["formLayout"], edit=1, af=[(self.widgets["outputTextField"], 'top', 150),
                                                                (self.widgets["outputTextField"], 'left', 5)])

        cmds.formLayout(self.widgets["formLayout"], edit=1, af=[(self.widgets["inputDirectoryButton"], 'top', 100),
                                                                (self.widgets["inputDirectoryButton"], 'left', 325)])
        cmds.formLayout(self.widgets["formLayout"], edit=1, af=[(self.widgets["outputDirectoryButton"], 'top', 150),
                                                                (self.widgets["outputDirectoryButton"], 'left', 325)])

        cmds.formLayout(self.widgets["formLayout"], edit=1, af=[(self.widgets["swatch"], 'top', 200),
                                                                (self.widgets["swatch"], 'left', 20)])
        cmds.formLayout(self.widgets["formLayout"], edit=1, af=[(self.widgets["colorEditor"], 'top', 200),
                                                                (self.widgets["colorEditor"], 'left', 90)])
        cmds.formLayout(self.widgets["formLayout"], edit=1, af=[(self.widgets["checkBox1"], 'top', 218),
                                                                (self.widgets["checkBox1"], 'left', 230)])
        cmds.formLayout(self.widgets["formLayout"], edit=1, af=[(self.widgets["checkBox2"], 'top', 218),
                                                                (self.widgets["checkBox2"], 'left', 290)])

        cmds.formLayout(self.widgets["formLayout"], edit=1, af=[(self.widgets["iconTextCheckBox1"], 'top', 10),
                                                                (self.widgets["iconTextCheckBox1"], 'left', 400)])
        cmds.formLayout(self.widgets["formLayout"], edit=1, af=[(self.widgets["iconTextCheckBox2"], 'top', 60),
                                                                (self.widgets["iconTextCheckBox2"], 'left', 400)])
        cmds.formLayout(self.widgets["formLayout"], edit=1, af=[(self.widgets["iconTextCheckBox3"], 'top', 110),
                                                                (self.widgets["iconTextCheckBox3"], 'left', 400)])
        cmds.formLayout(self.widgets["formLayout"], edit=1, af=[(self.widgets["iconTextCheckBox4"], 'top', 160),
                                                                (self.widgets["iconTextCheckBox4"], 'left', 400)])
        cmds.formLayout(self.widgets["formLayout"], edit=1, af=[(self.widgets["iconTextCheckBox5"], 'top', 210),
                                                                (self.widgets["iconTextCheckBox5"], 'left', 400)])

        cmds.showWindow(self.widgets["window"])
        cmds.window(self.widgets["window"], edit=1, w=500, h=300)




    def inputDirectory(self, *args):

        inputPath = cmds.fileDialog2(dialogStyle=2, fileMode=3)[0]
        cmds.textField(self.widgets["inputTextField"], edit=1, text=inputPath)


    def outputDirectory(self, *args):

        outputPath = cmds.fileDialog2(dialogStyle=2, fileMode=3)[0]
        cmds.textField(self.widgets["outputTextField"], edit=1, text=outputPath)


    def showColorEditor(self, *args):

        rgbaColor = cmds.colorEditor()

        test = rgbaColor.split("  ")
        color_R = test[0]
        color_G = test[1]
        color_B = test[2].partition(" ")[0]

        cmds.canvas(self.widgets["swatch"], edit=1, rgbValue=(float(color_R), float(color_G), float(color_B)))


    def savePreset(self, *args):

        # get presets' values
        # floatFieldGrpValue = [float, float, float]
        floatFieldGrpValue = cmds.floatFieldGrp(self.widgets["floatField"], q=1, v=True)
        # floatSliderGrpValue = float
        floatSliderGrpValue = cmds.floatSliderGrp(self.widgets["floatSlider"], q=1, v=True)
        # radioButtonGrpValue = int
        radioButtonGrpValue = cmds.radioButtonGrp(self.widgets["radioButtonGrp"], q=1, select=True)
        # inputTextField = string
        inputTextFieldValue = cmds.textField(self.widgets["inputTextField"], q=1, text=True)
        # outputTextFieldValue = string
        outputTextFieldValue = cmds.textField(self.widgets["outputTextField"], q=1, text=True)
        # swatchValue = [float, float, float]
        swatchValue = cmds.canvas(self.widgets["swatch"], q=1, rgbValue=True)
        # checkBox#Value = boolean & iconTextCheckBox#Value = boolean
        checkBox1Value = cmds.checkBox(self.widgets["checkBox1"], q=1, value=True)
        checkBox2Value = cmds.checkBox(self.widgets["checkBox2"], q=1, value=True)
        iconTextCheckBox1Value = cmds.iconTextCheckBox(self.widgets["iconTextCheckBox1"], q=1, value=True)
        iconTextCheckBox2Value = cmds.iconTextCheckBox(self.widgets["iconTextCheckBox2"], q=1, value=True)
        iconTextCheckBox3Value = cmds.iconTextCheckBox(self.widgets["iconTextCheckBox3"], q=1, value=True)
        iconTextCheckBox4Value = cmds.iconTextCheckBox(self.widgets["iconTextCheckBox4"], q=1, value=True)
        iconTextCheckBox5Value = cmds.iconTextCheckBox(self.widgets["iconTextCheckBox5"], q=1, value=True)

        '''
        print floatSliderGrpValue
        print iconTextCheckBox1Value

        print swatchValue[0]
        print swatchValue[1]
        print swatchValue[2]


        print floatFieldGrpValue[0]
        print floatFieldGrpValue[1]
        print floatFieldGrpValue[2]
        '''

        # open file and write the presets' values

        filePath = cmds.internalVar(upd=1) + 'preset.txt'
        file = open(filePath, 'w')

        # write(controlCommandName, controlName, valueTypeName, value)
        # write(floatFieldGrp, floatField, v, floatFieldGrpValue)
        file.write("floatFieldGrp;" + "floatField;" + "value;" + str(floatFieldGrpValue)+"\n")

        file.write("floatSliderGrp;" + "floatSlider;" + "v;" + str(floatSliderGrpValue)+"\n")
        file.write("radioButtonGrp;" + "radioButtonGrp;" + "select;" + str(radioButtonGrpValue)+"\n")
        file.write("textField;" + "inputTextField;" + "text;" + str(inputTextFieldValue)+"\n")
        file.write("textField;" + "outputTextField;" + "text;" + str(outputTextFieldValue)+"\n")
        file.write("canvas;" + "swatch;" + "rgbValue;" + str(swatchValue)+"\n")
        file.write("checkBox;" + "checkBox1;" + "value;" + str(checkBox1Value)+"\n")
        file.write("checkBox;" + "checkBox2;" + "value;" + str(checkBox2Value)+"\n")
        file.write("iconTextCheckBox;" + "iconTextCheckBox1;" + "value;" + str(iconTextCheckBox1Value)+"\n")
        file.write("iconTextCheckBox;" + "iconTextCheckBox2;" + "value;" + str(iconTextCheckBox2Value)+"\n")
        file.write("iconTextCheckBox;" + "iconTextCheckBox3;" + "value;" + str(iconTextCheckBox3Value)+"\n")
        file.write("iconTextCheckBox;" + "iconTextCheckBox4;" + "value;" + str(iconTextCheckBox4Value)+"\n")
        file.write("iconTextCheckBox;" + "iconTextCheckBox5;" + "value;" + str(iconTextCheckBox5Value))


        file.close()

    def loadPreset(self, *args):

        filePath = cmds.internalVar(upd=1) + 'preset.txt'
        file = open(filePath, 'r')
        lines = file.readlines()

        for line in lines:

            linepart = line.split(";")
            controlCommandName = linepart[0]
            controlName = linepart[1]
            queryType = linepart[2]
            linepart[3] = linepart[3].partition("\n")[0]
            # print linepart[3]

            if controlCommandName == "floatFieldGrp":

                # partition linepart[3] into data1, data2, data3
                data1 = linepart[3].partition(", ")[0]
                data1 = data1.partition("[")[2]
                data2 = linepart[3].partition(", ")[2].partition(", ")[0]
                data3 = linepart[3].rpartition(", ")[2]
                data3 = data3.partition("]")[0]
                commandString = ("cmds." + controlCommandName + "(self.widgets[" + "\"" + controlName + "\"" + "],edit=1," + queryType + "=(" + data1+","+data2+","+data3+",0.0))")

                exec commandString

            elif controlCommandName == "canvas":

                data1 = linepart[3].partition(", ")[0]
                data1 = data1.partition("[")[2]
                data2 = linepart[3].partition(", ")[2].partition(", ")[0]
                data3 = linepart[3].rpartition(", ")[2]
                data3 = data3.partition("]")[0]

                commandString = ("cmds." + controlCommandName + "(self.widgets[" + "\"" + controlName + "\"" + "],edit=1," + queryType + "=(" + data1 + "," + data2 + "," + data3 + "))")

                exec commandString

            elif controlCommandName == "textField":

                commandString = ("cmds." + controlCommandName + "(self.widgets[" + "\"" + controlName + "\"" + "],edit=1," + queryType + "=" + "\"" + str(linepart[3]) + "\"" + ")")

                exec commandString

            else:
                commandString = ("cmds." + controlCommandName + "(self.widgets[" + "\"" + controlName + "\"" + "],edit=1," + queryType + "=" + linepart[3]  + ")")
                exec commandString

        file.close()



# Execute in Maya
PresetUI()