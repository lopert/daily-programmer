# https://www.reddit.com/r/dailyprogrammer/comments/52enht/20160912_challenge_283_easy_anagram_detector/

def ana (input_string)

	sides = input_string.split(" ? ").map { |e| e.gsub("\"", "") }

	if (sort_letters(sides[0]) == sort_letters(sides[1])) and (sort_words(sides[0]) != sort_words(sides[1]))
		puts sides[0] + " is an anagram of " + sides[1]
	else
		puts sides[0] + " is NOT an anagram of " + sides[1]
	end

end

def sort_words(side)
	side.downcase.split().sort
end

def sort_letters(side)
	side.gsub(/[^\p{Alpha}]/, '').downcase.chars.sort.join
end

ana("\"Clint Eastwood\" ? \"Old West Action\"")
ana("\"wisdom\" ? \"mid sow\"")
ana("\"Seth Rogan\" ? \"Gathers No\"")
ana("\"Reddit\" ? \"Eat Dirt\"")
ana("\"Schoolmaster\" ? \"The classroom\"")
ana("\"Astronomers\" ? \"Moon starer\"")
ana("\"Vacation Times\" ? \"I'm Not as Active\"")
ana("\"Dormitory\" ? \"Dirty Rooms\"")
ana("\"This shall not pass\" ? \"Pass this shall not\"")