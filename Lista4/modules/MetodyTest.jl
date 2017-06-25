###################
#Autor: Jakub Pezda
###################

using Metody
using Base.Test

@testset "Wyznaczenie ilorazów różnicowych" begin
	@test isapprox(ilorazyRoznicowe([3.0, 1.0, 5.0, 6.0], [1.0, -3.0, 2.0, 4.0]), [1.0,2.0,-0.375,0.175])
	@test isapprox(ilorazyRoznicowe([0.0, 1.0, 3.0, 4.0], [1.0, 3.0, 2.0, 1.0]), [1.0,2.0,-0.83333333333,0.16666666667])
end

@testset "Obliczenie wartości wielomianu" begin 
	@test warNewton([0.0, 1.0, 3.0, 4.0], [1.0, 2.0, -0.8333333, 0.166667], 1.0) == 3.0
	@test warNewton([0.0, 1.0, 3.0, 4.0], [1.0, 2.0, -0.8333333, 0.166667], 2.0) == 2.9999994
	@test warNewton([0.0, 1.0, 3.0, 4.0], [1.0, 2.0, -0.8333333, 0.166667], 3.0) == 2.0000001999999997
end