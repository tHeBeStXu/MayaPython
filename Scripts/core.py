import maya.cmds as cmds
import maya.OpenMaya as om

sourceMSelectionList = om.MSelectionList()
sourceMSelectionList.add('polySurfaceShape7')
sourceMDagPath = om.MDagPath()
sourceMSelectionList.getDagPath(0, sourceMDagPath)
sourceMFnMesh = om.MFnMesh(sourceMDagPath)

sourceNormalMVector = om.MVector()
sourceMFnMesh.getFaceVertexNormal(1335, 14, sourceNormalMVector, om.MSpace.kWorld)

print 'x: %s, y:%s, z:%s' % (str(sourceNormalMVector.x),
                             str(sourceNormalMVector.y),
                             str(sourceNormalMVector.z))

targetMSelectionList = om.MSelectionList()
targetMSelectionList.add('polySurfaceShape9')
targetMDagPath = om.MDagPath()
targetMSelectionList.getDagPath(0, targetMDagPath)
targetMFnMesh = om.MFnMesh(targetMDagPath)

targetMFnMesh.setFaceVertexNormal(sourceNormalMVector,
                                  322,
                                  346,
                                  om.MSpace.kWorld)









