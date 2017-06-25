###################
#Autor: Jakub Pezda
###################

#funkcja wyznaczająca zera podanej funkcji metodą bisekcji
#f - funkcja dla której zera są wyszukiwane
#a - początek przdziału
#b - koniec przedziału
#delta, epsilon - dokładność obliczęń
#maxit - maksymalna liczba kroków
function mbisekcji(f, a::Float64, b::Float64, delta::Float64, epsilon::Float64, maxit::Int)
	it = 0
	u = f(a)
	v = f(b)
	e = b - a
	if (sign(u) == sign(v))
		return 0, 0, it, 1
	end
	for i = 1:maxit
		e = e / 2
		c = a + e
		w = f(c)
		it += 1
		if (abs(e) < delta || abs(w) < epsilon)
			return c, w, it, 0
		end
		if (sign(w) != sign(u))
			b = c
			v = w
		else
			a = c
			u = w
		end
	end
	return 0, 0, 0, 1
end

println(mbisekcji(x -> x^3 - x + 1, -2.0, 2.0, 2.0^-24, 2.0^-24, 50))
println(mbisekcji(x -> x^3*(x+sin(x^2-1)-1)-1, -1.0, 0.0, 2.0^-24, 2.0^-24, 50))
println(mbisekcji(x -> x^3*(x+sin(x^2-1)-1)-1, 1.0, 2.0, 2.0^-24, 2.0^-24, 50))