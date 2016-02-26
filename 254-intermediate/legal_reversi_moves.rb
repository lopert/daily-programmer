def find_legal_number(player, boardstate)
	board = board_as_matrix(boardstate)
	print_board(board)
	check_moves(player,board)
end

def check_moves (player, board)
	player == "X" ? opponent = "O" : opponent = "X"

	board.each_index {|x|
		board[x].each_index { |y|

			if board[x][y] != "-"
				#occupied space, invalid move
			else 
				#verify if there is an adjacent opponent piece
				#ideally, I want to have a loop that checks for a series of opponent tokens in a direction and returns true if it hits an allied token
				#so for this method, I'll need a starting coordinate and a direction

			end

		}
	}
end

def check_neighbors (board, x, y)
	
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