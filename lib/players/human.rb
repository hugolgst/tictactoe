require_relative '../player'

class Human < Player

  def play(board)
    position = 0

    puts "It's your turn, enter a position."
    loop do
      position = gets.to_i
      break if board.empty_place?(position) && (1..9) === position 
      puts 'Please enter a valid position'
    end

    place(board, position - 1)
    board.draw
  end

end
