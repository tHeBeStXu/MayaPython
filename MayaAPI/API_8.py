"""
Callback: a way of linking a specific function to a specific event, and watch the occurrence of this event all the time
MMessage: message callback

MAnimMessage: is used to create animation message callback:
1.animation curve editing;
2.keyframe editing;
3.baked result change...

Command Message callback:
1. MEL command execution

MDG-Message: for handling Dependency Graph message
1. Node add/remove
2. Connection establish/remove

MDAG-Message: for Dependency Graph message. To track or check the occurrence of Dependency Graph node switching
1. Parent, child, instance, add or remove

MEvent-Message: Similar to 'ScriptJob' command;
OpenMaya.MEventMessage.getEventNames()

Lock Message: for lock-message
1. Plug - locked / unlocked, values cannot be changed when locked
2. Node - locked / unlocked, re-parented, removed and deleted

Node Message: for Dependency Node Message.
1. Attribute: added/ removed.
2. Plug: of a Node is dirty.
3. Name: of Node is changed.

Scene Message: handle Scene related message [IMPORTANT]
1. Before/After new scene, existing scene, reference is loaded/unloaded, Maya is initialize/exited

Timer Message: add callback based on different timer events

UI Message: To register callback to track the relation of UI object

User-event Message: for handling user defined event.
"""

# OpenMayaMPx is MAYA Proxy API, which is used for users to define their own objects,
# such as commands, nodes and any other plugins

import maya.OpenMaya as openmaya
import maya.OpenMayaMPx as openmayampx
import sys

nodeName = 'CVGKNode'
nodeID = openmaya.MTypeId(0x100fff)


# 1. Creator Function step
def nodeCreator():
    return openmayampx.asMPxPtr(CVG())


