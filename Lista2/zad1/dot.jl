####################
#Autor: Jakub Pezda
#Program obliczający iloczyn skalarny dwóch wektorów na cztery sposoby
####################

#oblicza iloczyn skalarny na 4 sposoby
#type - dowolna liczba, potrzeba tylko aby wiedzieć dla jakiego typu funkcja ma działać
function CalculateDot(typ)
	println(typeof(typ))
	#pierwszy wektor
	x = [convert(typeof(typ), 2.718281828), convert(typeof(typ), -3.141592654), convert(typeof(typ), 1.414213562), convert(typeof(typ), 0.577215664), convert(typeof(typ), 0.301029995)]
	#drugi wektor
	y = [convert(typeof(typ), 1486.2497), convert(typeof(typ), 878366.9879), convert(typeof(typ), -22.37492), convert(typeof(typ), 4773714.647), convert(typeof(typ), 0.000185049)]

	#ilość składników wektorów
	n = 5

	########a########
	#obliczona suma
	s = 0 
	for i = 1:n
		s += x[i] * y[i]
	end
	println("a: ", s)

	########b########
	#obliczona suma
	s = 0 
	#indeks w tablicy
	j = n
	while j >= 1 
		s += x[j] * y[j]
		j -= 1
	end
	println("b: ", s)

	#tablica przechowująca iloczyny składowych wektorów x oraz y
	#potrzebna w kolejnych dwóch podpunktach
	temp = [convert(typeof(typ), 0), convert(typeof(typ), 0), convert(typeof(typ), 0), convert(typeof(typ), 0), convert(typeof(typ), 0)]
	for i = 1:n
		temp[i] = x[i] * y[i]
	end

	########c########
	#posortuj tablicę malejąco
	sort!(temp, rev = true)
	#suma liczb większych od zera
	sd = convert(typeof(typ), 0)
	#suma liczb mniejszych od zera
	sm = convert(typeof(typ), 0)
	for i = 1:n
		if temp[i] > 0
			sd += temp[i]
		else sm += temp[i]
		end
	end

	println("c: ", sd + sm)

	########d########
	#posortuj tablicę rosnąco
	sort!(temp)
	#suma liczb większych od zera
	sd = 0
	#suma liczb mniejszych od zera
	sm = 0
	for i = 1:n
		if temp[i] > 0
			sd += temp[i]
		else sm += temp[i]
		end
	end

	println("d: ", sm + sd)

end

CalculateDot(Float64(1))
CalculateDot(Float32(1))