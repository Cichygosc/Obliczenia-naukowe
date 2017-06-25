###################
#Autor: Jakub Pezda
###################

#funkcja wyznaczająca ilorazy roznicowe 
#x - wektor zawierający węzły x0,...xn
#fx - wektor zawierający ilorazy różnicowe
#t - punkt, w którym należy obliczyć wartość wielomianu
#nt - wartość wielomianu w punkcie t
function warNewton(x::Vector{Float64}, fx::Vector{Float64}, t::Float64)
	n = length(x)

	nt = fx[n]
	for i = n - 1: -1: 1
		nt = fx[i] + (t - x[i]) * nt
	end

	return nt
end

println(warNewton([0.0, 1.0, 3.0, 4.0], [1.0, 2.0, -0.8333333, 0.166667], 1.0))
println(warNewton([0.0, 1.0, 3.0, 4.0], [1.0, 2.0, -0.8333333, 0.166667], 2.0))
println(warNewton([0.0, 1.0, 3.0, 4.0], [1.0, 2.0, -0.8333333, 0.166667], 3.0))