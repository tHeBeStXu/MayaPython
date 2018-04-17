from maya import cmds



def createGear(teeth=10, lengh=0.3 ):
    """
    This function will create a gear with the given parameters
    :param teeth: the number of teeth to create
    :param lengh: the length of the teeth
    :return: A tuple of transform,constructor and extrude
    """
    # Teeth are every alternate face, so spans = teeth * 2
    spans = teeth * 2

    transform, constructor = cmds.polyPipe(subdivisionAxis=spans)

    sideFaces = range(spans * 2, spans * 3, 2)

    cmds.select(cl=1)

    for face in sideFaces:
        cmds.select('%s.f[%s]' % (transform, face), add=1)

    extrude = cmds.polyExtrudeFacet(localTranslateZ=lengh)[0]

    return transform, constructor, extrude

def changeTeeth(constructor, extrude, teeth=10, lengh=0.3):

    spans = teeth * 2

    cmds.polyPipe(constructor, edit=1, subdivisionAxis=spans)

    sideFaces = range(spans * 2, spans * 3, 2)

    faceNames = []

    for face in sideFaces:
        faceName='f%s' % (face)

        faceNames.append(faceName)

    cmds.setAttr('%s.inputComponets' % (extrude),
                 len(faceNames),
                 *faceNames,
                 type="componentList")

    cmds.polyExtrudeFacet(extrude, edit=1, localTranslateZ=lengh)
