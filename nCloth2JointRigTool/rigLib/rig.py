import maya.cmds as cmds
import lib
from ..utils import name
from ..utils import distance

reload(lib)
reload(name)
reload(distance)


def build(jointVertexList, nucleus=None, simJointParent=''):

    #############
    # Mesh Part #
    #############
    meshName = name.removeNodeAttr(jointVertexList[0])

    skinMesh = cmds.duplicate(meshName)
    cmds.select(cl=1)
    skinMesh = cmds.rename(skinMesh, meshName + '_Skin')

    ##############
    # joint part #
    ##############
    simJointList = []
    for vertex in jointVertexList:
        # place joint to vertex
        vertexPos = cmds.xform(vertex, q=1, ws=1, t=1)

        joint = lib.createJoint(name=meshName)

        cmds.xform(joint['joint'], t=vertexPos, ws=1)
        simJointList.append(joint['joint'])

        cmds.select(cl=1)

        # set vertex
        closestVertex = distance.getClosestVertex(skinMesh, pos=vertexPos)

        cmds.setAttr(joint['joint'] + '.targetVertex', str(closestVertex), type='string')

        cmds.select(cl=1)

    #############
    # skin Part #
    #############
    if simJointParent:
        simJointRoot = cmds.joint(n=meshName + '_Jnt_P')

        if not cmds.attributeQuery('slaveJoint', node=simJointRoot, exists=1):
            cmds.addAttr(simJointRoot, ln='slaveJoint', at='message')

        cmds.select(cl=1)
        cmds.delete(cmds.parentConstraint(simJointParent, simJointRoot, mo=0))

        for joint in simJointList:
            cmds.parent(joint, simJointRoot)

        simJointList.append(simJointRoot)

    cmds.select(cl=1)

    # skin joints with skin Mesh
    skinCluster = cmds.skinCluster(simJointList[:], skinMesh, mi=4, n=skinMesh + '_skinCluster')
    cmds.select(cl=1)


    # set 100% skin weight of each simJoint and targetVertex
    if not simJointRoot:
        for joint in simJointList:
            vertex = cmds.getAttr(joint + '.targetVertex')

            cmds.skinPercent(skinCluster[0], vertex, transformValue=[(joint, 1.0)])

    else:
        for joint in simJointList[:-1]:
            vertex = cmds.getAttr(joint + '.targetVertex')
            cmds.skinPercent(skinCluster[0], vertex, transformValue=[(joint, 1.0)])

    cmds.select(cl=1)


    ###############
    # nCloth Part #
    ###############
    inputMeshTrans = name.removeNodeAttr(jointVertexList[0])
    inputMeshShape = cmds.listRelatives(inputMeshTrans, c=1, p=0, s=1)[0]
    cmds.setAttr(inputMeshTrans + '.v', 0)

    if not nucleus:
        nCloth_nucleus = lib.createNCloth(name=meshName)
    else:
        nCloth_nucleus = lib.createNCloth(name=meshName, nucleus=nucleus)

    worldMeshAttrIndex = lib.findSingleAvailableIndex(inputMeshShape + '.worldMesh')
    worldMeshAttrFull = inputMeshShape + '.worldMesh' + '[%s]' % worldMeshAttrIndex

    cmds.connectAttr(worldMeshAttrFull, nCloth_nucleus['nClothShape'] + '.inputMesh', f=1)

    # output mesh

    #outputMeshShape = cmds.createNode('mesh')
    #outputMeshTrans = cmds.listRelatives(outputMeshShape, c=0, p=1, s=0)[0]
    #outputMeshTrans = cmds.rename(outputMeshTrans, meshName + '_output')
    #outputMeshShape = cmds.listRelatives(outputMeshTrans, c=1, p=0, s=1)[0]

    outputMeshTrans = cmds.polyPlane(n= meshName + '_output')[0]
    outputMeshShape = cmds.listRelatives(outputMeshTrans, c=1, p=0, s=1)[0]

    # connect outputMesh to nCloth
    cmds.connectAttr(nCloth_nucleus['nClothShape'] + '.outputMesh', outputMeshShape + '.inMesh', f=1)

    ################
    # Emitter Part #
    ################
    emitterList = []
    for vertex in jointVertexList:
        outputMeshVertex = outputMeshTrans + '.' + name.getPureVertex(vertex)
        print outputMeshVertex

        emitterParticle = lib.createEmitter(vertex=outputMeshVertex, meshName=outputMeshTrans)

        cmds.setAttr(emitterParticle['particleShape'] + '.maxCount', 0)

        emitterList.append(emitterParticle['emitter'])

    # parentConstraint & connect attr
    for i in xrange(len(jointVertexList)):

        cmds.parentConstraint(emitterList[i], simJointList[i], mo=0)

        cmds.connectAttr(emitterList[i] + '.targetJoint', simJointList[i] + '.targetEmitter', f=1)

