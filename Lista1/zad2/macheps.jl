####################
#Autor: Jakub Pezda
#Program obliczający epsilony maszynowe dla wszystkich typów według wzoru Kahan'a
####################

#Oblicza oraz zwraca epsilon maszynowy
#x - dowolna liczba, podana tylko aby wiedzieć dla jakiego typu wykonujemy obliczenia
function CalculateMacheps(x)
	three = convert(typeof(x), 3)		#przekonwertuj trzy na dany typ
	four = convert(typeof(x), 4)		#przekonwertuj cztery na dany typ
	one = convert(typeof(x), 1)			#przekonwertuj jeden na dany typ
	three * (four / three - one) - one	#podstaw wartości do wzoru
end

println("macheps Float16: ", CalculateMacheps(float16(1)))
println("macheps Float32: ", CalculateMacheps(float32(1)))
println("macheps Float64: ", CalculateMacheps(float64(1)))