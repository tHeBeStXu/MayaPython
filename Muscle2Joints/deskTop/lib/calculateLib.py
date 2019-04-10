import numpy as np
import qpsolvers


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


def initialize(iniPos, samples, vertices, numJoints, numMaxInfluence):
    # Initialize Weights

    # for jnt in numJoints:
    #     Inset Joint
    #     UpdateWeights():
    #     updateTransform():
    pass


def updateWeights():
    pass


def updateTransform():
    pass


def build():
    # initialize

    # Skin decomposition

    pass


def concatenatePointLists(dict):
    returnVal = np.empty([0, 3])

    for key in dict.keys():
        points = np.array([[p[0], p[1], p[2]]for p in dict[key]])

        returnVal = np.append(returnVal, points.reshape(-1, 3), axis=0)

    return returnVal


def solveQP(A, b, G, h, G_eq, h_eq):
    """
    Solve           ||A x - b||_2 ^2    least squares problem in QP form.
    Subject to      G * x <= h
                    G_eq * x = h_eq
    :param A: numpy.array, Matrix A
    :param b: numpy.array, array
    :param G: numpy.array, Matrix G for inequality constraint
    :param h: numpy.array, array h for inequality constraint
    :param G_eq: numpy.array, Matrix G_eq for equality constraint
    :param h_eq: numpy.array, array h_eq for equality constraint
    :return: numpy array, x for optimized
    """
    # ||A x - b||_2 ^2
    # in standard QP Problem form.
    # 1/2 x.T *     P   * x +    q.T  * x
    # 1/2 x.T * A.T * A * x - b.T * A * x
    # More details: https://scaron.info/blog/quadratic-programming-in-python.html
    # Also see test QP.
    P = np.dot(A.T, A)
    q = -np.dot(A.T, b)

    return qpsolvers.solve_qp(P, q, G, h, G_eq, h_eq)


def testQP():
    A = np.array([[1., 2., 0.], [-8., 3., 2.], [0., 1., 1.]])
    b = np.array([3., 2., 3.])
    G = np.array([[1., 2., 1.], [2., 0., 1.], [-1., 2., -1.]])
    h = np.array([3., 2., -2.])

    P = np.dot(A.T, A)
    q = -np.dot(A.T, b)
    return qpsolvers.solve_qp(P=P, q=q, G=G, h=h)
