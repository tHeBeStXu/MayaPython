import maya.cmds as cmds

attrList = ['MaxHandle', 'UDP3DSMAX', 'currentUVSet',
            'mrFBXASC032displacementFBXASC032edgeFBXASC032length',
            'mrFBXASC032displacementFBXASC032maxFBXASC032displace',
            'mrFBXASC032displacementFBXASC032method',
            'mrFBXASC032displacementFBXASC032parametricFBXASC032subdivisionFBXASC032level',
            'mrFBXASC032displacementFBXASC032smoothingFBXASC032on',
            'mrFBXASC032displacementFBXASC032useFBXASC032globalFBXASC032settings',
            'mrFBXASC032displacementFBXASC032viewFBXASC032dependent']

selectionList = cmds.ls(sl=1, long=1)

for node in selectionList:
    for attr in attrList:
        if cmds.attributeQuery(attr, node=node, exists=1):
            cmds.deleteAttr(node, at=attr)

