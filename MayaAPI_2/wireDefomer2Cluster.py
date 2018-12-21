import maya.api.OpenMaya as om
import maya.cmds as cmds

deformList = cmds.ls(sl=1)

for deformObject in deformList:
    meshShape = 'pCylinderShape1'

    # Get DagPath
    meshMSelectionList = om.MSelectionList()
    meshMSelectionList.add(meshShape)
    meshMDagPath = meshMSelectionList.getDagPath(0)

    deformMSelectionList = om.MSelectionList()
    deformMSelectionList.add(deformObject)
    deformMDagPath = deformMSelectionList.getDagPath(0)

    # Get original position of vertex
    meshMFn = om.MFnMesh(meshMDagPath)
    originPosList = meshMFn.getPoints(om.MSpace.kObject)

    # Move one unit in x direction for calculating weight
    MFnTransform = om.MFnTransform(deformMDagPath)
    translationMVector = om.MVector(1, 0, 0)
    MFnTransform.setTranslation(translationMVector, om.MSpace.kTransform)

    deformPosList = meshMFn.getPoints(om.MSpace.kObject)

    # Move back to original position
    zeroMVector = om.MVector(0, 0, 0)
    MFnTransform.setTranslation(zeroMVector, om.MSpace.kTransform)

    weightList = []
    for index in range(len(originPosList)):
        originMVector = om.MVector(originPosList[index])
        deformMVector = om.MVector(deformPosList[index])
        weightMVector = deformMVector - originMVector
        weight = weightMVector.length()
        weightList.append(weight)

    # Create new cluster
    cluster = cmds.cluster(meshShape, n='newCluster_#')

    # Set cluster weight
    for index in range(len(weightList)):
        cmds.setAttr('%s.weightList[0].w[%s]' % (cluster[0], index), weightList[index])

    # change cluster position
    translationWS = cmds.xform(deformObject, q=1, ws=1, piv=1)
    clusterShape = cmds.listRelatives(cluster[1], s=1)
    cmds.setAttr('%s.rotatePivotX' % cluster[1], translationWS[0])
    cmds.setAttr('%s.rotatePivotY' % cluster[1], translationWS[1])
    cmds.setAttr('%s.rotatePivotZ' % cluster[1], translationWS[2])

    cmds.setAttr('%s.scalePivotX' % cluster[1], translationWS[0])
    cmds.setAttr('%s.scalePivotY' % cluster[1], translationWS[1])
    cmds.setAttr('%s.scalePivotZ' % cluster[1], translationWS[2])

    cmds.setAttr('%s.originX' % clusterShape[0], translationWS[0])
    cmds.setAttr('%s.originY' % clusterShape[0], translationWS[1])
    cmds.setAttr('%s.originZ' % clusterShape[0], translationWS[2])

print 'Successfully transfer wire deformer weights to clusters'
