import maya.api.OpenMaya as om
import maya.cmds as cmds

# get soft selection range and influence
softSelection = om.MGlobal.getRichSelection()
richSelection = om.MRichSelection(softSelection)

selectionList = richSelection.getSelection()

component = selectionList.getComponent(0)

componentIndex = om.MFnSingleIndexedComponent(component[1])

vertexList = componentIndex.getElements()

weightList = {}

for index in range(len(vertexList)):
    weight = componentIndex.weight(index)
    influence = weight.influence
    weightList.setdefault(vertexList[index], influence)

# set soft selection and influence to new cluster
rangeVertex = selectionList.getSelectionStrings()
myCluster = cmds.cluster(rangeVertex, n='Cluster1')

for eachWeight in weightList:
    currentVertex = eachWeight
    currentWeight = weightList[eachWeight]
    cmds.setAttr('%s.weightList[0].w[%i]' % (myCluster[0], currentVertex), currentWeight)



