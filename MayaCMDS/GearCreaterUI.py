from maya import cmds


class BaseUI(object):
    def __init__(self):
        self.windowName = "Tweener Window"

    def show(self):
        if cmds.window(self.windowName, query=1, exists=1):
            cmds.deleteUI(self.windowName)

        self.window = cmds.window(self.windowName)

        self.buildUI()
        cmds.showWindow()

    def buildUI(self):
        pass

    def reset(self, *args):
        pass

    def close(self, *args):
        cmds.deleteUI(self.window)

class GearCreaterUI(BaseUI):

    def __init__(self):
        self.windowName = "Gear Creater"

    def buildUI(self):
        self.columnLayout=cmds.columnLayout()
        self.row = cmds.rowLayout(numberOfColumns=2)
        self.textInput = cmds.intField(min=5, max=30, value=15)
        cmds.button(label="Create", command=self.create)

        cmds.setParent(self.columnLayout)
        cmds.button(label="Close", command=self.close)

    def create(self, *args):
        self.tooth = cmds.intField(self.textInput, query=1, value=1)
        print "Create a " + str(self.tooth) + " Gear"

