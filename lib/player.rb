class Player
  attr_reader :symbol

  def initialize(symbol)
    @symbol = symbol
  end

  def place(board, position)
    board.place(position, @symbol)
    board.change_turn
  end

  def play
    raise 'Not added'
  end
end