class Player

  def initialize(symbol, board)
    @symbol = symbol
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

  def symbol
    'X'
  end

end