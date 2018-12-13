import maya.cmds as cmds
import os
import json


def importPose(selectionList):

    curParentPath = os.path.abspath(os.path.join(os.path.dirname(__file__), os.path.pardir))

    dataPath = os.path.join(curParentPath, 'Data/CurrentPose.pose')

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
                attrValue = attrList[eachAttr]

                cmds.setAttr('%s.%s' % (eachSel, eachAttr), attrValue)

    print 'Successfully import pose data!'

