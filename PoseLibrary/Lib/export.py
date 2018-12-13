import maya.cmds as cmds
import json
import os
import datetime


def exportPose(selectionList):

    controlInfoList = {}
    for eachSelection in selectionList:
        # get ctrl attribute list
        attrList = cmds.listAttr(eachSelection, k=1, u=1, shortName=1)

        attrInfoList = {}
        if attrList:
            for eachAttr in attrList:
                attrValue = cmds.getAttr('%s.%s' % (eachSelection, eachAttr))
                attrInfoList.setdefault(eachAttr.encode(), attrValue)

            currentCtrl = eachSelection
            if cmds.referenceQuery(eachSelection, inr=1):
                referencePath = cmds.referenceQuery(eachSelection, f=1)
                nameSpace = cmds.file(referencePath, q=1, ns=1)
                currentCtrl = eachSelection.replace('%s:' % nameSpace, '')

            controlInfoList.setdefault(currentCtrl.encode(), attrInfoList)

    # data history
    owner = os.getenv('USERNAME')
    time = datetime.datetime.now().strftime("%A, %B, %d, %Y %H:%M %p")
    mayaVersion = cmds.about(q=1, v=1)
    version = '0.1'
    dataList = {'control': controlInfoList, 'history': [owner, time, mayaVersion, version]}


    # write pose data
    curParentPath = os.path.abspath(os.path.join(os.path.dirname(__file__), os.path.pardir))
    dataPath = os.path.join(curParentPath, 'Data/CurrentPose.pose')
    poseData = open(dataPath, 'w')
    jsonData = json.dump(dataList, indent=4)
    poseData.write(jsonData)
    poseData.close()

    # Create pose Icon
    poseIconPath = dataPath.replace('.pose', '.png')
    currentFrame = cmds.currentTime(q=1)

    modelPanel = cmds.getPanel(type='modelPanel')
    for eachPanel in modelPanel:
        cmds.modelEditor(eachPanel, e=1, alo=0)
        cmds.modelEditor(eachPanel, e=1, pm=1)

    playBlast = cmds.playblast(st=currentFrame, et=currentFrame, fmt='image',
                               cc=1, v=0, orn=0, fp=1, p=100, c='png', wh=[512, 512],
                               cf=poseIconPath)

    print 'Successfully export pose data!'

