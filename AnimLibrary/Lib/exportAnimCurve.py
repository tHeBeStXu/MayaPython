import maya.api.OpenMaya as om
import maya.api.OpenMayaAnim as oma
import maya.cmds as cmds
import os
import datetime
import shutil
import json


def exportAnimCurve(selectionList,
                    animPath,
                    animName,
                    animGIFPath,
                    iconPath):

    animDataDict = {}
    for currentObject in selectionList:
        objMSL = om.MSelectionList()
        objMSL.add(currentObject)
        objMObject = objMSL.getDependNode(0)

        # find the attribute of current object
        objMFnDPNode = om.MFnDependencyNode(objMObject)
        attributeCount = objMFnDPNode.attributeCount()

        nodeAnimInformationDict = {}

        for attributeIndex in range(attributeCount):
            attributeMObject = objMFnDPNode.attribute(attributeIndex)

            MFnAttribute = om.MFnAttribute(attributeMObject)

            attributeName = MFnAttribute.name

            # find the attribute that anim curve connected

            currentPlug = objMFnDPNode.findPlug(attributeName, 1)

            if currentPlug.connectedTo(1, 0):
                currentConnectedList = currentPlug.connectedTo(1, 0)

                # find the connected node type
                currentConnectNodeMObject = currentConnectedList[0].node()

                # check it is an anim curve
                if currentConnectNodeMObject.hasFn(om.MFn.kAnimCurve):
                    # get anim curve
                    MFnAnimCurve = oma.MFnAnimCurve(currentConnectNodeMObject)

                    # get attribute
                    animCurveType = MFnAnimCurve.animCurveType
                    preInfinity = MFnAnimCurve.preInfinityType
                    postInfinity = MFnAnimCurve.postInfinityType

                    weightedTangents = int(MFnAnimCurve.isWeighted)

                    # get value of each key
                    numKeys = MFnAnimCurve.numKeys
                    timeList = []
                    valueList = []

                    inTangentTypeList = []
                    inTangentAngleList = []
                    inTangentAngleWeightList = []

                    outTangentTypeList = []
                    outTangentAngleList = []
                    outTangentAngleWeightList = []

                    for index in range(numKeys):
                        # time
                        input = MFnAnimCurve.input(index)
                        mTime = om.MTime(input)
                        currentTime = mTime.value
                        timeList.append(currentTime)

                        # value
                        value = MFnAnimCurve.value(index)
                        valueList.append(value)

                        # inTangent
                        inTangentType = MFnAnimCurve.inTangentType(index)
                        inTangentTypeList.append(inTangentType)

                        inTangentAngleWeight = MFnAnimCurve.getTangentAngleWeight(index, 1)

                        inTangentAngleMAngle = om.MAngle(inTangentAngleWeight[0])
                        inTangentValue = inTangentAngleMAngle.value
                        inTangentAngleList.append(inTangentValue)
                        inTangentAngleWeightList.append(inTangentAngleWeight[1])

                        # outTangent
                        outTangentType = MFnAnimCurve.outTangentType(index)
                        outTangentTypeList.append(outTangentType)

                        outTangentAngleWeight = MFnAnimCurve.getTangentAngleWeight(index, 0)
                        outTangentAngleMAngle = om.MAngle(outTangentAngleWeight[0])
                        outTangetValue = outTangentAngleMAngle.value
                        outTangentAngleList.append(outTangetValue)
                        outTangentAngleWeightList.append(outTangentAngleWeight[1])

                    attributeDataDict = {'animCurveType': animCurveType,
                                         'preInfinity': preInfinity,
                                         'postInfinity': postInfinity,
                                         'weightedTangents': weightedTangents,
                                         'numKeys': numKeys,
                                         'timeList': timeList,
                                         'valueList': valueList,
                                         'inTangentTypeList': inTangentTypeList,
                                         'inTangentAngleList': inTangentAngleList,
                                         'inTangentAngleWeightList': inTangentAngleWeightList,
                                         'outTangentAngleList': outTangentAngleList,
                                         'outTangentTypeList': outTangentTypeList,
                                         'outTangentAngleWeightList': outTangentAngleWeightList}

                    nodeAnimInformationDict.setdefault(attributeName, attributeDataDict)

        animDataDict.setdefault(currentObject.encode(), nodeAnimInformationDict)

    # Data History
    owner = os.getenv('USERNAME')
    time = datetime.datetime.now().strftime("%A, %B, %d, %Y %H:%M %p")
    mayaVersion = cmds.about(q=1, v=1)
    version = '0.1'
    dataList = {'animCurve': animDataDict, 'history': [owner, time, mayaVersion, version]}

    dataPath = '%s/%s.anim' % (animPath, animName)

    if os.path.isfile(dataPath):
        try:
            os.chmod(dataPath, 0777)
            os.remove(dataPath)
        except Exception, result:
            print result

    # write anim data
    if animDataDict:
        animData = open(dataPath, 'w')
        data = json.dumps(dataList, indent=4)
        animData.write(data)
        animData.close()

    currentGIF = animGIFPath
    if not os.path.isfile(currentGIF):
        currentGIF = '%s/animTemplate.gif' % iconPath

    currentAnimGIFPath = dataPath.replace('.anim', '.gif')

    if currentGIF == '%s/animTemplate.gif' % iconPath:
        try:
            shutil.copy2(currentGIF, currentAnimGIFPath)
        except Exception, result:
            print result

    else:
        try:
            shutil.copy2(currentGIF, currentAnimGIFPath)
        except Exception, result:
            print result

    return currentAnimGIFPath
