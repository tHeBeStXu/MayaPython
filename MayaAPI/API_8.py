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
