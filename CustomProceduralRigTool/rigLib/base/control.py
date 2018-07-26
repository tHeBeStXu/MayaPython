"""
module for making rig control
"""

import maya.cmds as cmds
import controlShape



class Control():

    """
    class for building rig control
    """

    def __init__(self, prefix='new',
                 scale=1.0,
                 translateTo='',
                 rotateTo='',
                 parent='',
                 shape='circle',
                 lockChannels=['s', 'v']):
        """
        
        :param prefix: str, prefix to name new objects
        :param scale: float, scale value for size of control shapes
        :param translateTo: str, reference object for control position
        :param rotateTo: str,reference object for control orientation
        :param parent: str, object to be parent of new control
        :param shape: str, control shape type
        :param lockChannels: list(str), list of channels on control to be locked and non-keyable
        :return None
        """

        circleNormal = [1, 0, 0]
        ctrlObject = None

        if shape in ['circle', 'circleX']:

            circleNormal = [1, 0, 0]

        elif shape == 'circleY':

            circleNormal = [0, 1, 0]

        elif shape == 'circleZ':

            circleNormal = [0, 0, 1]

        elif shape == 'sphere':
            ctrlObject = cmds.circle(n=prefix + '_ctl', ch=False, normal=[1, 0, 0], radius=scale)[0]
            addShape = cmds.circle(n=prefix + '_ctl2', ch=False, normal=[0, 0, 1], radius=scale)[0]
            cmds.parent(cmds.listRelatives(addShape, s=1), ctrlObject, r=1, s=1)
            cmds.delete(addShape)

        elif shape == 'crossControl':
            ctrlObject = controlShape.CrossControl.createShape(prefix=prefix, scale=scale)

        elif shape == 'arrowCurve':
            ctrlObject = controlShape.ArrowCurve.createShape(prefix=prefix, scale=scale)

        elif shape == 'crownCurve':
            ctrlObject = controlShape.CrownCurve.createShape(prefix=prefix, scale=scale)

        elif shape == 'cubeCurve':
            ctrlObject = controlShape.CubeCurve.createShape(prefix=prefix, scale=scale)

        elif shape == 'cubeOnBase':
            ctrlObject = controlShape.cubeOnBase.createShape(prefix=prefix, scale=scale)

        elif shape == 'diamond':
            ctrlObject = controlShape.Diamond.createShape(prefix=prefix, scale=scale)

        elif shape == 'fistCurve':
            ctrlObject = controlShape.FistCurve.createShape(prefix=prefix, scale=scale)

        elif shape == 'footControl':
            ctrlObject = controlShape.FootControl.createShape(prefix=prefix, scale=scale)

        elif shape == 'moveControl':
            ctrlObject = controlShape.MoveControl.createShape(prefix=prefix, scale=scale)

        elif shape == 'rotationControl':
            ctrlObject = controlShape.RotationControl.createShape(prefix=prefix, scale=scale)

        elif shape == 'singleRotateControl':
            ctrlObject = controlShape.singleRotateControl.createShape(prefix=prefix, scale=scale)

        elif shape == 'spikeCrossControl':
            ctrlObject = controlShape.SpikeCrossControl.createShape(prefix=prefix, scale=scale)

        elif shape == 'sliderControl':
            ctrlObject = controlShape.SliderControl.createShape(prefix=prefix, scale=scale)




        if not ctrlObject:
            ctrlObject = cmds.circle(n=prefix + '_ctl', ch=0,
                                     normal=circleNormal, radius=scale)[0]

        ctrlOffset = cmds.group(n=prefix + 'CtrlGrp', em=1)
        cmds.parent(ctrlObject, ctrlOffset)

        
        # color control

        ctrlShapes = cmds.listRelatives(ctrlObject, s=1)

        [cmds.setAttr(s + '.ove', 1) for s in ctrlShapes]

        if prefix.startswith('L_'):
            [cmds.setAttr(s + '.ovc', 6) for s in ctrlShapes]

        elif prefix.startswith('R_'):
            [cmds.setAttr(s + '.ovc', 13) for s in ctrlShapes]

        else:
            [cmds.setAttr(s + '.ovc', 22) for s in ctrlShapes]

        # translate control

        if cmds.objExists(translateTo):
            cmds.delete(cmds.pointConstraint(translateTo, ctrlOffset))

        # rotate control

        if cmds.objExists(rotateTo):
            cmds.delete(cmds.orientConstraint(rotateTo, ctrlOffset))

        # parent control

        if cmds.objExists(parent):
            cmds.parent(ctrlOffset, parent)

        # lock control channels

        singleAttributeLockList = []
        for lockChannel in lockChannels:

            if lockChannel in ['t', 'r', 's']:

                for axis in ['x', 'y', 'z']:

                    at = lockChannel + axis
                    singleAttributeLockList.append(at)

            else:
                singleAttributeLockList.append(lockChannel)

        for at in singleAttributeLockList:
            cmds.setAttr(ctrlObject + '.' + at, l=1, k=0)

        # add public members

        self.C = ctrlObject
        self.Off = ctrlOffset
