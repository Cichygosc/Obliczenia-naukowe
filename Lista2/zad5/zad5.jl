####################
#Autor: Jakub Pezda
####################

#i - ilość iteracji
#x0 - wartość początkowa
#c - stała
function Recur(i::Int64, x0::Float64, c::Float64)
	if (i == 0)
		x0
	else
		xn = Recur(i - 1, x0, c) ^ 2 + c
		println(xn)
		xn
	end
end

println("x0 = 1 c = -2")
Recur(40, 1.0, -2.0)

println("x0 = 2 c = -2")
Recur(40, 2.0, -2.0)

println("x0 = 1.99999999999999 c = -2")
Recur(40, 1.99999999999999, -2.0)

println("x0 = 1 c = -1")
Recur(40, 1.0, -1.0)

println("x0 = -1 c = -1")
Recur(40, -1.0, -1.0)

println("x0 = 0.75 c = -1")
Recur(40, 0.75, -1.0)

println("x0 = 0.25 c = -1")
Recur(40, 0.25, -1.0)