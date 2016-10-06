# https://www.reddit.com/r/dailyprogrammer/comments/55zdxx/20161005_challenge_286_intermediate_zeckendorf/

def zeckendorf(input)
	#create a list of fib numbers leading up to input
	fib_list = fib(input)

	#express input as a function of list numbers
	result = logic(input, fib_list)

	#format results for output
	output(input,result)

end

def fib(limit)
	fibs = [1, 1]
	fib_next = 0

	while (fib_next < limit)
		fibs.push(fib_next)
		fib_next = fibs[-1] + fibs[-2]
	end

	fibs
end

def logic(input, fib_list)
	result = []
	i = -1

	while (input > 0 and fib_list[i])
		if (fib_list[i] <= input)
			result.push(fib_list[i])
			input -= fib_list[i]
			i -= 2
		else
			i -= 1
		end
	end

	result
end

def output(input, result)
	puts "#{input} = " + result.join(" + ")
end

zeckendorf(5)		# 5 = 5
zeckendorf(100)		# 100 = 89 + 8 + 3
zeckendorf(120)		# 120 = 89 + 21 + 8 + 2
zeckendorf(34)		# 34 = 34
zeckendorf(88)		# 88 = 55 + 21 + 8 + 3 + 1
zeckendorf(90)		# 90 = 89 + 1
zeckendorf(320)		# 320 = 233 + 55 + 21 + 8 + 3