class Bucket

	attr_reader :size
	attr_accessor :current

	def initialize(size)
		@size = size
		@current = 0
	end

	def fill
		@current = @size
	end

	def empty
		@current = 0
	end

	def display
		puts "Bucket of size #{@size}, containing #{@current}"
	end

	def transfer(target_bucket)
		free_space = target_bucket.size - target_bucket.current

		if @current <= free_space
			target_bucket.current += @current
			@current = 0
		elsif @current > free_space
			target_bucket.current += free_space
			@current -= free_space
		end

	end
end

# used this class for testing and learning
def math(b1,b2,goal)

	# link to math:
	# http://www.math.tamu.edu/~dallen/hollywood/diehard/diehard.htm
	# mp = nq = k
	# (x)(b1) + (y)(b2) = goal

	x = 0
	y = 0
	current_total = 0

	#determine x and y mathematically
	while (current_total != goal) do

		if current_total < goal
			x += 1
		elsif current_total > goal
			y -= 1
		end

		current_total = x*b1.size + y*b2.size
		puts "X: #{x}, Y: #{y}, CT: #{current_total}"

	end

end

def bucket_solve(b1,b2,goal)

	#check for co-prime
	if !(1 == b1.size.gcd(b2.size))
		puts "no solution"
		return
	end

	path = []

	#perform the actual operations
	while ((b1.current != goal) and (b2.current != goal)) do

		if (b2.current == b2.size)
			b2.empty
		else
			if (b1.current != 0)
				b1.transfer(b2)
			else
				b1.fill
			end
		end
		path << "(#{b1.current}, #{b2.current})"
	end
	puts path.join(",")
end

bucket_solve(Bucket.new(3),Bucket.new(5),4)
bucket_solve(Bucket.new(6),Bucket.new(16),7)
bucket_solve(Bucket.new(101),Bucket.new(317),64)
bucket_solve(Bucket.new(571),Bucket.new(317),420)
bucket_solve(Bucket.new(1699),Bucket.new(1409),1334)
