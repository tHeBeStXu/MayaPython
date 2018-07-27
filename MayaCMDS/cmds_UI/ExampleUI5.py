import maya.cmds as cmds


class testUI():

    def __init__(self):
        self.windowName = "testWindow"
        self.windowWidth = 400
        self.windowHeight = 500
        self.createUI(self.windowName, self.windowWidth, self.windowHeight)

    def createUI(self, windowName, windowWidth, windowHeight):

        if cmds.window(windowName, exists=True):
            cmds.deleteUI(windowName)

        window = cmds.window(windowName, title=windowName, mnb=False, mxb=False,
                             h=windowHeight, w=windowWidth)

        self.createCustom()

        cmds.showWindow(window)

    def createCustom(self):
        pass


class myUI(testUI):

    def __init__(self):
        self.windowName = "myUI"
        self.windowWidth = 300
        self.windowHeight = 600
        self.createUI(self.windowName, self.windowWidth, self.windowHeight)
myUI()