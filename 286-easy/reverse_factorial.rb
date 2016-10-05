# https://www.reddit.com/r/dailyprogrammer/comments/55nior/20161003_challenge_286_easy_reverse_factorial/    

def reverse_factorial(input)
	output(input, logic(input))
end    

def logic(number, divider=1.0)
	nd = number/divider

	if nd == 1
		return divider.to_i
	elsif nd == 0
		return -1
	elsif nd % 1 != 0
		return -1
	else
		logic(nd, divider+1)
	end
end    

def output(input, result)
	if result == -1
		puts "#{input} NONE"
	else
		puts "#{input} = #{result}!"
	end
end    

reverse_factorial(120)				# 120 = 5!
reverse_factorial(3628800)			# 3628800 = 10!
reverse_factorial(479001600)		# 479001600 = 12!
reverse_factorial(6)				# 6 = 3!
reverse_factorial(18)				# 18 NONE
reverse_factorial(0)				# 0 NONE
reverse_factorial(1)				# 1 = 1!
reverse_factorial(122)				# 122 NONE