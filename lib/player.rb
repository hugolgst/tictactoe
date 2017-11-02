class Player

  def initialize board
    @board = board
  end

  def place position
    unless @board.empty_place? postion
      puts "Invalid entry."
      return
    end

    @board.place(position, "X")
  end

end