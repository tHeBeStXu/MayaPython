"""
MSyntax: MSyntax is an object that has collection of flags, flag arguments and command objects. It helps maya to accept
         only those arguments which are defined in this collection. So when creating the command, it would define what
         type of flags(arguments) it would accept.When Registering the command and during the execution, maya will check
         the passed flags in this MSyntax object that it is acceptable or not.
MArgDatabase: MArgDatabase is a class that provides the function using which could parse, store and retrieve flags, flag
              Arguments and Command Objects. It derived from MArgParser class(parsing and storing objects)
"""
import maya.OpenMaya as openmaya
import maya.OpenMayaMPx as openmayampx
# Use Maya Partical system
import maya.OpenMayaFX as openmayafx
import sys

# Change the name of the plugin
commandName = 'vertexParticle'
# shortName and longName of the flags
kHelpFlag = "-h"
kHelpFlag_long = "-help"
kSparseFlag = "-s"
kSparseFlag_long = "-sparse"
helpMessage = "This command is used to attach a particle on each vertex of a poly mesh"

# ##when use the MPxCommand, it receives the MSyntax Object, and pass to the argumentParser method##
class pluginCommand(openmayampx.MPxCommand):

    sparse = None
    sparse_long = None

    def __init__(self):
        openmayampx.MPxCommand.__init__(self)


    def argumentParser(self, argList):
        syntax = self.syntax()
        # Use MArgDatabase to parse the argList
        parsedArguments = openmaya.MArgDatabase(syntax, argList)


        if parsedArguments.isFlagSet(kSparseFlag):
            self.sparse = parsedArguments.flagArgumentDouble(kSparseFlag, 0)
            # return openmaya.MStatus.kSuccess
            # https://help.autodesk.com/view/MAYAUL/2017/ENU/?guid=__files_Maya_Python_API_Using_the_Maya_Python_API_htm
        if parsedArguments.isFlagSet(kSparseFlag_long):
            self.sparse_long = parsedArguments.flagArgumentDouble(kSparseFlag_long, 0)
            # return openmaya.MStatus.kSuccess

        if parsedArguments.isFlagSet(kHelpFlag):
            # show help message
            self.setResult(helpMessage)
            # return openmaya.MStatus.kSuccess
        if parsedArguments.isFlagSet(kHelpFlag_long):
            self.setResult(helpMessage)
            # return openmaya.MStatus.kSuccess


    def isUndoable(self):
        return True


    # Delete the particle system
    def undoIt(self):
        print "Undo"
        # we can use DAG_NODE_FUNCTION_SET or Dag Path
        mFnDagNode = openmaya.MFnDagNode(self.mObj_particle)

        mDagMod = openmaya.MDagModifier()
        # delete the transform node
        mDagMod.deleteNode(mFnDagNode.parent(0))
        mDagMod.doIt()
        # return openmaya.MStatus.kSuccess


    def redoIt(self):
        # Read Selection/Actively selected objects
        mSel = openmaya.MSelectionList()
        mDagPath = openmaya.MDagPath()
        mFnMesh = openmaya.MFnMesh()
        openmaya.MGlobal.getActiveSelectionList(mSel)
        if mSel.length() >= 1:
            try:
                mSel.getDagPath(0, mDagPath)
                # attach the mesh to the MFnMesh
                mFnMesh.setObject(mDagPath)
            except:
                print "Select a poly mesh"
                return openmaya.kUnknownParameter

        else:
            print "Select a poly mesh"
            return openmaya.kUnknownParameter

        # Read vertex positions of selected Mesh
        mPointArray = openmaya.MPointArray()
        mFnMesh.getPoints(mPointArray, openmaya.MSpace.kWorld)

        # Create a particle system
        mFnParticle = openmayafx.MFnParticleSystem()
        self.mObj_particle = mFnParticle.create()

        # Fix maya bug
        mFnParticle = openmayafx.MFnParticleSystem(self.mObj_particle)

        # Attach the particles on the vertex positions
        counter = 0
        for i in xrange(mPointArray.length()):
            # i % self.sparse 取余
            if i % self.sparse == 0:
                mFnParticle.emit(mPointArray[i])
                counter += 1
        print "Total points :" + str(counter)

        # After emitting the particle, we have to save the initial state of the particle as well,
        # otherwise if you apply any dynamics on it, your particles would never come back to their actual positions.
        mFnParticle.saveInitialState()

        # return openmaya.MStatus.kSuccess

    # Whenever a class is derived from MPxCommand, it should always have a doIt() function
    def doIt(self, argList):
        print "Do it..."
        self.argumentParser(argList)
        # check the self.sparse variable if it is None
        if self.sparse != None:
            # why? Because we can do actual function action in redoIt() multi-times
            self.redoIt()
            # return openmaya.MStatus.kSuccess


# Creator
def cmdsCreator():
    # Create a Pointer and attach it to the pluginCommand instance by .asMPxPtr
    return openmayampx.asMPxPtr(pluginCommand())

# Create a MSyntax object function
def syntaxCreator():
    # create MSyntax Object
    syntax = openmaya.MSyntax()
    # collect / add the flags, 3 arguments: shortName of the flag, longName of the flag,
    # type of the data accepted (optional)
    # Help flag
    syntax.addFlag(kHelpFlag, kHelpFlag_long)
    # Sparse flag
    syntax.addFlag(kSparseFlag, kSparseFlag_long, openmaya.MSyntax.kDouble)

    # return syntax
    return syntax


def initializePlugin(mObj):
    # Because mayaCore has already prepared a handle(named mObj here, which is in form of MObject)
    # for the Pointer above, define a plugin function set and pass the handle to it.
    mplugin = openmayampx.MFnPlugin(mObj)
    try:
        # register the command by the commandName and the Pointer(Pull the Pointer into the Maya Core)
        # ##use the syntax by register the plugin, and return Syntax objects##
        mplugin.registerCommand(commandName, cmdsCreator, syntaxCreator)
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

"""
Redo Action not work well...
"""
