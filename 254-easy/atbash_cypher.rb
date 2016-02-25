#https://www.reddit.com/r/dailyprogrammer/comments/45w6ad/20160216_challenge_254_easy_atbash_cipher/

def atbash_encoder (input)
	output = ""
	input.chars.each do |char|
		if char.ord.between?('a'.ord, 'z'.ord)
			output += (-char.ord + 219).chr
		elsif char.ord.between?('A'.ord, 'Z'.ord)
			output += (-char.ord + 155).chr
		else
			output += char
		end
	end
	puts output
end

atbash_encoder("foobar")
atbash_encoder("wizard")
atbash_encoder("/r/dailyprogrammer")
atbash_encoder("gsrh rh zm vcznkov lu gsv zgyzhs xrksvi")
atbash_encoder("FoObArZz")