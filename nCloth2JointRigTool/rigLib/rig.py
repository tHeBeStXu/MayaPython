import maya.cmds as cmds
import lib
from ..utils import name

reload(lib)
reload(name)


def build(jointVertexList, nucleus=None):

    ###############
    # nCloth Part #
    ###############
    inputMeshTrans = name.removeNodeAttr(jointVertexList[0])
    inputMeshShape = cmds.listRelatives(inputMeshTrans, c=1, p=0, s=1)[0]

    if not nucleus:
        nCloth_nucleus = lib.createNCloth(name=inputMeshTrans)
    else:
        nCloth_nucleus = lib.createNCloth(name=inputMeshTrans, nucleus=nucleus)

    # output mesh
    worldMeshAttrIndex = lib.findSingleAvailableIndex(inputMeshShape + '.worldMesh')
    worldMeshAttrFull = inputMeshShape + '.worldMesh' + '[%s]' % worldMeshAttrIndex

    cmds.connectAttr(worldMeshAttrFull, nCloth_nucleus['nClothShape'] + '.inputMesh', f=1)

    outputMeshShape = cmds.createNode('Mesh')
    outputMeshTrans = cmds.listRelatives(outputMeshShape, c=0, p=1, s=0, type='transform')[0]
    outputMeshTrans = cmds.rename(outputMeshTrans, outputMeshTrans + '_output')
    outputMeshShape = cmds.listRelatives(outputMeshTrans, c=1, p=0, s=1)[0]

    # connect outputMesh to nCloth
    cmds.connectAttr(nCloth_nucleus['nClothShape'] + '.outputMesh', outputMeshShape + '.inMesh', f=1)

    ################
    # Emitter Part #
    ################
    simJointList = []
    for i in jointVertexList:

        emitter = lib.createEmitter(vertex=i, meshName=inputMeshTrans)

        joint = cmds.joint(n=inputMeshTrans + '_Jnt')
        cmds.select(cl=1)

        cmds.parentConstraint(emitter['emitter'], joint, mo=0)

        simJointList.append(joint)






