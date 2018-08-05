import maya.cmds as cmds

from ..base import module
from ..base import control

from ..utils import name

reload(module)
reload(control)
reload(name)

def build(legJoints,
          prefix='L_',
          rigScale=1.0,
          baseRig=None):

    rigmodule = module.Module(prefix=prefix,
                              rigPartName='Leg',
                              baseObject=baseRig)

    # create IK_HintLeg

    pass
