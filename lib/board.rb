class Board # handle with the structure of board and your logic.
  def initialize # starts the board adding the 9 numbers
    @board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
#		initialize_score # get the score
  end
#	def initialize_score
#		@score = {'h_Player' => 0, 'c_Player' => 0}		
#	end


  def print_board
    puts(" #{@board[0]} | #{@board[1]} | #{@board[2]} \n===+===+===\n #{@board[3]} | #{@board[4]} | #{@board[5]} \n===+===+===\n #{@board[6]} | #{@board[7]} | #{@board[8]} \n")
  end

  def move(player, position)
    if @board[position] != "X" && @board[position] != "O" # core of the board logic
      @board[position] = player.marker			
      true
    else
      false
    end
  end


	def	expose_values # expose the current board values 
		return @board
	end

  def game_over? # verfiy if the game is over with all wins combinations
    win_combinations.any? do |combo|
       @human_won = true if combo.all? { |position| @board[position] == "O"  } # handle with human victory
       @computer_won =  true if combo.all? { |position| @board[position] == "X"  } # handle with  computer victory
		end
 		if @computer_won == true # features can be added here to expand the application, maybe the score can be extracted from here
		  puts("PC has won the game!")
		 # add_score('c_Player', 1) 
		 # puts("Score: \n HumanPlayer: #{@score['h_Player']} \n ComputerPlayer: #{@score['c_Player']}")
		  return @computer_won
	 	elsif @human_won == true # handle when the human player won the game, returning true for a good won
		  puts("Human player has won the game!")
		  # add_score('h_Player', 1)
			# puts("Score: \n HumanPlayer: #{@score['h_Player']} \n ComputerPlayer: #{@score['c_Player']}")
			return @human_won
		else
					# do nothing
		end
	end


  def tie? # if has a tie
    @board.all? { |s| s == "X" || s == "O" }
  end

	public

	def delivery_values  # current value from board
		@board
	end

  def win_combinations # all win combinations from the game
    [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], # rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], # columns
      [0, 4, 8], [2, 4, 6]             # diagonals
    ]
  end
		#  in another opportunity can be added some method to print a score
end


