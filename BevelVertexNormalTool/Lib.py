import maya.OpenMaya as om


def getMeshName():
    """
    Get Selected Mesh Name
    :return: str, selected mesh name
    """
    mSelectionList = om.MSelectionList()
    om.MGlobal.getActiveSelectionList(mSelectionList)
    mDagPath = om.MDagPath()
    mSelectionList.getDagPath(0, mDagPath)
    mDagPath.extendToShape()

    return mDagPath.fullPathName()


def getDagPath(shapeName):
    """
    Get dagPath of a shape
    :param shapeName: str, name of the shape node
    :return: MDagPath, dagPath of the shape node.
    """
    mSelectionList = om.MSelectionList()
    dagPath = om.MDagPath()
    mSelectionList.add(shapeName)
    mSelectionList.getDagPath(0, dagPath)
    return dagPath


def getSelectedFacesIDs():
    """
    Get Selected Faces Indices
    :return: list, indies of a list
    """
    indicesList = []

    mSelectionList = om.MSelectionList()
    om.MGlobal.getActiveSelectionList(mSelectionList)
    mItSelectionList = om.MItSelectionList(mSelectionList)

    while not mItSelectionList.isDone():
        dagpath = om.MDagPath()
        component = om.MObject()
        mItSelectionList.getDagPath(dagpath, component)

        compFn = om.MFnSingleIndexedComponent(component)
        indices = om.MIntArray()
        compFn.getElements(indices)

        for index in xrange(indices.length()):
            indicesList.append(indices[index])

        mItSelectionList.next()

    if indicesList:
        return indicesList


def getConnectedFacesIDs():
    """

    :return:
    """
    mSelectionList = om.MSelectionList()
    om.MGlobal.getActiveSelectionList(mSelectionList)
    mItSelectionList = om.MItSelectionList(mSelectionList)
    intArrayList = []

    initFaceIndexList = []
    while not mItSelectionList.isDone():
        component = om.MObject()
        dagPath = om.MDagPath()
        mItSelectionList.getDagPath(dagPath, component)

        compFn = om.MFnSingleIndexedComponent(component)
        indices = om.MIntArray()
        compFn.getElements(indices)

        for index in xrange(indices.length()):
            initFaceIndexList.append(indices[index])

        mItMeshPolygon = om.MItMeshPolygon(dagPath, component)

        while not mItMeshPolygon.isDone():
            mIntArray = om.MIntArray()
            mItMeshPolygon.getConnectedFaces(mIntArray)

            intArrayList.append(mIntArray)

            mItMeshPolygon.next()
        mItSelectionList.next()

    rawIndexList = []
    for mIntArray in intArrayList:
        # print mIntArray
        for index in xrange(mIntArray.length()):
            rawIndexList.append(mIntArray[index])

    for rawIndex in rawIndexList:
        if rawIndex in initFaceIndexList:
            rawIndexList.remove(rawIndex)

    if rawIndexList:
        return rawIndexList


def getVertexIDs(shapeName, faceIDs):
    """
    get the vertex IDs by face IDs
    :param shapeName: str, shape name
    :param faceIDs: list, list of the faceIDs
    :return: list, unique vertex IDs
    """
    rawVertexIDsList = []

    faceArray = om.MIntArray()
    for id in faceIDs:
        faceArray.append(id)

    mFnSingleIndexComponent = om.MFnSingleIndexedComponent()
    component = mFnSingleIndexComponent.create(om.MFn.kMeshPolygonComponent)
    mFnSingleIndexComponent.addElements(faceArray)

    dagPath = getDagPath(shapeName=shapeName)
    mSelectionList = om.MSelectionList()
    mSelectionList.add(dagPath, component)

    mItSelectionList = om.MItSelectionList(mSelectionList)
    while not mItSelectionList.isDone():
        component = om.MObject()
        dagPath = om.MDagPath()
        mItSelectionList.getDagPath(dagPath, component)

        mItMeshFaceVertex = om.MItMeshFaceVertex(dagPath, component)
        while not mItMeshFaceVertex.isDone():
            rawVertexIDsList.append(mItMeshFaceVertex.vertId())

            mItMeshFaceVertex.next()
        mItSelectionList.next()

    vertexIDsList = list(set(rawVertexIDsList))

    return vertexIDsList


