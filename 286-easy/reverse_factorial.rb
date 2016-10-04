# https://www.reddit.com/r/dailyprogrammer/comments/55nior/20161003_challenge_286_easy_reverse_factorial/    

def rev_fact(number)
	output(number, logic(number))
end    

def logic(number, divider=1)
	nd = number/divider    

	if nd == 1
		return divider
	elsif nd == 0
		return -1
	else
		logic(nd, divider+1)
	end
end    

def output(number, result)
	if result == -1
		puts number.to_s + " NONE"
	else
		puts number.to_s + " = " + result.to_s + "!"
	end
end    

rev_fact(120)			# 120 = 5!
rev_fact(3628800)		# 3628800 = 10!
rev_fact(479001600)		# 479001600 = 12!
rev_fact(6)				# 6 = 3!
rev_fact(18)			# 18 NONE
rev_fact(0)				# 0 NONE
rev_fact(1)				# 1 = 1!