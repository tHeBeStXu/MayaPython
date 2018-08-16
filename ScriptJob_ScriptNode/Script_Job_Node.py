"""
scriptJob and scriptNode example
"""
import maya.cmds as cmds

codeStr = '''
def colorChange():

    objAttr = 'pSphere1.Color'

    if cmds.getAttr(objAttr) == 0:
        cmds.polyColorPerVertex(r=0.0, g=1.0, b=0.0, a=1.0, cdo=1)
    elif cmds.getAttr(objAttr) == 1:
        cmds.polyColorPerVertex(r=0.0, g=0.0, b=1.0, a=1.0, cdo=1)
    elif cmds.getAttr(objAttr) == 2:
        cmds.polyColorPerVertex(r=1.0, g=0.0, b=0.0, a=1.0, cdo=1)

cmds.scriptJob(attributeChange=['pSphere1.Color', colorChange])
'''

cmds.scriptNode(st=2, bs=codeStr.replace("'''", "''"), n='sphere_ColorChange', stp='python')


