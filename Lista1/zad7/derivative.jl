####################
#Autor: Jakub Pezda
#Program obliczający wielkość błędu przybliżenia wartości pochodnej
####################

#funkcja f podana w treści zadania
function f(x)
	sin(x) + cos(3x)
end

#funkcja zwraca wartość pochodnej funkcji f
#x - punkt dla, którego liczona jest pochodna
function derivative(x)
	cos(x) - 3sin(3x)
end

#funkcja zwraca przybliżoną wartość pochodnej funkcji f
#x - punkt dla, którego należy obliczyć wartość pochodnej
#h - wartość poprawiająca przybliżenie pochodnej
function derivative(x0, h)
	(f(x0 + h) - f(x0)) / h
end

#x0 - punkt dla którego liczona jest pochodna
x0 = float64(1)
#dokładna wartość pochodnej w punkcie x0
der = derivative(x0)
#ilość liczb dla których wykonać test
n = 54

for i = 0:n
	println("błąd dla n == ", i, " ", abs(der - derivative(x0, float64(2)^(-i))))
	#dla przejrzystości nie wyświetlam błędu dla wartości 1 + h
	#println("błąd dla n == ", i, " ", abs(der - derivative(x0, 1 + float64(2)^(-i))))
end


