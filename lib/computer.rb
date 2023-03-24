require_relative 'board'
require_relative 'game'
require_relative 'difficulty_modifier'
class Computer
	attr_reader :marker
	# catch the marker and the level of computer player
	def initialize(marker, difficulty)
		@marker = marker
		@difficulty = difficulty
	end

	def move_on(sboard) # this method will make a move with PC depending of your level
	 	@board = sboard
		if	@difficulty == "easy" # easy level block
			@COMP     = EasyComputerStrategy.new # easy logic here was selected
			easy_move = @COMP.move(@board)
			spot = nil
			if @board.expose_values[4] == 4
				spot = 4
				@board.expose_values[spot] = @marker
			else	
				spot = easy_move
				if @board.expose_values[spot] != @marker && @board.expose_values[spot] != "O"
					 @board.expose_values[spot] = @marker
				else
					 spot = nil
			  end
		  end

			elsif @difficulty == "hard" # hard level block
			@COMP = HardComputerStrategy.new #hard logic here has been selected
			hard_move = @COMP.move(@board, @marker)
			spot = nil
			if @board.expose_values[4] == 4
				spot = 4
				@board.expose_values[spot] = @marker
			else	
				spot = hard_move
				if @board.expose_values[spot.to_i] != @marker && @board.expose_values[spot.to_i] != "O"
					 @board.expose_values[spot.to_i] = @marker
				else
					 spot = nil
			# Can be added more levels here
			  end
		  end
		end
	end
end	

