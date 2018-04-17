from maya import cmds

def tween(percentage, obj=None, attrs=None, selection=True):

    if not obj and not selection:
        raise ValueError("No object given to tween")

    if not obj:
        obj=cmds.ls(selection=1)[0]

    if not attrs:
        attrs=cmds.listAttr(obj, keyable=1)

    currentTime = cmds.currentTime(query=1)

    for attr in attrs:
        attrFull = '%s.%s' % (obj, attr)
        keyframes = cmds.keyframe(attrFull, query=1)

        if not keyframes:
            continue

        previousFrames = [frame for frame in keyframes if frame < currentTime]

        laterFrames = [frame for frame in keyframes if frame > currentTime]

        if not previousFrames and not laterFrames:
            continue

        previousFrame = max(previousFrames) if previousFrames else None

        nextFrame = min(laterFrames) if laterFrames else None

        if not previousFrames or not nextFrame:
            continue

        previousValue = cmds.getAttr(attrFull, time=previousFrame)
        nextValue = cmds.getAttr(attrFull, time=nextFrame)

        difference = nextValue - previousValue
        weightedDifference = (difference * percentage) / 100.0
        currentValue = previousValue + weightedDifference

        cmds.setKeyframe(attrFull, time=currentTime, value=currentValue)


class tweenWindow(object):

    def __init__(self):
        self.windowName = "Tweener Window"

    def show(self):
        if cmds.window(self.windowName, query=1, exists=1):
            cmds.deleteUI(self.windowName)

        self.window = cmds.window(self.windowName)

        self.buildUI()
        cmds.showWindow()

    def buildUI(self):
        self.columnLayout = cmds.columnLayout()

        self.row = cmds.rowLayout(numberOfColumns=2)
        self.slider = cmds.floatSlider(min=0, max=100, value=50, step=1, changeCommand=tween)

        cmds.button(label="Reset", command=self.reset)

        cmds.setParent(self.columnLayout)
        cmds.button(label="Close", command=self.close)

    def reset(self, *args):
        print "Reset UI"
        print args

        cmds.floatSlider(self.slider, edit=1, value=50 )

    def close(self, *args):
        cmds.deleteUI(self.window)