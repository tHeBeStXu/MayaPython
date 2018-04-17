from maya import cmds

class Gear(object):
    """
    This class is for creating gear and mod
    """

    def __init__(self):

        self.extrude = None
        self.transform = None
        self.constructor = None

    def createGear(self, teeth=10, length=0.3):
        """
        This function will create a gear with the given parameters
        :param teeth: the number of teeth to create
        :param lengh: the length of the teeth
        :return: A tuple of transform,constructor and extrude
        """
        # Teeth are every alternate face, so spans = teeth * 2
        spans = teeth * 2

        self.transform, self.constructor = cmds.polyPipe(subdivisionsAxis=spans)

        sideFaces = range(spans * 2, spans * 3, 2)

        cmds.select(cl=1)

        for face in sideFaces:
            cmds.select('%s.f[%s]' % (self.transform, face), add=1)

        self.extrude = cmds.polyExtrudeFacet(localTranslateZ=length)[0]

        cmds.select(cl=1)

        # return self.transform, self.constructor, self.extrude

    def modGear(self, teeth=10, length=0.3):

        spans = teeth * 2

        cmds.polyPipe(self.constructor, edit=1, subdivisionsAxis=spans)

        sideFacesNumber = range(spans*2, spans*3, 2)

        faceNames = []

        for face in sideFacesNumber:
            faceName = 'f[%s]' % (face)

            faceNames.append(faceName)

        cmds.setAttr('%s.inputComponents' % (self.extrude),
                     len(faceNames),
                     *faceNames,
                     type="componentList")

        cmds.polyExtrudeFacet(self.extrude, edit=1, ltz=length)
