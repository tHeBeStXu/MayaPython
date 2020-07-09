import maya.OpenMaya as om

sourceMeshName = 'polySurfaceShape7'
sourceMSelectionList = om.MSelectionList()
sourceMSelectionList.add(sourceMeshName)
sourceMDagPath = om.MDagPath()
sourceMSelectionList.getDagPath(0, sourceMDagPath)
sourceMFnMesh = om.MFnMesh(sourceMDagPath)

sourceVertexNormalMVector = om.MVector()
sourceMFnMesh.getVertexNormal(12, True,
                              sourceVertexNormalMVector,
                              om.MSpace.kWorld)


targetMeshName = 'polySurfaceShape9'
targetMSelectionList = om.MSelectionList()
targetMSelectionList.add(targetMeshName)
targetMDagPath = om.MDagPath()
targetMSelectionList.getDagPath(0, targetMDagPath)
targetMFnMesh = om.MFnMesh(targetMDagPath)

targetVertexIDMIntArray = om.MIntArray()
targetVertexIDMIntArray.append(344)

targetFaceIDMIntArray = om.MIntArray()
targetFaceIDMIntArray.append(321)

targetVertexNormalMVectorArray = om.MVectorArray()
targetVertexNormalMVectorArray.append(sourceVertexNormalMVector)


targetMFnMesh.setFaceVertexNormals(targetVertexNormalMVectorArray,
                                   targetFaceIDMIntArray,
                                   targetVertexIDMIntArray,
                                   om.MSpace.kWorld)
