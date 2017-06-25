####################
#Autor: Jakub Pezda
#Program porównujący wartości zwracane przez takie same funckcje lecz inaczej zapisane
####################

#funkcja f podana w treści zadania
function F(x)
	sqrt(x * x + float64(1)) - float64(1)
end

#funkcja g podana w treści zadania
function G(x)
	x * x / (sqrt(x * x + float64(1)) + float64(1))
end

#ilość wyników do porównania
n = 5

for i = 1:n
	println("F(8^-", i, ")= ", F(float64(8)^(-i)))
	println("G(8^-", i, ")= ", G(float64(8)^(-i)))
	println()
end