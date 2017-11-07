class Player

  attr_reader :symbol

  def initialize(symbol)
    @symbol = symbol
  end

  # Place a new piece for the players
  def place(board, position)
    board.place(position, @symbol)
    board.change_turn
  end

end