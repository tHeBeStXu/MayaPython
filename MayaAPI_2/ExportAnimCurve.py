import maya.api.OpenMaya as om
import maya.api.OpenMayaAnim as oma
import maya.cmds as cmds
import json

filePath = 'C:/Users/user/Desktop/AnimCurve.Anim'

objects = cmds.ls(sl=1)
if objects:
    animDataDict = {}
    for currentObject in objects:
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

                    nodeAnimInformationDict.setdefault(attributeName)

        animDataDict.setdefault(currentObject.encode(), nodeAnimInformationDict)

    # write anim data
    if animDataDict:
        animData = open(filePath, 'w')
        data = json.dumps(animDataDict, indent=4)
        animData.write(data)
        animData.close()

        print 'Successfully store animation curve data!'





