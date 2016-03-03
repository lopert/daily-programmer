def oblique (matrix_as_string)
	matrix = parse(matrix_as_string)
	num_diags = matrix.length + matrix[0].length - 2
	oblique = []

	for i in 0..(num_diags) #there are as many diagonals as this, loop this many times
		j = 0
		row = []

		while i > -1
			unless matrix[j].nil?
				unless matrix[i].nil?
					row.push(matrix[j][i])
				end
			end			
			i -= 1
			j += 1
		end
		oblique.push(row)
	end
	print_matrix(oblique)
end

def parse (matrix_as_string)
	matrix = []
	rows = matrix_as_string.split("\n")
	rows.each do |row|
		matrix.push(row.split(" "))
	end
	matrix
end

def print_matrix(matrix)
	matrix.each_index {|x|
		matrix[x].each_index {|y|
			print matrix[x][y]
			print " "
		}
		puts ""
	}
end

oblique("1 2 3
4 5 6
7 8 9")

puts ""

oblique("0 1 2 3 4 5
6 7 8 9 10 11
12 13 14 15 16 17
18 19 20 21 22 23
24 25 26 27 28 29
30 31 32 33 34 35")