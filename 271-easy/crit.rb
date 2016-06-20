# https://www.reddit.com/r/dailyprogrammer/comments/4nvrnx/20160613_challenge_271_easy_critical_hit/

# odds to kill
def otk (faces, hp)
	if hp <= faces then
		return ((faces+1-hp)/faces.to_f)
	else
		return (1/faces.to_f) * otk(faces,hp-faces)
	end
end

# Inputs
puts otk(4,1)		# 1.0
puts otk(4,4)		# 0.25
puts otk(4,5)		# 0.25
puts otk(4,6)		# 0.1875
puts otk(1,10)		# 1.0
puts otk(100,200)	# 0.0001
puts otk(8,20)		# 0.009765625