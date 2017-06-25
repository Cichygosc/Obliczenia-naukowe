####################
#Autor: Jakub Pezda
#Program znajdujący zera wielomianu oraz sprawdzający wartości wielomianu w wyliczonych zerach
####################

using Polynomials

w=[1, -210.0, 20615.0,-1256850.0,
      53327946.0,-1672280820.0, 40171771630.0, -756111184500.0,          
      11310276995381.0, -135585182899530.0,
      1307535010540395.0,     -10142299865511450.0,
      63030812099294896.0,     -311333643161390640.0,
      1206647803780373360.0,     -3599979517947607200.0,
      8037811822645051776.0,      -12870931245150988800.0,
      13803759753640704000.0,      -8752948036761600000.0,
      2432902008176640000.0]

P = Poly([w[21], w[20], w[19], w[18], w[17], w[16], w[15], w[14], w[13], w[12], w[11], w[10], w[9], w[8], w[7], w[6], w[5], w[4], w[3], w[2], w[1]])

p = poly([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20])

z = roots(P)

for i = 1:20
	println(z[i])
end

println("P")
for i = 1:20
	println(abs(polyval(P, z[i])))
end

println("p")
for i = 1:20
	println(abs(polyval(p, z[i])))
end

println("zk - k")
for i = 1:20
	println(abs(z[i] - i))
end

w[2] = -210-2^(-23.0)

P = Poly([w[21], w[20], w[19], w[18], w[17], w[16], w[15], w[14], w[13], w[12], w[11], w[10], w[9], w[8], w[7], w[6], w[5], w[4], w[3], w[2], w[1]])

z = roots(P)

println("zera")
for i = 1:20
	println(z[i])
end

println("P")
for i = 1:20
	println(abs(polyval(P, z[i])))
end

println("p")
for i = 1:20
      println(abs(polyval(p, z[i])))
end