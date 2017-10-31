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
    @board.each_index |i|
      availlable << i if @board[i].nil?
    end
  end

  def draw
    @board.map{ |e| "[#{e.nil? ? " " : e}]" }.each_slice(3).to_a.map(&:join).join("\n")
  end

end