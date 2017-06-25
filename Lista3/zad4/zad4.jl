###################
#Autor: Jakub Pezda
###################

using Metody

#funkcja dla której szukane są miejsca zerowe
function f(x)
	sin(x) - (1/2*x)^2
end

#pochodna powyższej funkcji
function pf(x)
	cos(x) - x/2
end

println(mbisekcji(f, 1.5, 2.0, 1/2*10.0^-5, 1/2*10.0^-5))
println(mstycznych(f, pf, 1.5, 1/2*10.0^-5, 1/2*10.0^-5))
println(msiecznych(f, 1.0, 2.0, 1/2*10.0^-5, 1/2*10.0^-5))