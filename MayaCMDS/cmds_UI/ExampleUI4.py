import maya.cmds as cmds
import os
from functools import partial


widget = {}

def UI():

    if cmds.dockControl("myToolbarDock", exists=True):
        cmds.deleteUI("myToolbarDock")

    widget["window"] = cmds.window(mnb=False, mxb=False, title="Toolbar")
    widget["scrollLayout"] = cmds.scrollLayout(horizontalScrollBarThickness=0)
    widget["mainLayout"] = cmds.columnLayout(adj=True, parent=widget["scrollLayout"])

    # find icons and create symbol button for each icon

    populateIcons()

    # create a dock
    widget["dock"] = cmds.dockControl("myToolbarDock", label="ToolBar Dock", area='left',
                                      content=widget["window"],
                                      allowedArea='left')


def populateIcons():

    iconPath = cmds.internalVar(upd=True) + "/icons/Tools/"

    icons = os.listdir(iconPath)

    categories = []
    for icon in icons:
        categoryName = icon.partition("__")[0]
        categories.append(categoryName)

    # print set(categories)
    categoryNames = list(set(categories))
    # print categoryNames

    for name in categoryNames:
        # create frameLayout
        widget[(name + "_frameLayout")] = cmds.frameLayout(label=name,
                                                           collapsable=True,
                                                           parent=widget["mainLayout"])
        widget[(name + "_rowColumnLayout")] = cmds.rowColumnLayout(nc=3,
                                                                  parent=widget[(name + "_frameLayout")])


    for icon in icons:
        iconName = icon.partition(".")[0]
        category = icon.partition("__")[0]
        command = icon.partition("__")[2].partition(".")[0]
        # print command
        widget[(iconName +"_button")] = cmds.symbolButton(w=50, h=50,
                                                          image=(iconPath + icon),
                                                          parent=widget[category + "_rowColumnLayout"],
                                                          c=partial(runMethod, command))


def runMethod(method, *args):

    try:
        exec(method + "()")
    except NameError:
        cmds.warning(method + "() NOT Exists")

def spaceLocator():

    cmds.spaceLocator()





UI()