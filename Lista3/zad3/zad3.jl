###################
#Autor: Jakub Pezda
###################

#makro zamieniające wartości dwóch zmiennych
macro swap(x,y)
   quote
      local tmp = $(esc(x))
      $(esc(x)) = $(esc(y))
      $(esc(y)) = tmp
    end
end

#funkcja wyznaczająca zera podanej funkcji metodą siecznych
#f - funkcja dla której zera są wyszukiwane
#x0, x1 - przybliżenia początkowe
#delta, epsilon - dokładność obliczęń
#maxit - maksymalna liczba iteracji
function msiecznych(f, x0::Float64, x1::Float64, delta::Float64, epsilon::Float64, maxit::Int)
	fa = f(x0)
	fb = f(x1)
	it = 0

	for k = 2:maxit
		if (abs(fa) > abs(fb))
			@swap(x0, x1)
			@swap(fa, fb)
		end

		s = (x1 - x0) / (fb - fa)
		x1 = x0
		fb = fa
		x0 = x0 - fa * s
		fa = f(x0)
		it += 1
		if (abs(fa) < epsilon || (abs(x1 - x0) < delta))
			return x0, fa, it, 0
		end
	end

	return x0, fa, it, 1
end

println(msiecznych(x -> x^3 - x + 1, -2.0, 2.0, 2.0^-24, 2.0^-24, 50))
println(msiecznych(x -> x^3*(x+sin(x^2-1)-1)-1, -1.0, 0.0, 2.0^-24, 2.0^-24, 50))
println(msiecznych(x -> x^3*(x+sin(x^2-1)-1)-1, 1.0, 2.0, 2.0^-24, 2.0^-24, 50))