import maya.cmds as cmds
import os

def UI():

    # CHECK WINDOW EXSITS
    if cmds.window("exampleUI", exists=1):
        cmds.deleteUI("exampleUI")

    # CREATE WINDOW
    window = cmds.window("exampleUI", title="Example UI",
                         w=300, h=300, mnb=0, mxb=0, sizeable=0)

    # CREATE MAIN LAYOUT
    mainLayout = cmds.columnLayout(w=300, h=300)

    # BANNER IMAGE
    imagePath = cmds.internalVar(upd=1) + "icons/ExamplePicture.jpg"
    cmds.image(w=300, h=100, image=imagePath)

    # CREATE PROJECT OPTION MENU
    cmds.separator(h=15)
    projectOptionMenu = cmds.optionMenu("projectOptionMenu",
                                        w=300, label="Choose a Project:    ",
                                        cc=populateCharacters)

    # POPULATE THE PROJECTS OPTION MENU
    populateProject()

    # CREATE CHARACTER OPTION MENU
    cmds.separator(h=15)
    characterOptionMenu = cmds.optionMenu("characterOptionMenu",
                                          w=300, label="Choose a Character:")

    # POPULATE THE CHARACTERS

    populateCharacters()

    # CREATE THE BUILD BUTTON
    cmds.separator(h=15)
    cmds.button(label="Build", w=300, h=50, c=build)
    cmds.separator(h=15)


    # SHOW WINDOW
    cmds.showWindow(window)


def populateProject():

    projectPath = cmds.internalVar(upd=True).rpartition("prefs")[0] +"Projects/"

    projects = os.listdir(projectPath)
    for project in projects:
        cmds.menuItem(label=project, parent="projectOptionMenu")


def populateCharacters(*args):

    menuItems = cmds.optionMenu("characterOptionMenu",
                                q=True, itemListLong=True)
    print menuItems

    if menuItems != None:
        for item in menuItems:
            print item
            cmds.deleteUI(item)



    selectProject = cmds.optionMenu("projectOptionMenu",
                                    q=True, v=True)

    projectPath = cmds.internalVar(upd=True).rpartition("prefs")[0] + "Projects/" + selectProject + "/"

    files = os.listdir(projectPath)

    characters = []

    for file in files:

        if file.rpartition(".")[2] == "mb":
            characters.append(file)

    for character in characters:

        niceName = character.rpartition(".")[0]
        cmds.menuItem(label=niceName, parent="characterOptionMenu")

    print menuItems


def build(*args):
    selectProject = cmds.optionMenu("projectOptionMenu",
                                    q=True, v=True)

    projectPath = cmds.internalVar(upd=True).rpartition("prefs")[0] + "Projects/" + selectProject + "/"
    selectCharacter = cmds.optionMenu("characterOptionMenu",
                                      q=True, v=True)
    fileName = projectPath + selectCharacter + ".mb"

    cmds.file(fileName, open=1, force=1, prompt=False)
    print "Opening file" + fileName





UI()
