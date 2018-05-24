import maya.cmds as cmds
import os
import maya.mel as mel
import sys

from CustomExporter import base, fbxExport, animationExport, animLayerExport, modelExport

reload(base)
reload(fbxExport)
reload(animationExport)
reload(modelExport)

parentDir = os.path.abspath(os.path.join(os.path.abspath(__file__), os.path.pardir))
melFileDir = parentDir + '/mel'
melFileDir = melFileDir.replace('\\', '/')

if melFileDir not in sys.path:
    sys.path.append(melFileDir)
# print melFileDir
# maya.mel.eval('source ' + '"' + 'E:/PycharmProjects/CustomExporter/mel/FBXAnimationExport_FBXOptions.mel' + '"')
mel.eval('source ' + '"' + melFileDir + '/' + 'FBXAnimationExport_FBXOptions.mel' + '"')


def exportFBX(fbxExporNode):
    curWorkspace = cmds.workspace(q=1, rd=1)

    fileName = cmds.getAttr(fbxExporNode + '.exportName')

    if fileName:
        newFBX = curWorkspace + fileName
        cmds.file(newFBX, force=1, type='FBX export', pr=1, es=1)

    else:
        cmds.warning('No Valid Export Filename for Export Node' + fbxExporNode + '\n')



def exportFBXAnimation(characterName, fbxExportNode):
    base.clearGarbage()
    characters = []

    if characterName:
        characters.append(characterName)
    else:
        references = cmds.file(reference=1, query=1)
        for curRef in references:
            characters.append(cmds.file(curRef, namespace=1, q=1))

    for curCharacter in characters:
        # get the meshes with blendShapes
        meshes = base.findMeshWithBlendShapes(curCharacter)

        # get origin
        origin = base.returnOrigin(curCharacter)

        fbxExportNodes = []

        if fbxExportNode:
            fbxExportNodes.append(fbxExportNode)
        else:
            fbxExportNodes = fbxExport.returnFBXExportNodes(origin)

        for curFBXExportNode in fbxExportNodes:
            if cmds.getAttr(curFBXExportNode + '.export') and not origin == "Error":
                fbxExportRig = animationExport.copyAndConnectSkeleton(origin)


                startFrame = cmds.playbackOptions(q=1, minTime=1)
                endFrame = cmds.playbackOptions(q=1, maxTime=1)

                subAnimCheck = cmds.getAttr(curFBXExportNode + '.useSubRange')
                if subAnimCheck:
                    startFrame = cmds.getAttr(curFBXExportNode + '.useSubRange')
                    endFrame = cmds.getAttr(curFBXExportNode + '.endFrame')

                if cmds.getAttr(curFBXExportNode + '.moveToOrigin'):
                    newOrigin = cmds.listConnections(origin + '.translateX', source=0, d=1)
                    zeroOriginFlag = cmds.getAttr(curFBXExportNode + '.zeroOrigin')
                    animationExport.tranformToOriginPoint(newOrigin[0], startFrame=startFrame, endFrame=endFrame, zeroOrigin=zeroOriginFlag)

                cmds.select(cl=1)
                cmds.select(fbxExportRig, add=1)
                cmds.select(meshes, add=1)

                animLayerExport.setAnimLayerFromSettings(curFBXExportNode)

                mel.eval("setFBXExportOptions_animation(" + str(startFrame) + "," + str(endFrame) + ")")
                exportFBX(curFBXExportNode)

            base.clearGarbage()


def exportFBXCharacter(fbxExportNode):
    origin = base.returnOrigin('')
    fbxExportNodes = []

    if fbxExportNode:
        fbxExportNodes.append(fbxExportNode)
    else:
        fbxExportNodes = fbxExport.returnFBXExportNodes(origin)

    parentNode = cmds.listRelatives(origin, parent=1, fullPath=1)

    if parentNode:
        cmds.parent(origin, world=1)

    for curExportNode in fbxExportNodes:
        if cmds.getAttr(curExportNode + '.export'):
            mel.eval("setFBXExportOptions_model()")

            cmds.select(clear=1)

            meshes = modelExport.returnConnectedMeshes(curExportNode)
            cmds.select(origin, add=1)
            cmds.select(meshes, add=1)

            exportFBX(curExportNode)

        if parentNode:
            cmds.parent(origin, parentNode[0])