class CVG(openmayampx.MPxNode):

    idCallBack = []

    joint1 = openmaya.MObject()
    joint2 = openmaya.MObject()
    joint3 = openmaya.MObject()

    activeEffector = openmaya.MObject()
    activeHandle = openmaya.MObject()
    activePoleVector = openmaya.MObject()
    activePoleVectorCtrl = openmaya.MObject()

    def __init__(self):
        openmayampx.MPxNode.__init__(self)
        # super(wheelNode, self).__init__()

        #Event Callback
        self.idCallBack.append(openmaya.MEventMessage.addEventCallback('SelectionChanged', self.callBackFunc))

        #DG Callback
        self.idCallBack.append(openmaya.MDGMessage.addNodeRemovedCallback(self.remove, 'dependNode'))

    def callBackFunc(self, *args):

        print 'Called'

        #1. Find active selection in the scene
        mSel = openmaya.MSelectionList()
        openmaya.MGlobal.getActiveSelectionList(mSel)
        mItSelectionList = openmaya.MItSelectionList(mSel, openmaya.MFn.kDagNode)
        mode='FK'

        mFnDependencyNode = openmaya.MFnDependencyNode()

        #2. Find IK-Effector
        while (not mItSelectionList.isDone()):
            mObj = openmaya.MObject()
            mItSelectionList.getDependNode(mObj)

            # if effector itself is selected
            if mObj.apiTypeStr() == 'kIkEffector':
                self.activeEffector = mObj
                mode = 'ik'
                break
            # if control curve is selected
            if self.activePoleVectorCtrl.apiTypeStr() != 'kInvalid':
                if openmaya.MFnDependencyNode(mObj).name() == openmaya.MFnDependencyNode(self.activePoleVector).name():
                    mode = 'ik'
                    break

            mFnDependencyNode.setObject(mObj)
            mPlugArray_joint = openmaya.MPlugArray()
            mFnDependencyNode.getConnections(mPlugArray_joint)

            # check if effector is connected to selected object
            for i in xrange(mPlugArray_joint.length()):
                mPlug_joint = mPlugArray_joint[i]
                mplugArray2 = openmaya.MPlugArray()
                mPlug_joint.connectedTo(mplugArray2, True, True)
                mPlug2 = mplugArray2[0]
                if mPlug2.node().apiTypeStr() == 'kIkHandle':
                    self.activeHandle = mPlug2.node()
                    mode = 'ik'
                    break

                mItSelectionList.next()

            #3. Find IK-Handle
            """
            if IK-Effector is found then:
                find IK-HANDLE
            """
            if self.activeEffector.apiTypeStr() == 'kIkEffector':
                mFnDependencyNode.setObject(self.activeEffector)
                mPlugArray_effector = openmaya.MPlugArray()
                mFnDependencyNode.getConnections(mPlugArray_effector)

                for i in xrange(mPlugArray_effector.length()):
                    mPlug_effector = mPlugArray_effector[i]
                    mplugArray2 = openmaya.MPlugArray()
                    mPlug_effector.connectedTo(mplugArray2, True, True)
                    mPlug2 = mplugArray2[0]

                    if mPlug2.node().apiTypeStr() == 'kIkHandle':
                        self.activeHandle = mPlug2.node()
                        break

                """
                if IkHandle is found then:
                    find IK-BLEND PLUG
                    find IK-PoleVector
                """

                if self.activeHandle.apiTypeStr() == 'kIkHandle':
                    #4. Find IK-Blend Plug
                    mFnDependencyNodeHandle = openmaya.MFnDependencyNode(self.activeHandle)
                    mPlug_blendAttr = mFnDependencyNodeHandle.findPlug('ikBlend')
                    mAttr_blendAttr = mPlug_blendAttr.attribute()
                    # make IK-blend attribute unKeyable and hidden from channel box
                    mFnAttribute = openmaya.MFnAttribute(mAttr_blendAttr)
                    mFnAttribute.setKeyable(0)
                    mFnAttribute.setChannelBox(0)

                    #5. Find Pole Vector Constraint
                    mFnDependencyNode.setObject(self.activeHandle)
                    mPlugArray_Handle = openmaya.MPlugArray()
                    mFnDependencyNode.getConnections(mPlugArray_Handle)
                    for i in xrange(mPlugArray_Handle.length()):
                        mPlug_Handle = mPlugArray_Handle[i]
                        mplugArray2 = openmaya.MPlugArray()
                        mPlug_Handle.connectedTo(mplugArray2, True, True)
                        mPlug2 = mplugArray2[0]
                        if mPlug2.node().apiTypeStr() == 'kPoleVectorConstraint':
                            self.activePoleVector = mPlug2.node()
                            break

                    """
                    if IK-PoleVector is found then:
                        find IK-PoleVector Control Curve
                    """
                    if self.activePoleVector.apiTypeStr() == 'kPoleVectorConstraint':
                        #6. Find Curve controlling Pole Vector
                        mFnDependencyNode.setObject(self.activePoleVector)
                        mPlugArray_Handle = openmaya.MPlugArray()
                        mFnDependencyNode.getConnections(mPlugArray_Handle)
                        for i in xrange(mPlugArray_Handle.length()):
                            mPlug_handle = mPlugArray_Handle[i]
                            mplugArray2 = openmaya.MPlugArray()
                            mPlug_handle.connectedTo(mplugArray2, True, True)
                            mPlug2 = mplugArray2[0]

                            if mPlug2.node().apiTypeStr() == 'kTransform':
                                self.activePoleVectorCtrl = mPlug2.node()
                                break


    def remove(self, *args):
        print 'remove'
        try:
            # check if this node exists in the scene
            openmaya.MSelectionList.add(self.thisMObject())


        except:
            # remove callback
            for i in xrange(len(self.idCallBack)):
                # MEventMessage callback
                try:
                    openmaya.MEventMessage.removeCallback(self.idCallBack[i])

                except:
                    pass

                # MDGMessage callback
                try:
                    openmaya.MDGMessage.removeCallback(self.idCallBack[i])

                except:
                    pass







    # be careful about the name of the method, it must be "compute"
    def compute(self, plug, dataBlock):
        pass

# 2. Initialize step
def nodeInitializer():
    pass

# 3. initialize Plugin
def initializePlugin(mObj):
    # Because mayaCore has already prepared a handle(named mObj here, which is in form of MObject)
    # for the Pointer above, define a plugin function set and pass the handle to it.
    mplugin = openmayampx.MFnPlugin(mObj, 'Yixiong Xu', '1.0')
    try:

        mplugin.registerNode(nodeName, nodeID, nodeCreator, nodeInitializer, openmayampx.MPxNode.kDependNode)
    except:
        sys.stderr.write("Failed to register Node: " + nodeName)


# 4. unitialize Plugin
def uninitializePlugin(mObj):
    mplugin = openmayampx.MFnPlugin(mObj)
    try:
        # For de-registering NODE, we just need the NodeID and the Pointer is already in Maya Core
        mplugin.deregisterNode(nodeID)
    except:
        sys.stderr.write("Failed to de-register Node: " + nodeName)

