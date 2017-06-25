###################
#Autor: Jakub Pezda
###################

using Metody

println(mbisekcji(x -> 3x - e^x, 0.0, 1.0, 10.0^-4, 10.0^-4, 50))
println(mbisekcji(x -> 3x - e^x, 1.0, 2.0, 10.0^-4, 10.0^-4, 50))