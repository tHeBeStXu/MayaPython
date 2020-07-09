import maya.cmds as cmds

targetJoint = 'test_1:rig_player1:lt_bind_knee_Jnt'
controller = 'test_1:rig_player2:puppet_lf_knee_pv_ctrl'

startFrame = cmds.playbackOptions(q=1, minTime=1)
endFrame = cmds.playbackOptions(q=1, maxTime=1)

for i in xrange(int(endFrame - startFrame + 1)):
    cmds.currentTime(startFrame + i)

    const = cmds.pointConstraint(targetJoint, controller, mo=0)
    cmds.setKeyframe(controller, at='translateX', v=cmds.getAttr(controller + '.translateX'))
    cmds.setKeyframe(controller, at='translateY', v=cmds.getAttr(controller + '.translateY'))
    cmds.setKeyframe(controller, at='translateZ', v=cmds.getAttr(controller + '.translateZ'))

    cmds.delete(const)




