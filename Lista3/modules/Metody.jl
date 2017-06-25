###################
#Autor: Jakub Pezda
###################

module Metody

	export mbisekcji
	export mstycznych
	export msiecznych

	#funkcja wyznaczająca zera podanej funkcji metodą bisekcji
	#f - funkcja dla której zera są wyszukiwane
	#a - początek przdziału
	#b - koniec przedziału
	#delta, epsilon - dokładność obliczęń
	#maxit - maksymalna liczba kroków
	function mbisekcji(f, a::Float64, b::Float64, delta::Float64, epsilon::Float64)
		it = 0
		u = f(a)
		v = f(b)
		e = b - a
		if (sign(u) == sign(v))
			return 0, 0, it, 1
		end
		while true
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
		return 0, 0, it, 1
	end

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
end