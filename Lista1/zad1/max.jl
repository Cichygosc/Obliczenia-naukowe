####################
#Autor: Jakub Pezda
#Program znajdujący liczbę max dla wszystkich typów zmiennopozycyjnych
####################

#Zwraca max dla danego typu
#x - liczba od której rozpoczynam szukanie, powinna być równa ~2,
#	 musi być podana aby wiedzieć dla jakiego typu szukamy epsilonu
function FindMax(x)
	multi = convert(typeof(x), 2)	#konwertujemy liczbę dwa na podany typ
	while !isinf(x * multi)			#dopóki liczba nie jest nieskończonością przemnóż przez dwa
		x *= multi
	end
	x
end

println("MAX float16: ", FindMax(float16(1.999)))	
println("MAX float32: ", FindMax(float32(1.9999)))
println("MAX float64: ", FindMax(float64(1.99999)))

println("realmax(Float16): ", realmax(Float16))
println("realmax(Float32): ", realmax(Float32))
println("realmax(Float64): ", realmax(Float64))