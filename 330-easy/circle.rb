class Circle

	attr_reader :x, :y, :radius

	def initialize(center_x, center_y, radius)
		@x = center_x
		@y = center_y
		@radius = radius
	end

	def display
		puts "Circle with center [#{@x},#{@y}] radius of #{@radius}"
	end

end

def find_bounds(circles)
	min_x = circles.min_by { |circle| circle.x - circle.radius }
	min_x = min_x.x - min_x.radius

	max_x = circles.max_by { |circle| circle.x + circle.radius }
	max_x = max_x.x + max_x.radius

	min_y = circles.min_by { |circle| circle.y - circle.radius }
	min_y = min_y.y - min_y.radius

	max_y = circles.max_by { |circle| circle.y + circle.radius }
	max_y = max_y.y + max_y.radius

	puts "(#{min_x},#{min_y}), (#{min_x},#{max_y}), (#{max_x},#{max_y}), (#{max_x},#{min_y})"
end

circles = [
	Circle.new(1,1,2),
	Circle.new(2,2,0.5),
	Circle.new(-1,-3,2),
	Circle.new(5,2,1)
]

circles.each { |circle| circle.display }

find_bounds(circles)
