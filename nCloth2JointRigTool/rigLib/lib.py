import maya.cmds as cmds
from ..utils import name


def createJoint(name):
    cmds.select(cl=1)

    joint = cmds.joint(n=name + '_Jnt_#')
    cmds.select(cl=1)

    if not cmds.attributeQuery('slaveJoint', node=joint, exists=1):
        cmds.addAttr(joint, ln='slaveJoint', at='message')

    if not cmds.attributeQuery('targetEmitter', node=joint, exists=1):
        cmds.addAttr(joint, ln='targetEmitter', at='message')

    if not cmds.attributeQuery('targetVertex', node=joint, exists=1):
        cmds.addAttr(joint, ln='targetVertex', dt='string')

    return {'joint': joint}


def createEmitter(vertex,
                  meshName):
    """
    create a point emitter
    :param vertex: str, vertex name
    :return: dict(str), point Emitter, meshTransform Node.
    """

    cmds.select(cl=1)

    cmds.select(vertex)
    # create emitter on selected vertex
    emitterList = cmds.emitter(n=vertex + '_EM', type='omni', r=100, sro=0, nuv=0, cye='none', cyi=1, spd=1, srn=0, nsp=1,
                               tsp=0, mxd=0, mnd=0, dx=1, dy=0, dz=0, sp=0)
    particle = cmds.particle(n=vertex + '_PTC')
    cmds.connectDynamic(particle[0], em=emitterList[-1])
    cmds.select(cl=1)

    emitter = emitterList[-1]

    cmds.select(cl=1)

    if not cmds.attributeQuery('bindMesh', node=emitter, exists=1):
        cmds.addAttr(emitter, ln='bindMesh', at='message')

    if not cmds.attributeQuery('bindEmitter', node=meshName, exists=1):
        cmds.addAttr(meshName, ln='bindEmitter', at='message')

    if not cmds.attributeQuery('targetJoint', node=emitter, exists=1):
        cmds.addAttr(emitter, ln='targetJoint', exists=1)

    cmds.connectAttr(meshName + '.bindEmitter', emitter + '.bindMesh', f=1)

    return {'emitter': emitter,
            'particle': particle[0],
            'particleShape': particle[-1]}


def createNucleus(name):
    """
    create nucleus by given name
    :param name: str, name of the nucleus
    :return: nucleus
    """
    nucleus = cmds.createNode('nucleus', n=name + '_Nucleus')

    # connect attr
    cmds.connectAttr('time1.outTime', nucleus + '.currentTime')

    # add attr
    if not cmds.attributeQuery('nucleus', node=nucleus, exists=1):
        cmds.addAttr(nucleus, longName='nucleus', at='message', multi=1)
    cmds.select(cl=1)

    return nucleus


def createNCloth(name, nucleus=None):
    """
    connect nucleus to nCloth
    :param nucleus: str, nucleus
    :param nCloth: str, nCloth shape
    :return:
    """

    nucleus = nucleus or createNucleus(name=name)

    nClothShape = cmds.createNode('nCloth')
    cmds.select(cl=1)
    nClothTrans = cmds.listRelatives(nClothShape, c=0, p=1, s=0, type='transform')[0]

    nClothTrans = cmds.rename(nClothTrans, name + '_nCloth')
    nClothShape = cmds.listRelatives(nClothTrans, c=1, p=0, s=1, type='nCloth')[0]

    nucleusInputActiveIndex = findSingleAvailableIndex(nucleus + '.inputActive')
    nucleusInputActiveAttr = nucleus + '.inputActive' + '[%s]' % nucleusInputActiveIndex

    nucleusInputActiveStartIndex = findSingleAvailableIndex(nucleus + '.inputActiveStart')
    nucleusInputActiveStartAttr = nucleus + '.inputActiveStart' + '[%s]' % nucleusInputActiveStartIndex

    nucleusOutputObjectsIndex = findSingleAvailableIndex(nucleus + '.outputObjects')
    nucleusOutputObjectsAttr = nucleus + '.outputObjects' + '[%s]' % nucleusOutputObjectsIndex

    # connect attr
    cmds.connectAttr(nClothShape + '.currentState', nucleusInputActiveAttr, f=1)
    cmds.connectAttr(nClothShape + '.startState', nucleusInputActiveStartAttr, f=1)
    cmds.connectAttr(nucleus + '.startFrame', nClothShape + '.startFrame', f=1)
    cmds.connectAttr(nucleusOutputObjectsAttr, nClothShape + '.nextState', f=1)

    cmds.connectAttr('time1.outTime', nClothShape + '.currentTime', f=1)

    # add attr
    if not cmds.attributeQuery('nCloth', node=nClothShape, exists=1):
        cmds.addAttr(nClothShape, ln='nCloth', at='message', multi=1)

    if not cmds.attributeQuery('nucleus', node=nucleus, exists=1):
        cmds.addAttr(nucleus, ln='nucleus', at='message', multi=1)

    cmds.select(cl=1)

    return {'nucleus': nucleus,
            'nClothShape': nClothShape,
            'nClothTrans': nClothTrans}

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

        if not firstInputAttr and not secondInputAttr:
            return index

        index += 1






