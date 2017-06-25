###################
#Autor: Jakub Pezda
###################

#funkcja wyznaczająca zera podanej funkcji metodą stycznych
#f - funkcja dla której zera są wyszukiwane
#pf - pochodna funkcji
#x0 - przybliżenie początkowe
#delta, epsilon - dokładność obliczęń
#maxit - maksymalna liczba iteracji
function mstycznych(f, pf, x0::Float64, delta::Float64, epsilon::Float64, maxit::Int)
	v = f(x0)
	it = 0

	if (abs(v) < epsilon)
		return x0, v, it, 0
	end

	for k = 1:maxit
		if (abs(pf(x0)) < epsilon)
			return x0, v, it, 2
		end
		x1 = x0 - v / pf(x0)
		v = f(x1)
		it += 1
		if (abs(x1 - x0) < delta || abs(v) < epsilon)
			return x1, v, it, 0
		end
		x0 = x1
	end

	return x0, f(x0), it, 1
end

println(mstycznych(x -> x^3-x+1, x -> 3*x^2-1, -1.0, 2.0^-24, 2.0^-24, 50))
println(mstycznych(x -> x^3*(x+sin(x^2-1)-1)-1, x->x^2*(-3*sin(1 - x^2) + 2*x^2*cos(1 - x^2) + 4*x - 3), -1.0, 2.0^-24, 2.0^-24, 50))
println(mstycznych(x -> x^3*(x+sin(x^2-1)-1)-1, x->x^2*(-3*sin(1 - x^2) + 2*x^2*cos(1 - x^2) + 4*x - 3), 1.0, 2.0^-24, 2.0^-24, 50))