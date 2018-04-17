from maya import cmds

SUFFIXES = {
    "mesh": "geo",
    "joint": "jnt",
    "camera": None
}


def rename(selection=0):
    """
    This function will rename any objects to have the corrent suffix
    :param selection:Whether or not we use the current suffix
    :return: A list of all the objects we operated on
    """

    selectOBJ = cmds.ls(sl=selection, dag=1, long=1)

    if selection and not selectOBJ:
        raise RuntimeError("You don't have anyting selected!")

    selectOBJ.sort(key=len, reverse=1)

    for select in selectOBJ:
        shortName = select.split("|")[-1]
        children = cmds.listRelatives(select, children=1, fullPath=1) or []

        if len(children) == 1:
            child = children[0]
            childType = cmds.objectType(child)
        else:
            childType = cmds.objectType(select)

        suffix = SUFFIXES.get(childType, )

        # for camera
        if not suffix:
            continue
        # prevent repeat suffixing
        if select.endswith('_'+suffix):
            continue

        newName = "%s_%s" % (shortName, suffix)

        cmds.rename(select, newName)

        index = selectOBJ.index(select)

        selectOBJ[index] = select.replace(shortName, newName)

    return selectOBJ