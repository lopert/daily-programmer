def goldilocks(inputfile)

	lines = File.readlines(inputfile)
	first_line = lines.shift
	goldi_stats = first_line.split(" ").map(&:to_i)

	seats = []
	lines.each_with_index do |line, seat|
		line_stats = line.split(" ").map(&:to_i)
		#lower weight, higher tolerance
		if ((goldi_stats[0] <= line_stats[0]) && (goldi_stats[1] >= line_stats[1]))
			seats.push(seat+1)
		end
	end

	puts seats.join(" ")

end

goldilocks("./sample_input.txt")
goldilocks("./challenge_input.txt")