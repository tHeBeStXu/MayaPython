"""
OpenMayaMPx and custom maya command
"""
import maya.OpenMaya as openmaya

# OpenMayaMPx is MAYA Proxy API, which is used for users to define their own objects,
# such as commands, nodes and any other plugins
import maya.OpenMayaMPx as openmayampx
import sys

commandName = 'PrintHierarchy'

# To make maya think the command plugin as an internal command,
# we need to write a command plugin in a form of CLASS, which derived from OpenMayaMPx.MPxCommand() Class
# MPxCommand() class is used to create mel commands, it provides necessary methods to make maya
# think that it's a internal command, it function like a built-in command
class pluginCommand(openmayampx.MPxCommand):

    def __init__(self):
        openmayampx.MPxCommand.__init__(self)
# Whenever a class is derived from MPxCommand, it should always have a doIt() function
    def doIt(self, argList):
        print "Do it..."

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


def cmdsCreator():
    # Create a Pointer and attach it to the pluginCommand instance by .asMPxPtr
    return openmayampx.asMPxPtr(pluginCommand())

# Be careful of with the correct FUNCTION NAME and the CAPITALS
def initializePlugin(mObj):
    # Because mayaCore has already prepared a handle(named mObj here, which is in form of MObject)
    # for the Pointer above, define a plugin function set and pass the handle to it.
    mplugin = openmayampx.MFnPlugin(mObj)
    try:
        # register the command by the commandName and the Pointer(Pull the Pointer into the Maya Core)
        mplugin.registerCommand(commandName, cmdsCreator)
    except:
        sys.stderr.write("Failed to register command: " + commandName)

# Be careful of with the correct FUNCTION NAME and the CAPITALS
def uninitializePlugin(mObj):
    mplugin = openmayampx.MFnPlugin(mObj)
    try:
        # For de-registering command, we just need the commandName and the Pointer is already in Maya Core
        mplugin.deregisterCommand(commandName)
    except:
        sys.stderr.write("Failed to de-register command: " + commandName)


