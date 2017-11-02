class MinMax

  def initialize(board)
    @board = board
  end

  def play 
    max_val = -1000

    @board.available_spaces.each do |space|
      #eval
      val = #Min

      if val > max_val
        max_val = val
      end
    end 
  end

  def symbol
    'O'
  end

end