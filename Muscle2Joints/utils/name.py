def removeSuffix(name):
    """
    Remove suffix from given name string
    :param name: given name string to process
    :return: str, name without suffix
    """

    edits = name.split('.')

    if len(edits) < 2:
        return name

    suffix = '.' + edits[-1]
    nameNoSuffix = name[:-len(suffix)]

    return nameNoSuffix


def removePrefix(name):
    """
    remove prefix of the string
    :param name: str, name of the string
    :return:str, name without prefix
    """
    edits = name.split('.')

    if len(edits) < 2:
        return name

    prefix = edits[-1] + '.'
    nameNoSuffix = name[len(prefix):]

    return nameNoSuffix
