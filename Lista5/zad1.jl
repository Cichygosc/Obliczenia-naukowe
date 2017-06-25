###################
#Autor: Jakub Pezda
###################

using blocksys
using matrixgen


output = loadMatrix("tempA.txt")
A = output[1]
n = output[2]
l = output[3]

b = loadVector("tempb.txt");

solveLinearSystem(A, n, l, b, false)

output = loadMatrix("tempA.txt")
A = output[1]
n = output[2]
l = output[3]

b = loadVector("tempb.txt");

solveLinearSystemWithRootElement(A, n, l, b, false)

output = loadMatrix("A.txt")
A = output[1]
n = output[2]
l = output[3]
b = calculateVector(A, n, l);

#@time(solveLinearSystem(A, n, l, b, true))

#x = solveLinearSystem(A, n, l, b, false)
#saveSolutionToFile("x.txt", x, n, true)

output = loadMatrix("A.txt")
A = output[1]
n = output[2]
l = output[3]
b = calculateVector(A, n, l);

#@time(solveLinearSystemWithRootElement(A, n, l, b, true))

x = solveLinearSystemWithRootElement(A, n, l, b, false)
saveSolutionToFile("x2.txt", x, n, true)
