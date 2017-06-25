###################
#Autor: Jakub Pezda
###################

using Metody

for n in [5, 10, 15]
	rysujNnfx(x -> e^x, 0.0, 1.0, n)
end

for n in [5, 10, 15]
	rysujNnfx(x -> x^2 * sin(x), -1.0, 1.0, n)
end