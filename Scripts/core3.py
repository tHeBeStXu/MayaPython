import maya.OpenMaya as om

sourceMeshName = 'polySurfaceShape7'
sourceMSelectionList = om.MSelectionList()
sourceMSelectionList.add(sourceMeshName)
sourceMDagPath = om.MDagPath()
sourceMSelectionList.getDagPath(0, sourceMDagPath)
sourceMFnMesh = om.MFnMesh(sourceMDagPath)

sourceVertexNormalMVector = om.MVector()

#
sourceMFnMesh.getVertexNormal(9,
                              sourceVertexNormalMVector,
                              om.MSpace.kWorld)

print sourceVertexNormalMVector.x
print sourceVertexNormalMVector.y
print sourceVertexNormalMVector.z






