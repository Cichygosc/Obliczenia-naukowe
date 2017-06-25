###################
#Autor: Jakub Pezda
###################

module blocksys

	export loadMatrix
	export loadVector
	export solveLinearSystem
	export solveLinearSystemWithRootElement
	export calculateVector
	export saveSolutionToFile

	#Funkcja wczytuje macierz z podanego pliku oraz zwraca tą macierz
	#inputfile - plik, z którego macierz jest wczytywana
	function loadMatrix(inputfile::String)
		open(inputfile) do f
			x = split(readline(f))
			n = parse(Int64, x[1])
			l = parse(Int64, x[2])
			v = convert(Int64, n / l)
			elements = v * l * l + (v - 1) * l + (v - 1) * l
			I = Array(Int64, elements)
			J = Array(Int64, elements)
			V = Array(Float64, elements)
			iter = 1
			while !eof(f)
				x = split(readline(f))
				I[iter] = parse(Int64, x[1])
				J[iter] = parse(Int64, x[2])
				V[iter] = parse(Float64, x[3])
				iter += 1
			end

			(sparse(I, J, V), n, l)
		end
	end

	#Funkcja wczytuje wektor z podanego pliku oraz zwraca ten wektor
	#inputfile - plik, z którego wektor jest wczytywany
	function loadVector(inputfile::String)
		open(inputfile) do f
			n = parse(Int64, readline(f))
			b = Array(Float64, n)
			iter = 1
			while !eof(f)
				b[iter] = parse(Float64, readline(f))
				iter += 1
			end
			return b
		end
	end

	#Funkcja rozwiązująca równanie Ax = b metodą eliminacji gaussa
	#Input:
	#A - macierz kwadratowa
	#n - wielkość macierzy, n > 1
	#b - wektor
	#Output:
	#x - rozwiązanie równania Ax = b
	function solveLinearSystem(A::SparseMatrixCSC{Float64, Int64}, n::Int64, l::Int64, b::Vector{Float64}, error::Bool)

		for k in 1:n - 1
			#ilość rzędów, które należy wyzerować w danej kolumnie
			#w związku ze specyficzną budową macierzy nie musimy zerować wszystkich elementów
			rowsToReset = convert(Int64, l + l * floor(k / l))	
			#ilość kolumn w pierwszym rzędzie do obliczenia
			columns = convert(Int64, min(k + l, n))
			for i in k + 1:rowsToReset
				z = A[i, k] / A[k, k]
				A[i, k] = 0
				for j in k + 1:columns
					A[i, j] = A[i, j] - z * A[k, j]
				end
				b[i] = b[i] - z * b[k]
			end
		end
		
		#println(A)

		x = Array(Float64, n)

		for i in n:-1:1
			suma = 0.0
			limit = min(n, i + l)
			for j in i + 1:limit
				suma += A[i, j] * x[j]
			end
			x[i] = (b[i] - suma) / A[i, i]
		end

		if error
			onesVector = ones(n)
			println(norm(onesVector - x) / norm(onesVector))
		end

		x
	end

	#Funkcja rozwiązująca równanie Ax = b metodą eliminacji gaussa z częściowym wyborem elementu głównego
	#Input:
	#A - macierz kwadratowa
	#n - wielkość macierzy, n > 1
	#l - rozmiar wszystkich kwadratowych macierzy wewnętrznych
	#b - wektor
	#Output:
	#x - rozwiązanie równania Ax = b
	#error - jeżeli wszystkie elementy w danej kolumnie są zerem
	function solveLinearSystemWithRootElement(A::SparseMatrixCSC{Float64, Int64}, n::Int64, l::Int64, b::Vector{Float64}, error::Bool)
		
		p = collect(1:n)

		for k in 1:n - 1
			rowsToReset = convert(Int64, l + l * floor(k / l))
			columns = convert(Int64, min(p[k] + l, n))
			for i in k + 1:rowsToReset

				if (abs(A[p[k], k]) < eps(Float64))
					row = p[i]
					max = abs(A[p[i], k])
					for x in i + 1:rowsToReset
						if (abs(A[p[x], k] > max))
							row = p[x]
							max = abs(A[p[x], k])
						end
					end
					if (abs(max) < eps(Float64))
						error("All elements in column ", k, " are zeros")
					end

					temp = p[k]
					p[k] = row
					p[row] = temp
				end

				z = A[p[i], k] / A[p[k], k]
				A[p[i], k] = 0

				for j in k + 1:columns
					A[p[i], j] = A[p[i], j] - z * A[p[k], j]
				end
				b[p[i]] = b[p[i]] - z * b[p[k]]
			end
		end

		#println(b)
		#println(A)

		x = Array(Float64, n)

		for i in n:-1:1
			suma = 0.0
			limit = min(n, p[i] + l)
			for j in i + 1:n
				suma += A[p[i], j] * x[j]
			end
			x[i] = (b[p[i]] - suma) / A[p[i], i]
		end

		if error
			onesVector = ones(n)
			println(norm(onesVector - x) / norm(x))
		end

		x
	end

	#Funkcja obliczająca wektor prawych stron na podstawie wektora x, gdzie x = (1,...1)^T
	#Input:
	#A - macierz dla, której obliczony zostanie wektor prawych stron
	#n - wielkość macierzy
	#l - rozmiar wszystkich kwadratowych macierzy wewnętrznych
	#Output:
	#b - wektor prawych stron, rozwiązanie równania b = Ax
	function calculateVector(A::SparseMatrixCSC{Float64, Int64}, n::Int64, l::Int64)
		b = zeros(Float64, n)
		#do, którego elementu obliczać sumę
		to = l
		#od, którego elementu obliczać sumę
		from = 1
		for i in 1:n
			for j in from:to
				b[i] += A[i, j]
			end 
			#dodaj element z macierzy C, jeżeli nie jesteśmy w ostatniej macierzy wewnętrznej A
			if (i + l <= n)
				b[i] += A[i, i + l]
			end
			#zmień zakres sumowania, jeżeli skończyliśmy obliczać ostatni rząd w macierzy wewnętrznej A
			if (i % l == 0)
				from = convert(Int64, l * (i / l))
				to += l
			end
		end
		b
	end

	#Funkcja zapisująca rozwiązanie równania Ax = b
	#Input:
	#outputfile - plik do którego zapisać rozwiązanie
	#x - rozwiązanie równania
	#n - ilość elementów w wektorze
	#relativeError - czy zapisać również błąd względny
	function saveSolutionToFile(outputfile::String, x::Array{Float64}, n::Int64, error::Bool)
		open(outputfile, "w") do f
			if error
				onesVector = ones(n)
				println(f, norm(onesVector - x) / norm(x))
			end
			for i in 1:n
				println(f, x[i])
			end
		end
	end

end