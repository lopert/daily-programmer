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

	while (fibs[-1] < limit)
		fibs.push(fibs[-1] + fibs[-2])
	end

	fibs
end

def logic(input, fib_list)

	result = []
	i = -1

	while (0 < input)

		if (fib_list[i] <= input)
			result.push(fib_list[i])
			input = input - fib_list[i]
			i = i - 2
		else
			i = i - 1
		end
	end

	result
end

def output(input, result)
	puts "#{input} = " + result.join(" + ")
end

zeckendorf(5)
zeckendorf(100)
zeckendorf(120)
zeckendorf(34)
zeckendorf(88)
zeckendorf(90)
zeckendorf(320)