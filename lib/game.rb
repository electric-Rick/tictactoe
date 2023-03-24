require_relative 'board'
require_relative 'player'
require_relative 'computer'
require_relative 'difficulty_modifier'
require 'io/console'
require 'colorize'

class Game
  def initialize
		game_select
  end	

	def game_select # prints a menu to select the mode
		puts "Press [M] for Multiplayer\n"
		puts "Press [S] to Single Player\n"
		puts "Press [B] to Computer vs Computer\n"
		puts "Press [q] to quit"
		loop do
			case STDIN.getch.downcase # await hit some key of menu
				when "m"
				 	# Multiplayer
					start_multiplayer  # start the multiplayer game if selected
					break
				when "s"
					puts("Choose the computer difficulty: \n"+ 'Hard'.red + "  -- [y] \n" + "Medium".green + "-- [i] \n" + "Easy".blue + "  -- [u] \n" + "Exit ".cyan + " -- [q]")
					# Against computer
						case STDIN.getch # select the level of pc
							when "y" # hard difficulty 
								@difficulty = "hard" # will send a sign to the computer class
							  @board = Board.new   # starts the board
						    @human_player = Player.new("O") # initalize the human player to beat the computer
								@computer_player = Computer.new("X", @difficulty) # initialize the Computer class with the difficulty flag
								system("clear") #clear the terminal to be less poluted
					  	  @board.print_board # then prints the board
				    		until @board.game_over? || @board.tie? # if the game not over yet, player one moves.
			  			    puts("\n \n [Player 1]".yellow + " choose  move" +  "[0-8]: ".green)
				    		  @human_player.move(@board) # mark the 'O' string inside the board
	    			  		if !@board.game_over? && !@board.tie? # verify if the game not over yet
										puts("\n [!]".cyan+" Awaiting computer move \n\n")
        				  	@computer_player.move_on(@board) # computer moves on board
	      					end
			    			  @board.print_board
				 		  	end
					 			puts("[!] ".red + "Oh, no! Game is over.") # if came to here, the game really over

								break
							when "u"
								system("clear")	
								@difficulty = "easy"
								@board = Board.new
								@human_player = Player.new("O")
								@computer_player = Computer.new("X", @difficulty)
								@board.print_board
				    		until @board.game_over? || @board.tie? # if the game not over yet, player one moves.
			  			    puts("\n \n [Player 1]".yellow + " choose  move" +  "[0-8]: ".green)
				    		  @human_player.move(@board) # mark the 'O' string inside the board
	    			  		if !@board.game_over? && !@board.tie? # verify if the game not over yet
										puts("\n [!]".cyan+" Awaiting computer move \n\n")
        				  	@computer_player.move_on(@board) # computer moves on board
	      					end
			    			  @board.print_board
				 		  	end
					 			puts("[!] ".red + "Oh, no! Game is over.") # if came to here, the game really over								
								# Easy computer
							when "i"
								@difficulty = "medium"
								# Medium computer
							when "q"
								break
						end
				when "q"
						puts "Exiting..."
						break
				else
					break
				end
			end
		end
	def start_multiplayer
			  @board = Board.new		  
		    @human_player = Player.new("O")    
		    @human_player2 = Player.new("X")	
		    @board.print_board
		    puts("\n \n [Player 1]".yellow + " choose  move" +  "[0-8]: ".green)

    		until @board.game_over? || @board.tie?
    		  @human_player.move(@board)
	      	if !@board.game_over? && !@board.tie?
  			    puts("\n \n [Player 2]".red + " choose  move" +  "[0-8]: ".cyan)
						@human_player2.move(@board)
					else
						puts "Game over, guys! No one has won the game."
      		end
	    	  @board.print_board
  		  end
 		puts "Oh, no! Game is over."		
	end
end

