####################
#Autor: Jakub Pezda
#Program znajdujący epsilony maszynowe dla wszystkich typów
####################

#Zwraca epsilon maszynowy dla danego typu
#x - liczba od której rozpoczynam szukanie, powinna być równa jeden,
#	 musi być podana aby wiedzieć dla jakiego typu szukamy epsilonu
function FindMacheps(x)
	divisor = convert(typeof(x), 2)		#musimy skonwertować liczbę dwa na podany typ
	while convert(typeof(x), 1) + x / divisor > 1.0	#dla pewności konwertuję również jedynkę
		x /= divisor
	end
	x
end

println("macheps Float16: ", FindMacheps(Float16(1)))
println("macheps Float32: ", FindMacheps(Float32(1)))
println("macheps Float64: ", FindMacheps(Float64(1)))

println("eps(Float16): ", eps(Float16))
println("eps(Float32): ", eps(Float32))
println("eps(Float64): ", eps(Float64))



