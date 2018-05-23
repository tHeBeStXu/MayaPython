import maya.cmds as cmds
import maya.mel as mel
import string


def tagForOrigin(node):
    """
    Purpose:        tag the given node with the origin attribute and set to true
    Procedure:      if the object exists and the attribute doesn't exists, add the attribute and set it to TRUE
    Presumption:    None
    :param node:    the joint node for tagging the '.origin' attribute
    :return:        None
    """
    if cmds.objExists(node) and not cmds.objExists(node + '.origin'):
        cmds.addAttr(node, shortName='org', longName='origin', at='bool')
        cmds.setAttr(node + '.origin', True)


def tagForMeshExport(mesh):
    """
    Purpose:        add attribute to the mesh so exporter can find them
    Procedure:      if object exists, and the attribute doesn't, add message attribute
    Presumption:    None
    :param mesh:    the mesh for tagging '.exportMeshes' attribute
    :return:        None
    """
    if cmds.objExists(mesh) and not cmds.objExists(mesh + '.exportMeshes'):
        cmds.addAttr(mesh, shortName='xms', longName='exportMeshes', at='message')


def tagForExportNode(node):
    """
    Purpose:        add attribute to the node so exporter can find export definitions
    Procedure:      if object exists, and the attribute doesn't, add message attribute
    Presumption:    None
    :param node:    the node for tagging '.exportNode' attribute
    :return:        None
    """
    if cmds.objExists(node) and not cmds.objExists(node + '.exportNode'):
        cmds.addAttr(node, shortName='xnd', longName='exportNode', at='message')


def returnOrigin(nameSpace):
    """
    Purpose:        return the origin of the given namespace
    Procedure:      if ns is not empty string, list all joints with the matching namespace, else list all joints
                    for list of joints, look for the origin attribute and if it is set to true. If found, return name of
                    else return 'Error'
    Presumption:    origin attribute is on a joint, 'Error' is not a valid joint name.
    :param nameSpace: all the joint nodes
    :return:        1. all the joint nodes with tagging '.origin' attribute and set TRUE
                    2. "Error"
    """
    joints = []

    if nameSpace:
        joints = cmds.ls((nameSpace + ':*'), type='joint')
    else:
        joints = cmds.ls(type='joint')


    if len(joints):
        for curJoint in joints:
            if cmds.objExists(curJoint + '.origin') and cmds.getAttr(curJoint + '.origin'):
                return curJoint

    return "Error"


def findMeshWithBlendShapes(nameSpace):
    """
    Purpose:        return the meshes connected to blend_shape node
    Procedure:      get a list of blend_shape node,
                    follow those connections to the mesh shape node
                    traverse up the hierarchy to find parent transform node
    Presumption:    character has a valid namespace
    :param nameSpace: all the blendShapes nodes
    :return:        a list of all the meshes with blendShape
    """

    returnArray = []

    blendshapes = cmds.ls((nameSpace + ':*'), type='blendShape')

    for curBlendShape in blendshapes:
        downStreamNodes = cmds.listHistory(curBlendShape, future=1)
        for curNode in downStreamNodes:
            if cmds.objectType(curNode, isType='mesh'):
                parents = cmds.listRelatives(curNode, parent=1)
                returnArray.append(parents[0])

    return returnArray


def clearGarbage():
    """
    Purpose:        removes all nodes taged as garbage
    Procedure:      list all transforms in the scene
                    iterate through list, anything with 'deleteMe' attribute
    Presumption:    the deleteMe attribute is name of the attribute signifying garbage
    :return:    None
    """
    list = cmds.ls(tr=1)

    for cur in list:
        if cmds.objExists(cur + '.deleteMe'):
            cmds.delete(cur)


def tagForGabage(node):
    """
    Purpose:        tag object for being garbage
    Procedure:      if node is valid object and attribute does not exists, add deleteMe attribute
    Presumption:    None
    :param node:    any type node
    :return:        None
    """
    if cmds.objExists(node) and not cmds.objExists(node + '.deleteMe'):
        cmds.addAttr(node, shortName='del', longName='deleteMe', at='bool')
        cmds.setAttr(node + '.deleteMe', 1)


def unlockJointTransforms(root):
    """
    unlock all the joints' transform attr
    :param root: string, root joint of the skeleton hierarchy
    :return: None
    """
    hierarchy = cmds.listRelatives(root, ad=1, f=1)
    hierarchy.append(root)

    for cur in hierarchy:
        for transform in 'trs':
            for axis in 'xyz':
                cmds.setAttr(cur + '.%s%s' % (transform, axis), lock=0)


def connectAttrs(sourceNode, destNode, transform):
    """
    Purpose:        to connect given node to other given node via specified transform
    Procedure:      call connectAttr
    Presumption:    assume 2 nodes exist and transform type is valid
    :param sourceNode: string, sourceNode for connection attr
    :param destNode: stirng, destinationNode for connection attr
    :param transform: translate, rotate and scale
    :return: None
    """
    for axis in 'XYZ':
        cmds.connectAttr(sourceNode + '.' + transform + axis, destNode + '.' + transform + axis)


