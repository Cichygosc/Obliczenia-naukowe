###################
#Autor: Jakub Pezda
###################

using blocksys
using matrixgen

blockmat(20, 4 ,10.0, "A.txt")

output = loadMatrix("A.txt")
A = output[1]
n = output[2]
l = output[3]

b = calculateVector(A, n, l)						

#A \ b
#solveLinearSystem(A, n, l, b)
solveLinearSystemWithRootElement(A, n, l, b)

for i in 100:100:1000
	#println(i)
	blockmat(i, 4,10.0, "A.txt")

	#println(i)

	output = loadMatrix("A.txt")
	A = output[1]
	n = output[2]
	l = output[3]

	b = calculateVector(A, n, l)
	#println(b)							

	#b = loadVector("b.txt")
	#@time (A \ b)

	#@time(solveLinearSystem(A, n, l, b))

	#output = loadMatrix("A.txt")
	#A = output[1]
	#n = output[2]
	#l = output[3]
	#b = calculateVector(A, n, l)
	#b = loadVector("b.txt")

	@time(solveLinearSystemWithRootElement(A, n, l, b))

	#saveSolutionToFile("x.txt", x, n)

end