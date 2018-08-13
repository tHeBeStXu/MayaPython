import maya.cmds as cmds

from . import fbxExport, base
reload(base)


def connectFBXExportNodeToMeshes(fbxExportNode, meshes):
    """
    Purpose:        to connect meshes to export node so the exporter can find them
    Procedure:      check to make sure meshes and fbxExportNode is valid, check for attribute 'exportMeshes'
                    if no attribute, add it. Then connect attributes.
    Presumption:    fbxExportNode is a exportNode, and is a list of transform nodes for polygon meshes
    :param fbxExportNode: string, fbxExportNode for exporting
    :param meshes: string, meshes connect to fbxExportNode
    :return: None
    """
    if cmds.objExists(fbxExportNode):
        if not cmds.objExists(fbxExportNode + '.exportMeshes'):
            fbxExport.addFBXNodeAttrs(fbxExportNode)

        for curMesh in meshes:
            if cmds.objExists(curMesh):
                if not cmds.objExists(curMesh + '.exportMeshes'):
                    base.tagForMeshExport(curMesh)

                cmds.connectAttr(fbxExportNode + '.exportMeshes', curMesh + '.exportMeshes', force=1)


def disconnectFBXExportNodeToMeshes(fbxExportNode, meshes):
    """
    Purpose:        to disconnect the message attribute between export node and mesh
    Procedure:      iterate through list of meshes and if mesh exists, disconnect
    Presumption:    fbxExportNode and meshes are connect by exportMeshes message attribute
    :param fbxExportNode: string, fbxExportNode for exporting
    :param meshes: string, meshes disconnect from fbxExportNode
    :return: None
    """
    if cmds.objExists(fbxExportNode):
        for curMesh in meshes:
            if cmds.objExists(curMesh):
                cmds.disconnectAttr(fbxExportNode + '.exportMeshes', curMesh + '.exportMeshes')


def returnConnectedMeshes(fbxExportNode):
    """
    Purpose:        return a list of all meshes connected to the export node
    Procedure:      listConnections to exportMeshes attribute
    Presumption:    exportMeshes attribute is used to connect to export meshes, exportMeshes is valid
    :param fbxExportNode: string, fbxExportNode for exporting
    :return: the meshes which connected to the fbxExportNode
    """
    meshes = cmds.listConnections(fbxExportNode + '.exportMeshes', source=0, destination=1)
    return meshes