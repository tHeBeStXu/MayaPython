import maya.api.OpenMaya as om
import json


def exportUV(shapeName,
             filePath):
    """
    Export UVs of the shape node
    :param shapeName: str, shape node name
    :param filePath: str, export file path
    :return: None
    """
    om.MSelectionList()

    mSelection = om.MSelectionList()

    mSelection.add(shapeName)

    mDagPath = mSelection.getDagPath(0)

    mFnMesh = om.MFnMesh(mDagPath)

    # Get all uv set name
    uvSetName = mFnMesh.getUVSetNames()

    uvData = {}

    for index, name in enumerate(uvSetName):
        # get u_values and v_Values
        uValue, vValue = mFnMesh.getUVs(name)

        # get number of uvs assigned to each face of the mesh
        # get face vertices uv ids
        uvNumbers, uvIDs = mFnMesh.getAssignedUVs(uvSetName)

        # store uv values to dict variable
        currentSet = {'setName': uvSetName,
                      'uValue': list(uValue),
                      'vValue': list(vValue),
                      'uvNumbers': list(uvNumbers),
                      'uvIDs': list(uvIDs)
                      }

        uvData.setdefault(index, currentSet)

    # final data
    finalData = {'uvSets': uvData,
                 'shapeNode': mFnMesh.name().encode()}

    # write data to file
    with open(filePath, 'w') as writeFile:
        writeFile.write(json.dumps(finalData, indent=4))

    return True
