import maya.api.OpenMaya as om
import maya.api.OpenMayaAnim as oma
import maya.cmds as cmds
import json

filePath = 'C:/Users/user/Desktop/AnimCurve.Anim'

animData = open(filePath, 'r')
data = json.load(animData)
animData.close()

selectionList = cmds.ls(sl=1)
if data and selectionList:
    for eachObject in selectionList:
        for eachAttribute in data[eachObject]:
            for eachAnimCurveAttribute in data[eachObject][eachAttribute]:

                # get value
                animCurveType = eachAnimCurveAttribute['animCurveType']
                preInfinity = eachAnimCurveAttribute['preInfinity']
                postInfinity = eachAnimCurveAttribute['postInfinity']
                weightedTangents = eachAnimCurveAttribute['weightedTangents']
                numKeys = eachAnimCurveAttribute['numKeys']
                timeList = eachAnimCurveAttribute['timeList']
                valueList = eachAnimCurveAttribute['valueList']
                inTangentTypeList = eachAnimCurveAttribute['inTangentTypeList']
                inTangentAngleList = eachAnimCurveAttribute['inTangentAngleList']
                inTangentAngleWeightList = eachAnimCurveAttribute['inTangentAngleWeightList']
                outTangentTypeList = eachAnimCurveAttribute['outTangentTypeList']
                outTangentAngleList = eachAnimCurveAttribute['outTangentAngleList']
                outTangentAngleWeightList = eachAnimCurveAttribute['outTangentAngleWeightList']

                # convert current object and attribute to a new MPlug object
                mSelectionList = om.MSelectionList()
                mSelectionList.add(eachAnimCurveAttribute)

                attributeMPlug = mSelectionList.getPlug(0)

                connectedList = attributeMPlug.connectedTo(1, 0)

                newAnimCurve = 1
                if connectedList:
                    connectedNode = connectedList[0].node()

                    if connectedNode.hasFn(om.MFn.kAnimCurve):

                        MFnAnimCurve = oma.MFnAnimCurve(connectedNode)
                        newAnimCurve = 0

                if newAnimCurve:
                    MFnAnimCurve = oma.MFnAnimCurve()

                    # set attr
                    MFnAnimCurve.create(attributeMPlug, animCurveType)


                MFnAnimCurve.setPreInfinityType(preInfinity)
                MFnAnimCurve.setPostInfinityType(postInfinity)

                MFnAnimCurve.setIsWeighted(weightedTangents)

                MTimeArray = om.MTimeArray()
                MDoubleValueList = om.MDoubleArray()

                for index in range(len(timeList)):
                    MTimeArray.append(om.MTime(timeList[index]), om.MTime.uiUnit())
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



