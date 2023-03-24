class Player # player class
  attr_reader :marker

  def initialize(marker)
    @marker = marker # catch the marker
  end

  def move(board)
    valid_move = false # starts with false state
    until valid_move
      position = gets.chomp.to_i 
      if board.move(self, position) # if the moviment is valid, the state became true and accepts the move
        valid_move = true
      else # if any strange thing...
        puts "Wrong move, select another one: \n"
      end
    end
  end
end
