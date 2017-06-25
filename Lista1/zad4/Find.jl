####################
#Autor: Jakub Pezda
#Program oblicza najmniejszą liczbę x taką, że x * 1/x != 1
####################

#x - kolejna liczba większa od 1
x = nextfloat(float64(1))

#dopóki x * 1/x == 1 zwiększaj x
while float64(x * float64(1 / x)) == 1
	x = nextfloat(float64(x))
end

println(x)