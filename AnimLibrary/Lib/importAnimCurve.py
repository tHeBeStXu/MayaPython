import maya.api.OpenMaya as om
import maya.api.OpenMayaAnim as oma
import json


def importAnimCurve(selectionList,
                    animPath,
                    ):

    animData = open(animPath, 'r')
    data = json.load(animData)
    animData.close()

    if data and selectionList:
        for eachObject in selectionList:
            for eachAnimCurveAttribute in data['animCurve'][eachObject]:

                # get value
                animCurveType = data['animCurve'][eachObject][eachAnimCurveAttribute]['animCurveType']
                preInfinity = data['animCurve'][eachObject][eachAnimCurveAttribute]['preInfinity']
                postInfinity = data['animCurve'][eachObject][eachAnimCurveAttribute]['postInfinity']
                weightedTangents = data['animCurve'][eachObject][eachAnimCurveAttribute]['weightedTangents']
                numKeys = data['animCurve'][eachObject][eachAnimCurveAttribute]['numKeys']
                timeList = data['animCurve'][eachObject][eachAnimCurveAttribute]['timeList']
                valueList = data['animCurve'][eachObject][eachAnimCurveAttribute]['valueList']
                inTangentTypeList = data['animCurve'][eachObject][eachAnimCurveAttribute]['inTangentTypeList']
                inTangentAngleList = data['animCurve'][eachObject][eachAnimCurveAttribute]['inTangentAngleList']
                inTangentAngleWeightList = data['animCurve'][eachObject][eachAnimCurveAttribute]['inTangentAngleWeightList']
                outTangentTypeList = data['animCurve'][eachObject][eachAnimCurveAttribute]['outTangentTypeList']
                outTangentAngleList = data['animCurve'][eachObject][eachAnimCurveAttribute]['outTangentAngleList']
                outTangentAngleWeightList = data['animCurve'][eachObject][eachAnimCurveAttribute]['outTangentAngleWeightList']

                # convert current object and attribute to a new MPlug object
                mSelectionList = om.MSelectionList()
                mSelectionList.add('%s.%s' % (eachObject, eachAnimCurveAttribute))

                attributeMPlug = mSelectionList.getPlug(0)

                connectedList = attributeMPlug.connectedTo(1, 0)

                # whether to create a new curve or use the existed curve
                newAnimCurve = 1
                if connectedList:
                    connectedNode = connectedList[0].node()

                    if connectedNode.hasFn(om.MFn.kAnimCurve):

                        MFnAnimCurve = oma.MFnAnimCurve(connectedNode)
                        newAnimCurve = 0

                if newAnimCurve:
                    MFnAnimCurve = oma.MFnAnimCurve()

                    MFnAnimCurve.create(attributeMPlug, animCurveType)

                # set value
                MFnAnimCurve.setPreInfinityType(preInfinity)
                MFnAnimCurve.setPostInfinityType(postInfinity)

                MFnAnimCurve.setIsWeighted(weightedTangents)

                MTimeArray = om.MTimeArray()
                MDoubleValueList = om.MDoubleArray()

                for index in range(len(timeList)):
                    MTimeArray.append(om.MTime(timeList[index], om.MTime.uiUnit()))
                    MDoubleValueList.append(valueList[index])

                MFnAnimCurve.addKeys(MTimeArray, MDoubleValueList, 0, 0, 1)

                for index in range(len(timeList)):
                    MFnAnimCurve.setInTangentType(index, inTangentTypeList[index])
                    MFnAnimCurve.setOutTangentType(index, outTangentTypeList[index])

                    inTangentAngle = om.MAngle(inTangentAngleList[index])
                    outTangentAngle = om.MAngle(outTangentAngleList[index])

                    MFnAnimCurve.setAngle(index, inTangentAngle, 1)
                    MFnAnimCurve.setAngle(index, outTangentAngle, 0)

                    MFnAnimCurve.setWeight(index, inTangentAngleWeightList[index], 1)
                    MFnAnimCurve.setWeight(index, outTangentAngleWeightList[index], 0)

    # read history
    historyData = data['history']
    historyList = ['Owner: %s' % historyData[0],
                   'Created: %s' % historyData[1],
                   'Maya version: %s' % historyData[2],
                   'Module version: %s' % historyData[3]]

    return historyList
