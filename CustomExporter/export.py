import maya.cmds as cmds
import maya.mel as mel
import base
import string


def returnFBXExportNodes(origin):
    """
    Purpose:        return all export nodes connected to given origin
    Procedure:      if origin is valid and has the exportNode attribute,
                    return list of export nodes connected to it
    Presumptions:   only export nodes are connected to exportNode attribute
    :return:
    """
    exportNodeList = []

    if cmds.objExists(origin + '.exportNode'):
        exportNodeList = cmds.listConnections(origin + '.exportNode')

    return exportNodeList


def connectFBXExportNodeToOrigin(exportNode, origin):
    """
    Purpose:        connect the fbx export node to the origin
    Procedure:      check if attribute exist and nodes are valid
                    if they are, connect attributes
    Presumptions:   None
    :param exportNode:
    :param origin:
    :return:
    """
    if not cmds.objExists(origin) and cmds.objExists(exportNode):
        if not cmds.objExists(origin + '.exportNode'):
            base.tagForExportNode(origin)

        if not cmds.objExists(exportNode + '.exportNode'):
            addFBXNodeAttrs(exportNode)

        cmds.connectAttr(origin + '.exportNode', exportNode + '.exportNode')




def deleteFBXExportNode(exportNode):
    """
    Purpose:        delete given export node
    Procedure:      if object exists, delete
    Presumptions:   node
    :param exportNode:
    :return:
    """
    if cmds.objExists(exportNode):
        cmds.delete(exportNode)


def addFBXNodeAttrs(fbxExportNode):
    """
    Purpose:        to add the attribute to the export node to store our export settings
    Procedure:      for each attribute we want to add, check if it exists
                    if it doesn't exist, add it
    Presumption:    assume fbxExportNode is a valid object
    :param fbxExportNode:
    :return:
    """
    if not cmds.attributeQuery('export', node=fbxExportNode, exists=1):
        cmds.addAttr(fbxExportNode, longName='export', at='bool')

    if not cmds.attributeQuery('moveToOrigin', node=fbxExportNode, exists=1):
        cmds.addAttr(fbxExportNode, longName='moveToOrigin', at='bool')

    if not cmds.attributeQuery('zeroOrigin', node=fbxExportNode, exists=1):
        cmds.addAttr(fbxExportNode, longName='zeroOrigin', at='bool')

    if not cmds.attributeQuery('exportName', node=fbxExportNode, exists=1):
        cmds.addAttr(fbxExportNode, longName='exportName', dt='string')

    if not cmds.attributeQuery('useSubRange', node=fbxExportNode, exists=1):
        cmds.addAttr(fbxExportNode, longName='useSubRange', at='bool')

    if not cmds.attributeQuery('startFrame', node=fbxExportNode, exists=1):
        cmds.addAttr(fbxExportNode, longName='startFrame', at='float')

    if not cmds.attributeQuery('endFrame', node=fbxExportNode, exists=1):
        cmds.addAttr(fbxExportNode, longName='endFrame', at='float')

    if not cmds.attributeQuery('exportMeshes', node=fbxExportNode, exists=1):
        cmds.addAttr(fbxExportNode, longName='exportMeshes', at='message')

    if not cmds.attributeQuery('exportNode', node=fbxExportNode, exists=1):
        cmds.addAttr(fbxExportNode, shortName='xnd', longName='exportNode', at='message')

    if not cmds.attributeQuery('animLayers', node=fbxExportNode, exists=1):
        cmds.addAttr(fbxExportNode, longName='animLayers', dt='string')


def createFBXExportNode(characterName):
    """
    Purpose:        create the export node to store our export settings
    Procedure:      create an empty transform node
                    we will send it to addFBXNodeAttrs to add the needed attributes
    Presumption:    None
    :param characterName:
    :return: fbxExportNode with attr '.export' set True
    """
    fbxExportNode = cmds.group(em=1, name=characterName + 'FBXExportNode#')
    addFBXNodeAttrs(fbxExportNode)
    cmds.setAttr(fbxExportNode + '.export', 1)
    return fbxExportNode

