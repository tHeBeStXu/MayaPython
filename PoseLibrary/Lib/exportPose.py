import maya.cmds as cmds
import json
import os
import datetime
import shutil


def exportPose(selectionList, posePath, fileName, snapShotPath, iconPath):

    controlInfoList = {}
    for eachSelection in selectionList:
        # get ctrl attribute list
        attrList = cmds.listAttr(eachSelection, k=1, u=1, sn=1)

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
    dataPath = '%s/%s.pose' % (posePath, fileName)

    if os.path.isfile(dataPath):
        try:
            os.chmod(dataPath, 0777)
            os.remove(dataPath)
        except Exception, result:
            print result

    # write data
    poseData = open(dataPath, 'w')
    jsonData = json.dumps(dataList, indent=4)
    poseData.write(jsonData)
    poseData.close()

    # Pose Icon
    currentIcon = snapShotPath
    if not os.path.isfile(currentIcon):
        currentIcon = '%s/poseTemplate.png' % iconPath

    currentPoseIconPath = dataPath.replace('.pose', '.png')

    if currentIcon == '%s/poseTemplate.png' % iconPath:
        try:
            shutil.copy2(currentIcon, currentPoseIconPath)
        except Exception, result:
            print result
    else:
        try:
            shutil.move(currentIcon, currentPoseIconPath)
        except Exception, result:
            print result

    return currentPoseIconPath
