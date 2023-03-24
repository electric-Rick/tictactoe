require 'io/console'
require 'colorize'
require_relative 'game'
class Menu
  def init_menu
	  selected_option = 0 # Initial option
  	print_menu(selected_option)
	  loop do
 	# Read the key 
			case STDIN.getch
 			  when "q" # When user press q, exit from menu and the game
				  puts("You want really quit? press [e] to exit or [c] to continue")
					case STDIN.getch # confirm if the user really wants quit
						when "e"
							system("clear")
							break
						when "c"
							system("clear")
							print_menu(selected_option) # print the menu
							next
					end
				when "\r" # execute an action when the user hit Enter
 					case selected_option
	    		  when 0					
							game_start # start the if the start key is pressed
							break
	  		    when 1
 		  		    puts "Score ranking..."
						  # just an idea, not implemented yet
	  	  	  when 2
 	    		 	  puts "Suggestions"
			 		  when 3
						  system("clear")
	 			 	  	break
	         end	
			  when "A" # detects the UP arrow key
 					selected_option = (selected_option - 1) % 4 # arr legnth
	    		print_menu(selected_option)
			  when "B" # detects the DOWN arrow key 
		  	  selected_option = (selected_option + 1) % 4 # calculate where the menu selector need stay
   				print_menu(selected_option)
				when "F"	 # start the game when F key is pressed
					game_start
				when "G" # could be show the lasts scores, but not was implemented
					puts "Last scores"	
					break
				when "H"  # another idea
					puts "Welcome client, you're here to give me suggestions."
					break
				end
			end
		end
	private
	
	def game_start
		system("clear")
	  puts("Welcome to TicTacToe!\n")						
		loop do # loop to interact with retries 
			game = Game.new
			game.game_select
			puts("Retry?[y/n]")
			answ = gets.chomp.downcase
			break if answ != 'y' #quit if don't retry
		end
		puts("Press [q] to quit")
	end
	
	def print_menu(selected_option)
  	options = ['[F] Play TicTacToe', '[G] Score ', '[H] Suggestions ', '[q] Exit'] # menu
  
	 	system('clear') # clean console screen
  	# prints the menu and the arrow pointing on it
	  options.each_with_index do |option, index|
    	if index == selected_option
      	puts ">>>>".red + " #{option} \n"
    	else
      	puts "  #{option} \n"
	    end
  	end
	end
end


