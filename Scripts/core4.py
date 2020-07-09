import maya.cmds as mc


def copyNormal():
    vertex =mc.ls(sl=1,fl=1)
    global vertexNormal
    vertexNormal=mc.polyNormalPerVertex(q=1, xyz=1)


def pasteNormal():
    vertex =mc.ls(sl=1,fl=1)
    mc.polyNormalPerVertex(xyz=(vertexNormal[0],vertexNormal[1],vertexNormal[2]))



copyNormal()

pasteNormal()