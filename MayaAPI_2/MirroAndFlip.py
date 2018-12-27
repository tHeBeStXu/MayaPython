import maya.api.OpenMaya as om

objectMSL = om.MSelectionList()
objectMSL.add('pSphereShape2')
objectDagPath = objectMSL.getDagPath(0)

baseMSL = om.MSelectionList()
baseMSL.add('pSphereShape1')
baseDagPath = baseMSL.getDagPath(0)

objectMFnMesh = om.MFnMesh(objectDagPath)
objectVertexList = objectMFnMesh.getPoints(om.MSpace.kObject)

baseMFnMesh = om.MFnMesh(baseDagPath)
baseVertexList = baseMFnMesh.getPoints(om.MSpace.kObject)

#
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
    # objectMFnMesh.setPoint(currentVertexID, oppMovePosition, om.MSpace.kObject)

    # set flip
    objectMFnMesh.setPoint(moveIndexList[index], xyz, om.MSpace.kObject)

objectMFnMesh.updateSurface()

