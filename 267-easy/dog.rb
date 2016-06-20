def dogwin(placement=0,limit=100)
	result = ""
	for i in 1..limit
		unless i == placement
			result += num_to_ord(i) 
			result += ", " unless i == limit
		end
	end
	puts result
end

def num_to_ord(n)

	nstr = n.to_s
	nstrm1 = nstr[-1]
	nstrm2 = nstr[-2..-1]


	if nstrm1 == "1" and nstrm2 != "11"
		nstr + "st"
	elsif nstrm1 == "2" and nstrm2 != "12"
		nstr + "nd"
	elsif nstrm1 == "3" and nstrm2 != "13"
		nstr + "rd"
	else
		nstr + "th"
	end
end

dogwin()
puts
dogwin(2,30)
puts
dogwin(50,120)