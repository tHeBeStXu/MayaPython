import maya.api.OpenMaya as om
import maya.api.OpenMayaAnim as oma
import maya.cmds as cmds

selectedLattice = 'ffd1Lattice'

latticeShape = cmds.listRelatives(selectedLattice, type='lattice')[0]

ffd = cmds.listConnections(latticeShape, type='ffd')[0]

skinCluster = cmds.listConnections(latticeShape, type='skinCluster')[0]

geometry = cmds.lattice(latticeShape, q=1, g=1)

jointList = cmds.skinCluster(skinCluster, q=1, inf=1)


meshMselection = om.MSelectionList()
meshMselection.add(geometry[0])
meshMDagPath = meshMselection.getDagPath(0)

meshMFn = om.MFnMesh(meshMDagPath)

geoPosition = meshMFn.getPoints(om.MSpace.kObject)

weightList = []
for index in range(len(jointList)):
    jointMSelection = om.MSelectionList()
    jointMSelection.add(jointList[index])

    jointDagPath = jointMSelection.getDagPath(0)

    # transform 1 unit to get the weight. weight = MOVE_LENGTH / 1
    mFnTransform = om.MFnTransform(jointDagPath)
    world = mFnTransform.translation(om.MSpace.kWorld)
    moveWorld = om.MVector(world.x + 1, world.y, world.z)

    mFnTransform.setTranslation(moveWorld, om.MSpace.kWorld)

    movePosition = meshMFn.getPoints(om.MSpace.kObject)
    jointWeights = []
    for vertexIndex in range(len(movePosition)):
        length = movePosition[vertexIndex] - geoPosition[vertexIndex]
        weight = length.length()
        jointWeights.append(weight)

    #                   joint1            joint2
    # weightList = [[0.2, 0.3, ...], [0.3, 0.2, ...]]
    weightList.append(jointWeights)

    # translate back to original position
    mFnTransform.setTranslation(world, om.MSpace.kWorld)

# bind skin
geoSkinCluster = cmds.skinCluster(jointList, geometry)[0]

geoSkinMSelectionList = om.MSelectionList()
geoSkinMSelectionList.add(geoSkinCluster)
geoSkinMObject = geoSkinMSelectionList.getDependNode(0)

mFnGeoSkinCluster = oma.MFnSkinCluster(geoSkinMObject)

vertexIndexList = range(len(geoPosition))
mFnIndexComponent = om.MFnSingleIndexedComponent()
vertexComponent = mFnIndexComponent.create(om.MFn.kMeshVertComponent)
mFnIndexComponent.addElements(vertexIndexList)

influenceObjects = mFnGeoSkinCluster.influenceObjects()
influenceIntList = om.MIntArray()
for each in influenceObjects:
    currentIndex = mFnGeoSkinCluster.indexForInfluenceObject(each)
    influenceIntList.append(currentIndex)

mWeightList = om.MDoubleArray()
for wIndex in range(len(weightList[0])):
    for jntIndex in range(len(weightList)):
        mWeightList.append(weightList[jntIndex][wIndex])


mFnGeoSkinCluster.setWeights(meshMDagPath, vertexComponent, influenceIntList, mWeightList)
