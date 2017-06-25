####################
#Autor: Jakub Pezda
#Program znajdujący rozwiązanie układu liniowego za pomocą algorytmu eliminacji Gaussa oraz równania x = inv(A) * b
####################

include("matcond.jl")
include("hilb.jl")

#funkcja rozwiązująca układ równań
#A - macierz
#n - rozmiar macierzy
function FindSolution(A, n)
	x = ones(Float64, n)	#dokładny wynik
	b = A * x 				#wektor prawych stron
	xG = A \ b				#eliminacja Gaussa
	xI = inv(A) * b			#macierz odwrotna
	println("n == ", n, " ", abs(norm(x) - norm(xG)), " ", abs(norm(x) - norm(xI)), " rank == ", rank(A), " cond == ", cond(A))
end

#a
println("Macierz Hilberta")
n = 20
for i = 1:n
	A = hilb(i)
	FindSolution(A, i)
end

#b
println("Macierz losowa")
for n in [5, 10, 20], c = [1.0, 10.0, 10.0^3, 10.0^7, 10.0^12, 10.0^16]
	A = matcond(n, c)
	FindSolution(A, n)
end
