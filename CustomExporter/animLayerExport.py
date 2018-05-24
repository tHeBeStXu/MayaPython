import maya.cmds as cmds
from CustomExporter import base, fbxExport

reload(base)
reload(fbxExport)


def setAnimLayerSettings(fbxExportNode):
    """
    Purpose:        Record the animLayer settings used in animation and store in the fbxExportNode as a string
    Procedure:      List all the animLayers
                    query their mute and solo attributes
                    list them in one single string
                    uses : as sentinel value to split separate animLayers
                    uses , as sentinel value to split separate fields for animLayer
                    uses = as sentinel value to split separate attrs from their values in field
    Presumption:    None
    :param fbxExportNode:
    :return:
    """
    if not cmds.attributeQuery('animLayers', node=fbxExportNode, exists=1):
        fbxExport.addFBXNodeAttrs(fbxExportNode)

    animLayers = cmds.ls(type='animLayer')

    animLayersCommandStr = ''

    for curLayer in animLayers:
        mute = cmds.animLayer(curLayer, query=1, mute=1)
        solo = cmds.animLayer(curLayer, query=1, solo=1)

        animLayersCommandStr += curLayer + ', mute=' + str(mute) + ', solo=' + str(solo) + ';'

    cmds.setAttr(fbxExportNode + '.animLayers', animLayersCommandStr, type='string')


def setAnimLayerFromSettings(fbxExportNode):
    """
    Purpose:        Set the animLayers based on the string value in the fbxExportNode
    Procedure:      Use pre-defined sentinel values to split the string for separate animLayers
                    Parse out the attributes and their values, then set
    Presumption:    uses : as sentinel value to split separate animLayers
                    uses , as sentinel value to split separate fields for animLayer
                    uses = as sentinel value to split separate attrs from their values in field
                    order is Layer, mute, solo
    :param fbxExportNode:
    :return:
    """
    if cmds.objExists(fbxExportNode) and cmds.objExists(fbxExportNode + '.animLayers'):
        animLayersRootString = cmds.getAttr(fbxExportNode + '.animLayers', asString=1)

        if animLayersRootString:
            animLayerEntries = animLayersRootString.split(';')

            for curEntry in animLayerEntries:
                if curEntry:
                    fields = curEntry.split(',')

                    animLayerField = fields[0]
                    curMuteField = fields[1]
                    curSoloField = fields[2]

                    muteFieldStr = curMuteField.split('=')
                    soloFieldStr = curSoloField.split('=')

                    muteFieldBool = True
                    soloFieldBool = True

                    if muteFieldStr[1] != 'True':
                        muteFieldBool = False

                    if soloFieldStr[1] != 'True':
                        soloFieldBool = False

                    cmds.animLayer(animLayerField, edit=1, mute=muteFieldBool, solo=soloFieldBool)


def clearAnimLayerSettings(fbxExportNode):
    """
    Clear animLayer Setting by setting the fbxExportNode's '.animLayers' attribute to empty string
    :param fbxExportNode:
    :return:
    """
    cmds.setAttr(fbxExportNode + '.animLayers', '', type='string')
