###################
#Autor: Jakub Pezda
###################

using Metody

for n in [5, 10, 15]
	rysujNnfx(x -> abs(x), -1.0, 1.0, n)
end

for n in [5, 10, 15]
	rysujNnfx(x -> 1 / (1 + x^2), -5.0, 5.0, n)
end