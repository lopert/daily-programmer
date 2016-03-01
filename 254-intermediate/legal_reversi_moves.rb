def find_legal_number(player, boardstate)
	board = board_as_matrix(boardstate)
	print_board(board)
	check_all_positions(player,board)
end

def check_all_positions (player, board)
	player == "X" ? opponent = "O" : opponent = "X"

	board.each_index {|x|
		board[x].each_index { |y|

			# check if the targetted space is occupied
			valid = initial_check(board[x][y])

			# check in all 8 directions for a valid move
			if valid
				for dir_x in -1..1
					for dir_y in -1..1
						# TODO: need to break out of this double loop if a valid position is found
						valid = check_direction (board, player, opponent, x, y, dir_x, dir_y)
					end
				end
			end

		}
	}
end

def initial_check (character)
	character != "-" ? false : true
end

def check_direction (board, player, opponent, target_x, target_y, dir_x, dir_y)

	#verify if there is an adjacent opponent piece
	#ideally, I want to have a loop that checks for a series of opponent tokens in a direction and returns true if it hits an allied token
	#so for this method, I'll need a starting coordinate and a direction

	# the following is not very DRY, I need a way of +1'ing the directions regardless of their sign.
	if board[dir_x][dir_y] == opponent # opponent token found, continue searching in this direction
		if dir_x < 0 && dir_y < 0
			return check_direction (board, player, opponent, target_x, target_y, dir_x - 1, dir_y - 1)
		elsif dir_x < 0 && dir_y > 0
			return check_direction (board, player, opponent, target_x, target_y, dir_x - 1, dir_y + 1)
		elsif dir_x > 0 && dir_y < 0
			return check_direction (board, player, opponent, target_x, target_y, dir_x + 1, dir_y - 1)
		elsif dir_x > 0 && dir_y > 0
			return check_direction (board, player, opponent, target_x, target_y, dir_x + 1, dir_y + 1)
		elsif dir_x == 0 && dir_y > 0
			return check_direction (board, player, opponent, target_x, target_y, dir_x, dir_y + 1)
		elsif dir_x == 0 && dir_y < 0
			return check_direction (board, player, opponent, target_x, target_y, dir_x, dir_y - 1)
		elsif dir_x > 0 && dir_y == 0
			return check_direction (board, player, opponent, target_x, target_y, dir_x + 1, dir_y)
		elsif dir_x < 0 && dir_y == 0
			return check_direction (board, player, opponent, target_x, target_y, dir_x - 1, dir_y)
		end
	elsif board[dir_x][dir_y] == player # found our token
		if dir_x > 1 || dir_y > 1 || dir_x < -1 || dir_y < -1 # we are NOT adjacent to the checked position, valid!
			return true
		else # invalid
			return false
		end
	else #last case is finding another blank space, invalid.
		# This also covers the out of bounds issue according to http://stackoverflow.com/questions/22647254/ruby-arrays-bounds-and-raising-exceptions
		# because we'll just return false if we get a nil, need to test to make sure ;)
		return false
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
	board.each do |row|
		row.each do |element|
			print element
		end
		puts ""
	end

	board.each_index {|x|
		board[x].each_index {|y|
			print board[x][y]
		}
		puts ""
	}
end


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