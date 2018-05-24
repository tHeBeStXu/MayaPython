import maya.cmds as cmds

from CustomExporter import base
reload(base)


def copyAndConnectSkeleton(origin):
    """
    Purpose:        to copy the bind skeleton and connect the copy to the original bind
    Procedure:      duplicate hierarchy
                    delete everything that is not a joint
                    unlock all the joints
                    connect the translates, rotates and the scales
                    parent copy to the world
                    add '.deleteMe' attr
    Presumption:    No joints are children of anything but other joints
    :param origin: origin joint of the skeleton hierarchy
    :return: a list of duplicate origin joints hierarchy which transform connected and has '.deleteMe' attr
    """
    newHierarchy = []

    if origin != 'Error' and cmds.objExists(origin):
        dupHierarchy = cmds.duplicate(origin)
        tempHierarchy = cmds.listRelatives(dupHierarchy[0], ad=1, f=1)

        for cur in tempHierarchy:
            if cmds.objExists(cur):
                if cmds.objectType(cur) != 'joint':
                    cmds.delete(cur)

        base.unlockJointTransforms(dupHierarchy[0])

        originHierarchy = cmds.listRelatives(origin, ad=1, type='joint')
        originHierarchy.append(origin)

        newHierarchy = cmds.listRelatives(dupHierarchy[0], ad=1, type='joint')
        newHierarchy.append(dupHierarchy[0])

        for index in range(len(originHierarchy)):
            base.connectAttrs(originHierarchy[index], newHierarchy[index], 'translate')
            base.connectAttrs(originHierarchy[index], newHierarchy[index], 'rotate')
            base.connectAttrs(originHierarchy[index], newHierarchy[index], 'scale')

        cmds.parent(dupHierarchy[0], world=1)
        base.tagForGabage(dupHierarchy[0])

    return newHierarchy


def tranformToOriginPoint(origin, startFrame, endFrame, zeroOrigin):
    """
    Purpose:        translate export skeleton to originPoint. May or may not kill origin animation depending on input
    Procedure:      bake the animation onto our origin
                    create an animLayer
                    animLayer will either be additive or overwrite depending on input
                    add '.deleteMe' attr to animLayer
                    move to origin
    Presumptions:   origin is valid, end frame is greater than start frame, zeroOrigin is boolen
    :param origin: origin Joint
    :param startFrame: float, startFrame
    :param endFrame: float, endFrame
    :param zeroOrigin: bool, zero origin or not
    :return: None
    """
    cmds.bakeResults(origin, t=(startFrame, endFrame), at=['rx', 'ry', 'rz', 'tx', 'ty', 'tz', 'sx', 'sy', 'sz'], hi='none')

    cmds.select(cl=1)
    cmds.select(origin)

    newAnimLayer = ''

    if zeroOrigin:
        newAnimLayer = cmds.animLayer(aso=1, mute=0, solo=0, override=1, passthrough=1, lock=0)
        cmds.setAttr(newAnimLayer + '.rotationAccumulationMode', 0)
        cmds.setAttr(newAnimLayer + '.scaleAccumulationMode', 1)

    else:
        newAnimLayer = cmds.animLayer(aso=1, mute=0, solo=0, override=0, passthrough=0, lock=0)

    base.tagForGabage(newAnimLayer)

    # Turn anim layer on
    cmds.animLayer(newAnimLayer, edit=1, weight=1)
    cmds.setKeyframe(newAnimLayer + '.weight')

    # Move origin animation to world origin
    cmds.setAttr(origin + '.translate', 0, 0, 0)
    cmds.setAttr(origin + '.rotate', 0, 0, 0)

    cmds.setKeyframe(origin, al=newAnimLayer, t=startFrame)
