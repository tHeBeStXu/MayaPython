import maya.api.OpenMaya as om

# transform object
objectMSL = om.MSelectionList()
objectMSL.add('pSphereShape2')
objectDagPath = objectMSL.getDagPath(0)

# base object
baseMSL = om.MSelectionList()
baseMSL.add('pSphereShape1')
baseDagPath = baseMSL.getDagPath(0)

# get MFnMesh of both objects
objectMFnMesh = om.MFnMesh(objectDagPath)
objectVertexList = objectMFnMesh.getPoints(om.MSpace.kObject)

baseMFnMesh = om.MFnMesh(baseDagPath)
baseVertexList = baseMFnMesh.getPoints(om.MSpace.kObject)

# Find the different vertices index between two objects
# moveVertexList = []
moveBaseVertexList = []
moveOjbectVertexList = []
moveIndexList = []
for index in range(len(objectVertexList)):
    baseVertexPosition = baseVertexList[index]
    objectVertexPosition = objectVertexList[index]

    if baseVertexPosition != objectVertexPosition:
        # moveVertexList.append('pSphereShape2.vtx[%i]' % index)
        moveBaseVertexList.append(baseVertexPosition)
        moveOjbectVertexList.append(objectVertexPosition)
        moveIndexList.append(index)

# Find the target vertices' indices for transforming on the opposite side
baseMITMeshPoly = om.MItMeshPolygon(baseDagPath)
axis = [-1, 1, 1]
# oppVertexIDList = []
for index in range(len(moveBaseVertexList)):
    xyz = moveBaseVertexList[index]
    opp_xyz = om.MPoint(xyz.x * axis[0], xyz.y * axis[1], xyz.z * axis[2])

    closestPoint, faceID = baseMFnMesh.getClosestPoint(opp_xyz, om.MSpace.kObject)

    baseMITMeshPoly.setIndex(faceID)
    faceVertexList = baseMITMeshPoly.getVertices()

    MVectorLengthList = []
    for eachVertex in faceVertexList:
        oppVertexPosition = baseMFnMesh.getPoint(eachVertex, om.MSpace.kObject)
        oppMVector = om.MVector(oppVertexPosition)
        mirrorMVector = om.MVector(opp_xyz)

        lengthMVector = oppMVector - mirrorMVector
        length = lengthMVector.length()
        MVectorLengthList.append(length)

    closestVertex = min(MVectorLengthList)
    vertexIndex = MVectorLengthList.index(closestVertex)
    currentVertexID = faceVertexList[vertexIndex]
    # oppVertexIDList.append('pSphereShape2.vtx[%i]' % currentVertexID)

    moveVertex = moveOjbectVertexList[index]

    oppMovePosition = om.MPoint(moveVertex.x * axis[0], moveVertex.y * axis[1], moveVertex.z * axis[2])

    # set mirror
    objectMFnMesh.setPoint(currentVertexID, oppMovePosition, om.MSpace.kObject)

    # set flip
    # baseMFnMesh.setPoint(moveIndexList[index], xyz, om.MSpace.kObject)

# After transforming, be true to update the surface drawing.
objectMFnMesh.updateSurface()
