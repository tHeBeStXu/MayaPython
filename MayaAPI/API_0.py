"""
Basics of OpenMaya
"""
import maya.OpenMaya as openmaya

# Create a MSelectionList instance and add the target object "pPlane1"
mSel = openmaya.MSelectionList()
mSel.add("pPlane1")

# Create a MObject instance and a MDagPath instance
mObj = openmaya.MObject()
mDagPath = openmaya.MDagPath()

# Store the DependNode data of the MSelectionList[0] to mObj instance by .getDagPath Method
mSel.getDependNode(0, mObj)
# Store the DagPath data of the MSelectionList[0] to mDagPath instance by .getDagPath Method
mSel.getDagPath(0, mDagPath)

# Get the MFnMesh data from mDagPath instance and store it in the mFnMesh instance
mFnMesh = openmaya.MFnMesh(mDagPath)
print mFnMesh.fullPathName()

# Get the MFnDependencyNode data from the mObj instance and store it in the mFnDependencyNode instance
mFnDependNode = openmaya.MFnDependencyNode(mObj)
print mFnDependNode.name()


# Get the connected MPlugs from the mFnMesh instance and store them in a MPlugArray instance
mPlugArray = openmaya.MPlugArray()
mFnMesh.getConnections(mPlugArray)

mPlugArray_Dst = openmaya.MPlugArray()
mPlugArray_Src = openmaya.MPlugArray()

# get all Src mPlugs and Dst mPlugs
for i in xrange(mPlugArray.length()):
    mPlugArray_Temp = openmaya.MPlugArray()
    if mPlugArray[i].connectedTo(mPlugArray_Temp, True, False):
        mPlugArray_Dst.append(mPlugArray[i])
    else:
        mPlugArray_Src.append(mPlugArray[i])

"""
mPlugArray.length()  # Return the length of the mPlugArray
print mPlugArray[0].name()  # Get the name of the index 0 element of the mPlugArray
print mPlugArray[1].name()  # Get the name of the index 1 element of the mPlugArray

# Create a new MPlugArray instance to store the connected mPlugs
mPlugArray_Connections = openmaya.MPlugArray()
# from Dst mPlug to find Source mPlug             asDst asSrc
mPlugArray[1].connectedTo(mPlugArray_Connections, True, False)
"""

mPlugArray_Dst.length()  # Return the length of the mPlugArray

print mPlugArray_Dst[0].name()  # Get the name of the 0 index element of the mPlugArray

# From mPlug to Node -> First, from mPlug to mObj
mObj2 = mPlugArray_Dst[0].node()  # return a MObject type data

# From mPlug to Node -> Second, from mObj to Node, store the data in a MFnDependencyNode instance
mFnDependNode2 = openmaya.MFnDependencyNode(mObj2)
print mFnDependNode2.name()

# To get the attributes, first of all, we need to get the plug(handle) of the attribute
mPlug_width = mFnDependNode2.findPlug("width")
mPlug_height = mFnDependNode2.findPlug("height")

# Use asInt() method to get the width and height
print mPlug_width.asInt()
print mPlug_height.asInt()

# Get the plug(handle) of the target attribute
mplug_subwidth = mFnDependNode2.findPlug("subdivisionsWidth")
mplug_subheight = mFnDependNode2.findPlug("subdivisionsHeight")

# Use the plug to set the attribute
mplug_subwidth.setInt(15)
mplug_subheight.setInt(20)



