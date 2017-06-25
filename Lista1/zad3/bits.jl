####################
#Autor: Jakub Pezda
#Program wyświetlający podaną ilość liczb z danego przedziału
####################

#ilość liczb do wyświetlenia
amount = 8

#funkcja wyświetlająca liczby z przedziału [min, max]
function ShowInterval(min, max)
	println("Przedział [", min, ",", max, "]")
	#oblicz krok dla przedziału, krok = 2^(-52 + floor(log2(min))
	#floor we wzorze jest użyte aby poprawnie obsłużyć wartość min różną od potęgi dwa
	step = Float64(2) ^ Float64(-52 + floor(log2(min)))   
	println("Krok dla przedziału: ", step)
	k = 0		#ilość wyświetlonych liczb
	while k < amount
		println(bits(min + k * step), " ", min + k * step)
		k += 1
	end
end

ShowInterval(Float64(0.5), Float64(1))
ShowInterval(Float64(1), Float64(2))
ShowInterval(Float64(2), Float64(4))

ShowInterval(Float64(128), Float64(256))