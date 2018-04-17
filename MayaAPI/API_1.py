import maya.OpenMaya as openmaya

# OpenMayaMPx is MAYA Proxy API, which is used for users to define their own objects,
# such as commands, nodes and any other plugins
import maya.OpenMayaMPx as openmayampx
import sys

commandName = 'PluginCommand'

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


def cmdsCreator():
    # Create a Pointer and attach it to the pluginCommand instance by .asMPxPtr
    return openmayampx.asMPxPtr(pluginCommand())

# Be careful of with the FUNCTION NAME and the CAPITALS
def initializePlugin(mObj):
    # Because mayaCore has already prepared a handle(named mObj here, which is in form of MObject)
    # for the Pointer above, define a plugin function set and pass the handle to it.
    mplugin = openmayampx.MFnPlugin(mObj)
    try:
        # register the command by the commandName and the Pointer(Pull the Pointer into the Maya Core)
        mplugin.registerCommand(commandName, cmdsCreator)
    except:
        sys.stderr.write("Failed to register command: " + commandName)

# Be careful of with the FUNCTION NAME and the CAPITALS
def uninitializePlugin(mObj):
    mplugin = openmayampx.MFnPlugin(mObj)
    try:
        # For de-registering command, we just need the commandName and the Pointer is already in Maya Core
        mplugin.deregisterCommand(commandName)
    except:
        sys.stderr.write("Failed to de-register command: " + commandName)


