import numpy as np


def getMatrixAsNpArray(tempMatrix):
    """
    get the target matrix data and return as a npArray
    :param tempMatrix: list, matrix data in list(worldMatrix, matrix, bindPose)
    :return: matrix in npArray
    """
    npArray = np.array([
                        [tempMatrix[0], tempMatrix[1], tempMatrix[2], tempMatrix[3]],
                        [tempMatrix[4], tempMatrix[5], tempMatrix[6], tempMatrix[7]],
                        [tempMatrix[8], tempMatrix[9], tempMatrix[10], tempMatrix[11]],
                        [tempMatrix[12], tempMatrix[13], tempMatrix[14], tempMatrix[15]]
                       ])
    return npArray


def getSkinMatrix(bindMatrix, globalTransMatrix):
    bindMatrix = getMatrixAsNpArray(bindMatrix)
    globalTransMatrix = getMatrixAsNpArray(globalTransMatrix)
    bindMatrixInverse = np.linalg.inv(bindMatrix)

    return np.dot(bindMatrixInverse, globalTransMatrix)
