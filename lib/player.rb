class Player

  def initialize(board)
    @board = board
  end

  # Place a piece for the player
  def place(position)
    unless @board.empty_place? postion
      puts 'Invalid entry.'
      return
    end

    @board.place(position, 'X')
  end

end