#https://www.reddit.com/r/dailyprogrammer/comments/468pvf/20160217_challenge_254_intermediate_finding_legal/

def find_legal_number(player, boardstate)
	board = board_as_matrix(boardstate)
	check_all_positions(player,board)
	print_board(board)
end

def check_all_positions (player, board)
	player == "X" ? opponent = "O" : opponent = "X"
	count = 0

	board.each_index {|x|
		board[x].each_index { |y|

			# check if the targeted space is occupied
			initial_valid = initial_check(board[x][y])
			
			# assume the move is invalid until we find out otherwise
			valid = false

			
			if initial_valid
				# check in all 8 directions for a valid move
				# this will have an unneeded check for 0,0
				for dir_x in -1..1
					for dir_y in -1..1
						valid = check_direction(board, player, opponent, x, y, dir_x, dir_y)

						# update the cell and count if this was deemed a valid move
						if valid 
							board[x][y] = "*"
							count += 1
						end

						# placing a token at this position is valid, no need to continue the search
						break if valid
					end
					break if valid
				end
			end
		}
	}

	puts "Total valid moves for player " + player + ": " + count.to_s
end

def initial_check (character)
	character != "-" ? false : true
end

def check_direction (board, player, opponent, target_x, target_y, dir_x, dir_y)

	current_x = target_x + dir_x
	current_y = target_y + dir_y

	if board[current_x] && board[current_x][current_y] # nil check
		if board[current_x][current_y] == opponent # opponent token found, continue searching in this direction
			return check_direction(board, player, opponent, target_x, target_y, next_dir(dir_x), next_dir(dir_y))
		elsif board[current_x][current_y] == player # found our token
			if dir_x > 1 || dir_y > 1 || dir_x < -1 || dir_y < -1 # we are NOT adjacent to the initial position, valid!
				#puts "Found legal move for " + player + " at x:" + target_x.to_s + " y:" + target_y.to_s + " from: " + dir_x.to_s + " " + dir_y.to_s
				return true
			else # we ARE adjacent to our token, which is not a valid move
				return false
			end
		else # last case is finding another blank space, invalid. also, board[x][y] nil catcher
			return false
		end
	else # board[x] nil catcher
		return false
	end
end

def next_dir(dir)
	if dir < 0
		return dir - 1
	elsif dir > 0
		return dir + 1
	else
		return 0
	end
end

def board_as_matrix(boardstate)
	board = []
	rows = boardstate.split("\n")
	rows.each do |row|
		board.push(row.split(""))
	end
	return board
end

def print_board(board)
	#playing around with printing arrays
#	board.each do |row|
#		row.each do |element|
#			print element
#		end
#		puts ""
#	end

	board.each_index {|x|
		board[x].each_index {|y|
			print board[x][y]
		}
		puts ""
	}
end

# run it!
find_legal_number("X",
"--------
--------
--------
---OX---
---XO---
--------
--------
--------"
)


find_legal_number("O",
"--------
--------
---O----
--XXOX--
---XOO--
----X---
--------
--------"
)

find_legal_number("X",
"--------
--------
---OX---
--XXXO--
--XOO---
---O----
--------
--------"
)