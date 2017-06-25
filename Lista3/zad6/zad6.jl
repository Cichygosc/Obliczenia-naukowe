###################
#Autor: Jakub Pezda
###################

using Metody

#funkcja dla której szukane są miejsca zerowe
function f1(x)
	e^(1-x) - 1
end

#pochodna powyższej funkcji
function pf1(x)
	-e^(1-x)
end

#funkcja dla której szukane są miejsca zerowe
function f2(x)
	x*e^(-x)
end	

#pochodna powyższej funkcji
function pf2(x)
	-e^(-x)*(x-1)
end

println("Metoda bisekcji")
println(mbisekcji(f1, 0.0, 2.0, 10.0^-5, 10.0^-5, 50))
println(mbisekcji(f2, -1.0, 1.0, 10.0^-5, 10.0^-5, 50))

println("Metoda stycznych")
println(mstycznych(f1, pf1, 10.0, 10.0^-5, 10.0^-5, 10000000))
println(mstycznych(f2, pf2, 3.0, 10.0^-5, 10.0^-5, 50))

println("Metoda siecznych:")
println(msiecznych(f1, 20.0, 30.0, 10.0^-5, 10.0^-5, 50))
println(msiecznych(f2, 5.0, 10.0, 10.0^-5, 10.0^-5, 50))