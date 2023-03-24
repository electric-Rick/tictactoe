require_relative 'board'
class ComputerStrategy 
	def check_endgame(board_updated)
			Board.new.win_combinations.any? do |c|
				@human_won = true if c.all? { |pos| board_updated[pos] == "O" }
				@comp_won  = true if c.all? { |pos| board_updated[pos] == "X" }
				if @human_won or @comp_won
					return true
				else	
					return false
				end
    end
	end
end

class EasyComputerStrategy < ComputerStrategy
	def move(board)
		# Easy implem.
		remaining_moves = board.expose_values.reject { |s| s == "X" || s == "O" } 
		rand_move = rand(0..remaining_moves.count)
		return remaining_moves[rand_move].to_i
  end
end

class MediumComputerStrategy <ComputerStrategy
	def move(board, marker)
		# Medium implem.
  end

end

class HardComputerStrategy < ComputerStrategy
  def move(sboard, smarker)
    # Hard implem.
		@board  = sboard.expose_values
		@marker = smarker 
		spot    = nil
		if @board[4] == 4
			spot = 4
			@board[spot] = @marker
		else
			spot = get_best_move(@board, @marker)
			if @board[spot] != @marker && @board[spot] != "O"
				 @board[spot] = @marker		
			else
				spot = nil
			end
		end
	end

	def get_best_move(board, marker)
		available_spaces = []
		best_move = nil 
		board.each do |s|
			if s != "X" && s != "O"
				available_spaces << s
			end
		end
		available_spaces.each do |as|
			board[as.to_i] = marker
			if check_endgame(available_spaces)
				best_move = as.to_i
				board[as.to_i] = as
				return best_move
			else
				board[as.to_i] = "O"
				if check_endgame(available_spaces)
					best_move = as.to_i
					#board[as.to_i] = as
					return best_move
				else
					board[as.to_i] = as
				end			
			end
		end
		if best_move
			return best_move
		else
			n = rand(1..available_spaces.count)
			return available_spaces[n].to_i
		end
  end	
end
