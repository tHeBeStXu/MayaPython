"""
Iterator : Model Iterator definations
1. MItDag : is used to iterate a DAG.
2. MItDependencyGraph : is used to iterate DependencyGraph.
3. MItMeshEdge : is used to iterate Mesh Edges of polygon surfaces.
4. MItMeshVertex : is used to iterate Mesh Vertexes of polygon surfaces.
5. MItMeshPolygon : is used to iterate faces of the polygon mesh.
6. MItSurfaceCV : works on the CVs of NURBS
"""
import maya.OpenMaya as openmaya

# Make a Model_Iterator_Dag
# kDepthFirst is for Depth of Path FIRST; kBreadthFirst is for Width of same level FIRST
# The 2nd parameter is for filtering, openmaya.MFn.kInvalid disables the filtering.
dagIterator = openmaya.MItDag(openmaya.MItDag.kDepthFirst, openmaya.MFn.kInvalid)

# Create a DAG_node function set to operate the
dagNodeFn = openmaya.MFnDagNode()

while (not dagIterator.isDone()):
    # currentItem() will return a mobject handle pointing to the DAG_node
    currentObj = dagIterator.currentItem()
    depth = dagIterator.depth()

    # Set the currentObj as the input of the DAG_node function set
    dagNodeFn.setObject(currentObj)

    # Because of the MObject's method is not sufficient,
    # attach the MObject to the Function Set as input to get the name of each object
    name = dagNodeFn.name()
    # Get the type of the each object
    type = currentObj.apiTypeStr()
    # Get the path of each object
    path = dagNodeFn.fullPathName()

    printOut = ""
    for i in range(0, depth):
        printOut += "------->"

    printOut += name + " : " + type
    print printOut

    # Shift our iterator to the next set of data
    dagIterator.next()






