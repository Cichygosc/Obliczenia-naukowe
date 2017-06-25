####################
#Autor: Jakub Pezda
#Program znajdujący liczbę eta dla wszystkich typów zmiennopozycyjnych
####################

#Zwraca liczbę eta dla danego typu
#x - liczba od której rozpoczynam szukanie, powinna być równa jeden,
#	 musi być podana aby wiedzieć dla jakiego typu szukamy liczby eta
function FindEta(x)
	divisor = convert(typeof(x), 2)	#konwertujemy liczbę dwa na podany typ
	while x / divisor > 0
		x /= divisor
	end
	x
end

println("eta Float16: ", FindEta(float16(1)))
println("eta Float32: ", FindEta(float32(1)))
println("eta Float64: ", FindEta(float64(1)))

println("nextfloat(Float16(0.0)): ", nextfloat(float16(0.0)))
println("nextfloat(Float32(0.0)): ", nextfloat(float32(0.0)))
println("nextfloat(Float64(0.0)): ", nextfloat(float64(0.0)))