require_relative '../player'

class Human < Player

  def play(board)
    position = 0

    loop do
      puts 'Please enter a valid position.'
      position = gets.to_i
      break if board.empty_place?(position)
    end

    place(board, position)
    board.draw
  end

end