import maya.api.OpenMaya as om
import json


def importUV(filePath):
    dataFile = open(filePath, 'r')

    uvData = json.load(dataFile)

    dataFile.close()

    shapeNode = uvData['shapeNode']
    uvSets = uvData['uvSets']

    # Shape node name to MDagPath
    mSelection = om.MSelectionList()
    mSelection.add(shapeNode)
    mDagPath = mSelection.getDagPath(0)

    # MFnMesh
    mFnMesh = om.MFnMesh(mDagPath)

    # remove exists uv set from shape nodes
    existsUVSetNames = mFnMesh.getUVSetNames()

    for index, setName in enumerate(existsUVSetNames):
        if index > 0:
            mFnMesh.deleteUVSet(setName)

    sortedIndex = sorted(uvSets.keys())
    for index in sortedIndex:
        content = uvSets[index]

        setName = content['setName']
        uValue = content['uValue']
        vValue = content['vValue']
        uvNumbers = content['uvNumbers']
        uvIDs = content['uvIDs']

        if int(index) == 0:
            newSetName = setName
        else:
            newSetName = mFnMesh.createUVSet(setName)

        # set uValue and vValue
        mFnMesh.setUVs(uValue, vValue, newSetName)

        # set uv coordinaget to mesh's face vertices
        mFnMesh.assignUVs(uvNumbers, uvIDs, newSetName)

    # redrawn shape node
    mFnMesh.updateSurface()
