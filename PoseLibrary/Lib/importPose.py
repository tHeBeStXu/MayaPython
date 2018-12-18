import maya.cmds as cmds
import json


def importPose(selectionList, dataPath):
    """
    Import pose to
    :param selectionList: list(str), selected controller(s)
    :param dataPath: str, pose data path
    :return: list(str), historyList, dict(str), control data
    """
    controlDataDict = {}

    readData = open(dataPath, 'r')

    dataList = json.load(readData)

    for eachSel in selectionList:

        currentCtrl = eachSel
        if cmds.referenceQuery(eachSel, inr=1):

            referencePath = cmds.referenceQuery(eachSel, f=1)

            nameSpace = cmds.file(referencePath, q=1, ns=1)

            currentCtrl = eachSel.replace('%s:' % nameSpace, '')

        if currentCtrl in dataList['control']:
            attrList = dataList['control'][currentCtrl]

            for eachAttr in attrList:
                poseValue = attrList[eachAttr]

                currentValue = cmds.getAttr('%s.%s' % (eachSel, eachAttr))

                controlDataDict.setdefault('%s.%s' % (eachSel, eachAttr), [currentValue, poseValue])

    # read history
    historyData = dataList['history']
    historyList = ['Owner: %s' % historyData[0],
                   'Created: %s' % historyData[1],
                   'Maya version: %s' % historyData[2],
                   'Module version: %s' % historyData[3]]
    return historyList, controlDataDict
