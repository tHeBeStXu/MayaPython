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


def updateSkinWeight():
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


def selectMostElement(weightArray, maxNum):
    """
    Get the most effect weights indices for further solveQP()
    :param weightArray: numpy.array, rough weight array
    :param maxNum: int, maximum number of the weight, which is equal to max influence number.
    :return: numpy.array, index of the most effect joint
    """

    indexArray = weightArray.argsort()[-maxNum:][::-1]

    return indexArray


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
    # Also see func testQP().
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


def updateMatrix(matrix, indices):
    """
    Get selected matrix element with indices and make a new matrix.
    :param matrix: numpy.array, input matrix for update.
    :param indices: numpy.array, indices of the element.
    :return: numpy.array, selected element matrix.
    """
    newArray = np.empty([len(indices) * 3, ])

    for i in xrange(len(indices)):
        newArray[i * 3 + 0] = matrix[indices[i] * 3 + 0]
        newArray[i * 3 + 1] = matrix[indices[i] * 3 + 1]
        newArray[i * 3 + 2] = matrix[indices[i] * 3 + 2]

    return newArray


def updateSkinWeightPerVertex(A, b,
                              maxInfluence):
    """
    Update skin weight per vertex
    :param A: numpy.array, input matrix A.
    :param b: numpy.array, input matrix b.
    :param maxInfluence: int, number of joints which each vertex is influenced by
    :return: numpy.array, skin weight for each vertex.
    """
    # step0: prepare parameters
    G = -np.eye(A.shape[0])
    h = np.zeros(A.shape[0])
    G_eq = np.ones(A.shape[0])
    h_eq = 1

    # step1: solve QP for all joint weight
    roughWeights = solveQP(A=A, b=b, G=G, h=h, G_eq=G_eq, h_eq=h_eq)

    # step2: select Most effect weight and change
    weightIndices = selectMostElement(roughWeights, maxInfluence)
    selected_A = updateMatrix(A, weightIndices)
    selected_b = updateMatrix(b, weightIndices)
    selected_G = -np.eye(len(weightIndices))
    selected_h = np.zeros(len(weightIndices))
    selected_G_eq = np.ones(len(weightIndices))

    # step3: solveQP for selected weights
    validWeights = solveQP(A=selected_A,
                           b=selected_b,
                           G=selected_G,
                           h=selected_h,
                           G_eq=selected_G_eq,
                           h_eq=h_eq)

    # step4: refresh the weight
    finalWeights = np.zeros(roughWeights.shape)
    for i in xrange(len(weightIndices)):
        finalWeights[weightIndices[i]] = validWeights[i]
