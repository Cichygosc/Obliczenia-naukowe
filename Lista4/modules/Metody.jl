###################
#Autor: Jakub Pezda
###################

module Metody

	using PyPlot

	export ilorazyRoznicowe
	export warNewton
	export rysujNnfx
	export zad4
	export zad5

	#funkcja wyznaczająca ilorazy roznicowe 
	#x - wektor zawierający węzły x0,...xn
	#f - wektor zawierający wartości interpolowanej funkcji
	#fx - wektor zawierający obliczone ilorazy różnicowe
	function ilorazyRoznicowe(x::Vector{Float64}, f::Vector{Float64})
		n = length(x)
		fx = Array{Float64}(n)

		for i = 1:n
			fx[i] = f[i]
		end

		for j = 2:n
			for i = n:-1:j
				fx[i] = (fx[i] - fx[i - 1])/(x[i] - x[i - j + 1])
			end
		end

		return fx
	end

	#funkcja obliczająca wartość wielomianu w podanym punkcie 
	#x - wektor zawierający węzły x0,...xn
	#fx - wektor zawierający ilorazy różnicowe
	#t - punkt, w którym należy obliczyć wartość wielomianu
	#nt - wartość wielomianu w punkcie t
	function warNewton(x::Vector{Float64}, fx::Vector{Float64}, t::Float64)
		n = length(x)
		w = Array{Float64}(n)

		w = fx[n]
		for i = n - 1: -1: 1
			w = fx[i] + (t - x[i]) * w
		end

		return w
	end

	#funkcja rysująca interpolowaną funkcję oraz wielomian interpolacyjny w podanym przedziale 
	#f - funkcja do interpolacji
	#a - początek przedziału
	#b - koniec przedziału
	#n - stopień wielomianu interpolacyjnego
	function rysujNnfx(f, a::Float64, b::Float64, n::Int)

		x = Array{Float64}(n + 1)
		y = Array{Float64}(n + 1)

		h = (b - a) / n
		for i = 1: n + 1
			x[i] = a + (i - 1) * h 
			y[i] = f(x[i])
		end

		fx = ilorazyRoznicowe(x, y)

		n = n * 20
		x2 = Array{Float64}(n + 1)
		y2 = Array{Float64}(n + 1)
		w = Array{Float64}(n + 1)
		h = (b -a) / n
		for i = 1: n + 1
			x2[i] = a + (i - 1) * h 
			y2[i] = f(x2[i])
		end

		for i = 1:n + 1
			w[i] = warNewton(x, fx, x2[i])
		end

		figure(figsize=(6, 3))
		range = [a:0.01:b;]
		plot(range, [f(c) for c in range], linewidth = 2.0)
		plot(x2, w, linewidth = 2.0, marker = "o")
	end

	function zad4()
		for n in [5, 10, 15]
			rysujNnfx(x -> e^x, 0.0, 1.0, n)
		end

		for n in [5, 10, 15]
			rysujNnfx(x -> x^2 * sin(x), -1.0, 1.0, n)
		end
	end

	function zad5()
		for n in [5, 10, 15]
			rysujNnfx(x -> abs(x), -1.0, 1.0, n)
		end

		for n in [5, 10, 15]
			rysujNnfx(x -> 1 / (1 + x^2), -5.0, 5.0, n)
		end
	end

end