# print getVertexIDs(shapeName='pCubeShape1', faceIDs=[107, 112, 117])

def calculateAndSetVertexNormal(shapeName, vertexIDs, initFacesIDs, connectedFacesIDs):
    """
    Get Connected Faces By Specified Vertex IDs
    :param shapeName: str, shape name
    :param vertexIDs: list, vertex IDs
    :param initFacesIDs: list, selected faces at 1 step
    :param connectedFacesIDs: list, confirmed connected faces
    :return:None
    """
    vertexIntArray = om.MIntArray()
    for id in vertexIDs:
        vertexIntArray.append(id)

    mFnSingleIndexComponent = om.MFnSingleIndexedComponent()
    component = mFnSingleIndexComponent.create(om.MFn.kMeshVertComponent)
    mFnSingleIndexComponent.addElements(vertexIntArray)

    meshDagPath = getDagPath(shapeName=shapeName)
    mSelectionList = om.MSelectionList()
    mSelectionList.add(meshDagPath, component)

    mItSelectionList = om.MItSelectionList(mSelectionList)
    while not mItSelectionList.isDone():
        component = om.MObject()
        vertexDagPath = om.MDagPath()
        mItSelectionList.getDagPath(vertexDagPath, component)

        MItMeshVertex = om.MItMeshVertex(vertexDagPath, component)

        while not MItMeshVertex.isDone():
            facesIntArray = om.MIntArray()
            MItMeshVertex.getConnectedFaces(facesIntArray)

            # Get Unique Faces IDs
            uniqueFacesIDs = om.MIntArray()
            for index in xrange(facesIntArray.length()):
                if facesIntArray[index] not in initFacesIDs and \
                        facesIntArray[index] in connectedFacesIDs:
                    uniqueFacesIDs.append(facesIntArray[index])

            # Get Faces Normals
            polyMFnSingleIndexComponent = om.MFnSingleIndexedComponent()
            polyComponent = polyMFnSingleIndexComponent.create(om.MFn.kMeshPolygonComponent)
            polyMFnSingleIndexComponent.addElements(uniqueFacesIDs)

            dagPath = getDagPath(shapeName=shapeName)
            polyMSelectionList = om.MSelectionList()
            polyMSelectionList.add(dagPath, polyComponent)

            polyMItSelectionList = om.MItSelectionList(polyMSelectionList)

            normalArrayPerVertex = om.MVectorArray()

            while not polyMItSelectionList.isDone():
                component = om.MObject()
                dagPath = om.MDagPath()
                polyMItSelectionList.getDagPath(dagPath, component)

                polyMItMeshPolygon = om.MItMeshPolygon(dagPath, component)
                while not polyMItMeshPolygon.isDone():
                    normal = om.MVector()
                    polyMItMeshPolygon.getNormal(normal, om.MSpace.kWorld)

                    normalArrayPerVertex.append(normal)

                    polyMItMeshPolygon.next()
                polyMItSelectionList.next()

            # calculate average normal
            targetVertexNormal = om.MVector(0.0, 0.0, 0.0)
            for index in xrange(normalArrayPerVertex.length()):
                targetVertexNormal += normalArrayPerVertex[index]

            targetVertexNormal = targetVertexNormal / normalArrayPerVertex.length()
            targetVertexNormal.normalize()
            # print str(targetVertexNormal.x) + '\t' + str(targetVertexNormal.y) + '\t' + str(targetVertexNormal.z)

            ################################
            # set the normal to the vertex #
            ################################
            meshDagPath = getDagPath(shapeName=shapeName)
            vertexIndex = MItMeshVertex.index()

            mFnMesh = om.MFnMesh(meshDagPath)
            mFnMesh.setVertexNormal(targetVertexNormal, vertexIndex, om.MSpace.kWorld)

            MItMeshVertex.next()
        mItSelectionList.next()

