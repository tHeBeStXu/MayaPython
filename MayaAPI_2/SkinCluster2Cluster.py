import maya.api.OpenMaya as om
import maya.api.OpenMayaAnim as oma
import maya.cmds as cmds

currentJoints = cmds.ls(sl=1, type='joint')
if currentJoints:
    for joint in currentJoints:
        currentSkinCluster = cmds.listConnections(joint, type='skinCluster')
        if currentSkinCluster:

            # Get skin cluster MObject
            skinClusterSelection = om.MSelectionList()
            skinClusterSelection.add(currentSkinCluster[0])
            skinClusterMObject = skinClusterSelection.getDependNode(0)

            # Get joint MDagPath
            jointSelectionList = om.MSelectionList()
            jointSelectionList.add(joint)
            jointDagPath = jointSelectionList.getDagPath(0)

            # Get MFnSkinCluster
            MFnSkinCluster = oma.MFnSkinCluster(skinClusterMObject)
            # Get dataWeights
            # weightData = (verticesMSelectionList, weightsMDoubleArray)
            weightDataList = MFnSkinCluster.getPointsAffectedByInfluence(jointDagPath)

            verticesMSelection = weightDataList[0]
            vertexWeightMDoubleArray = weightDataList[1]

            vertexComponent = verticesMSelection.getComponent(0)

            MFnSingleIndexComponent = om.MFnSingleIndexedComponent(vertexComponent[1])

            vertexIndexList = MFnSingleIndexComponent.getElements()

            vertexList = verticesMSelection.getSelectionStrings()

            # create new cluster
            cluster = cmds.cluster(vertexList, n='%s_Cls' % joint)

            # set cluster weights
            for index in range(len(vertexIndexList)):
                currentVertex = vertexIndexList[index]
                currentWeight = vertexWeightMDoubleArray[index]

                cmds.setAttr('%s.weightList[0].w[%s]' % (cluster[0], currentVertex), currentWeight)

            # change the cluster position
            clusterShape = cmds.listRelatives(cluster[1], s=1)

            translationWS = cmds.xform(joint, q=1, ws=1, t=1)
            cmds.setAttr('%s.rotatePivotX' % cluster[1], translationWS[0])
            cmds.setAttr('%s.rotatePivotY' % cluster[1], translationWS[1])
            cmds.setAttr('%s.rotatePivotZ' % cluster[1], translationWS[2])

            cmds.setAttr('%s.scalePivotX' % cluster[1], translationWS[0])
            cmds.setAttr('%s.scalePivotY' % cluster[1], translationWS[1])
            cmds.setAttr('%s.scalePivotZ' % cluster[1], translationWS[2])

            cmds.setAttr('%s.originX' % clusterShape[0], translationWS[0])
            cmds.setAttr('%s.originY' % clusterShape[0], translationWS[1])
            cmds.setAttr('%s.originZ' % clusterShape[0], translationWS[2])

        else:
            print 'No skin cluster found!\nPlease check your BLS'
