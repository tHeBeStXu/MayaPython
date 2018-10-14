import maya.cmds as cmds
from ..base import control
from ..base import module
from ..rigLib import lib

reload(control)
reload(module)
reload(lib)

def createRig(vertexList,
              prefix='L_',
              rigPartName='',
              rigScale=1.0,
              jointParent=''):

    cmds.select(cl=1)

    # create module
    rigModule = module.Module(prefix=prefix,
                              rigPartName=rigPartName)

    # create joint on each vertex
    jointList = lib.vertex2Joints(vertexList=vertexList,
                                  prefix=prefix,
                                  rigPartName=rigPartName,
                                  addSlaveAttr=True)

    if not jointParent:
        jointCtrlList = []
        jointCtrlGrpList = []
        # create controls
        for i in xrange(len(jointList)):
            jointCtrl = control.Control(prefix=jointList[i],
                                        rigPartName='',
                                        scale=rigScale,
                                        translateTo=jointList[i],
                                        rotateTo=jointList[i],
                                        shape='circleY')

            cmds.parent(jointList[i], jointCtrl.C)

            jointCtrlList.append(jointCtrl.C)
            jointCtrlGrpList.append(jointCtrl.Off)

    # connect the attribute
    for i in jointList:
        cmds.connectAttr(rigModule.topGrp + '.' + prefix + rigPartName + '_Jnt',
                         i + '.' + prefix + rigPartName, f=1)

    # cleanHierarchy
    for i in jointCtrlGrpList:
        cmds.parent(i, rigModule.topGrp)

