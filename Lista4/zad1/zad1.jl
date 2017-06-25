###################
#Autor: Jakub Pezda
###################

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

println(ilorazyRoznicowe([3.0, 1.0, 5.0, 6.0], [1.0, -3.0, 2.0, 4.0]))
println(ilorazyRoznicowe([0.0, 1.0, 3.0, 4.0], [1.0, 3.0, 2.0, 1.0]))