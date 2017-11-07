class Player

  attr_reader :symbol

  def initialize(symbol)
    @symbol = symbol
  end

  # Place a new piece for the player
  def place(board, position)
    board.place(position, @symbol)
  end

end