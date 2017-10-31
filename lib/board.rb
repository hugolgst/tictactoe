class Board

  def initialize
    @board = Array.new 9
  end

	# Place a piece at a position
  def place(position, piece)
    @board[postion] = piece
  end

  # Retrieves an array of available places indexes
  def available_spaces
    availlable = []
    @board.size.times |i|
      availlable << i if @board[i].nil?
    end
  end

end