import maya.cmds as cmds
from ..utils import name


def createEmitter(vertex):
    """
    create a point emitter
    :param vertex: str, vertex name
    :return: dict(str), point Emitter, meshTransform Node.
    """

    cmds.select(cl=1)

    # create emitter on selected vertex

    cmds.select(vertex)
    emitterList = cmds.emitter(n=vertex+'EM')

    emitter = emitterList[-1]
    meshTrans = emitterList[0]

    cmds.select(cl=1)

    if not cmds.attributeQuery('bindMesh', node=emitter, exists=1):
        cmds.addAttr(emitter, ln='bindMesh', at='message')

    if not cmds.attributeQuery('bindEmitter', node=meshTrans, exists=1):
        cmds.addAttr(meshTrans, ln='bindEmitter', at='message')

    cmds.connectAttr(meshTrans + '.bindEmitter', emitter + '.bindMesh', f=1)

    return {'emitter': emitter,
            'meshTrans': meshTrans}


def createNCloth(name):
    """
    create nCloth on a mesh
    :param name: str, name of the nCloth node
    :return:
    """
    nClothShape = cmds.createNode('nCloth')
    nClothTrans = cmds.listRelatives(nClothShape, c=0, p=1, s=0, type='transform')[0]

    nClothTrans = cmds.rename(nClothTrans, name + '_nCloth')
    nClothShape = cmds.listRelatives(nClothTrans, c=1, p=0, s=1, type='nCloth')[0]

    return {'nClothShape': nClothShape,
            'nClothTrans': nClothTrans}


def createNucleus(name):
    """
    create nucleus by given name
    :param name: str, name of the nucleus
    :return: nucleus
    """
    nucleus = cmds.createNode('nucleus', n=name + '_Nucleus')

    return {'nucleus': nucleus}


def connectNucleusAndNCloth(nCloth, nucleus=None):
    """
    connect nucleus to nCloth
    :param nucleus: str, nucleus
    :param nCloth: str, nCloth shape
    :return:
    """

    if not nucleus:
        nucleus = createNucleus(name=name.removeSuffix(nCloth))

    nucleusInputActiveIndex = findSingleAvailableIndex(nucleus + '.inputActive')
    nucleusInputActiveAttr = nucleus + '.inputActive' + '[%s]' % nucleusInputActiveIndex

    nucleusInputActiveStartIndex = findSingleAvailableIndex(nucleus + '.inputActiveStart')
    nucleusInputActiveStartAttr = nucleus + '.inputActiveStart' + '[%s]' % nucleusInputActiveStartIndex

    nucleusOutputObjectsIndex = findSingleAvailableIndex(nucleus + '.outputObjects')
    nucleusOutputObjectsAttr = nucleus + '.outputObjects' + '[%s]' % nucleusOutputObjectsIndex

    # connect attr
    cmds.connectAttr(nCloth + '.currentState', nucleusInputActiveAttr, f=1)
    cmds.connectAttr(nCloth + '.startState', nucleusInputActiveStartAttr, f=1)
    cmds.connectAttr(nucleus + '.startFrame', nCloth + '.startFrame', f=1)
    cmds.connectAttr(nucleusOutputObjectsAttr, nCloth + '.nextState', f=1)


########################################################################################################################
# find same multi attr index method


def findSingleAvailableIndex(attr):
    """
    find the first free array index of multi-attribute
    :param attr: str, attribute without index
    :return: int, index of free array.
    """
    index = 0

    while index < 10000:
        fullAttr = attr + '[%s]' % (str(index))

        inputAttr = cmds.listConnections(fullAttr, plugs=1)

        if not inputAttr:
            return index

        index += 1


def findDoubleAvailableIndex(firstAttr, secondAttr):
    """
    find the common free array index of 3 multi-attributes.
    :param firstAttr: str, first attribute without index.
    :param secondAttr:str, second attribute without index.
    :return:int, index of free array.
    """
    index = 0

    while index < 10000:
        firstFullAttr = firstAttr + '[%s]' % (str(index))
        secondFullAttr = secondAttr + '[%s]' % (str(index))

        firstInputAttr = cmds.listConnections(firstFullAttr, plugs=1)
        secondInputAttr = cmds.listConnections(secondFullAttr, plugs=1)

        if not firstInputAttr:
            if not secondInputAttr:
                return index

        index += 1






