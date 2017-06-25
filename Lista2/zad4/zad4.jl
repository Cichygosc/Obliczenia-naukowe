####################
#Autor: Jakub Pezda
#Program obliczający wielkość populacji
####################

#funkcja rekurencyjna obliczająca wielkość populacji
#i - ilość iteracji
#p0 - początkowa wielkość populacji
#r - pewna stała
function Population(i, p0, r)
	if (i == 0)
		p0
	else
		pn = Population(i - 1, p0, r)
		println(convert(typeof(p0), (pn + r * pn * (1 - pn))))
		convert(typeof(p0), (pn + r * pn * (1 - pn)))
	end
end

#funkcja rekurencyjna obliczająca wielkość populacji
#gdy i == 10 wielkość populacji zostaje zaokrąglona
#i - ilość iteracji
#p0 - początkowa wielkość populacji
#r - pewna stała
function PopulationMod(i, p0, r)
	if i == 0
		p0
	elseif i == 10
		pn = PopulationMod(i - 1, p0, r)
		pn = floor(convert(typeof(p0), (pn + r * pn * (1 - pn))), 3)
		println(pn)
		pn
	else
		pn = PopulationMod(i - 1, p0, r)
		println(convert(typeof(p0), (pn + r * pn * (1 - pn))))
		convert(typeof(p0), (pn + r * pn * (1 - pn)))
	end
end

println("Float32")
Population(40, Float32(0.01), Float32(3))
println("Float32 z modyfikacją")
PopulationMod(40, Float32(0.01), Float32(3))
println("Float64")
Population(40, Float64(0.01), Float64(3))
println("Float64 z modyfikacją")
PopulationMod(40, Float64(0.01), Float32(3))