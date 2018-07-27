import maya.cmds as cmds

# give a callback function in button with target argument
from functools import partial
import os

def UI():
    imagePath = cmds.internalVar(upd=True) + "/icons/FileIcon.jpg"

    if cmds.window("ExampleBatchUI", exists=True):
        cmds.deleteUI("ExampleBatchUI")

    window = cmds.window("ExampleBatchUI",
                         w=500, h=280,
                         mnb=False, mxb=False,
                         title="Example of Batch",
                         sizeable=False)

    # CREATE OUR MAIN LAYOUT
    mainLayout = cmds.columnLayout(w=500, h=280)

    # CREATE OUR ROW COLUMN LAYOUT
    cmds.separator(h=15)
    rowColumnLayout = cmds.rowColumnLayout(numberOfColumns=2,
                                           columnWidth=[(1, 450), (2, 50)],
                                           columnOffset=[(1, "both", 5),
                                                         (2, "both", 10)])


    # INPUT FIELD
    cmds.text(l="Text File : ", align="left")
    cmds.text(l="")

    inputField = cmds.textField("inputField", w=440)
    cmds.symbolButton(w=30, h=30, image=imagePath,
                      c=partial(browseFilePath, 3, None, "inputField"))
    # partial():give a callback function in button with target arguments


    # TEXT FILE FIELD
    cmds.separator(h=20, style="none")
    cmds.separator(h=20, style="none")

    cmds.text(l="InputDirectory : ", align="left")
    cmds.text(l="")

    textInputField = cmds.textField("textInputField", w=440)
    cmds.symbolButton(w=30, h=30, image=imagePath,
                      c=partial(browseFilePath, 1, "*.txt", "textInputField"))


    # OUTPUT FIELD
    cmds.separator(h=20, style="none")
    cmds.separator(h=20, style="none")

    cmds.text(l="OutputDirectory : ", align="left")
    cmds.text(l="")

    textInputField = cmds.textField("outputField", w=440)
    cmds.symbolButton(w=30, h=30, image=imagePath,
                      c=partial(browseFilePath, 3, None, "outputField"))


    # PROCESS BUTTON
    cmds.separator(h=20, style="none")
    cmds.separator(h=20, style="none")
    cmds.button("processButton", w=500, h=50, l="Process",
                parent=mainLayout, c=process)
    cmds.separator(h=15, parent=mainLayout)


    # SHOW WINDOW
    cmds.showWindow("ExampleBatchUI")


def browseFilePath(fileMode, fileFilter, textField, *args):

    returnPath = cmds.fileDialog2(fileMode=fileMode, fileFilter=fileFilter, dialogStyle=2)[0]

    cmds.textField(textField, edit=True, text=returnPath)

def process(*args):

    # GET INPUT
    inputDirectory = cmds.textField("inputField", q=True, text=True)
    textFile = cmds.textField("textInputField", q=True, text=True)
    outputDirectory = cmds.textField("outputField", q=True, text=True)

    files = os.listdir(inputDirectory)
    # FILTER FILES
    for file in files:
        if file.rpartition(".")[2] == "mb":

            # MAIN LOOP
            fileName = inputDirectory + "/" +file
            cmds.file(fileName, open=True, force=True, ignoreVersion=True, prompt=False)

            # DO STUFF
            print "Doing stuff..."

            # SAVE THE FILE IN THE OUTPUT DIRECTORY
            outputFile = outputDirectory + "/" + file
            cmds.file(rename=outputFile)
            cmds.file(save=True, force=True)
UI()
