class Board

  COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ]

  attr_reader :board, :turn

  def initialize(turn)
    @board = Array.new 9
    @turn = turn
  end

  def change_turn
    @turn = turn == 'O' ? 'X' : 'O'
  end

  # Place a piece at a position
  def place(position, piece)
    @board[position] = piece
  end

  # Check if the parameter players is the winner
  def winner?(player)
    COMBINATIONS.each do |combination|
      first, second, third = combination

      return true if @board[first] & @board[second] & @board[third] == player.symbol
    end
  end

  # Retrieves if the parameter is empty
  def empty_place?(place)
    @board[place].nil?
  end

  # Retrieves an array of available places indexes
  def available_spaces
    available = []
    @board.size.times do |i|
      available << i if empty_place?(i)
    end

    available
  end

  # Draw the board game
  def draw
    puts @board.map{ |e| "[#{e.nil? ? " " : e}]" }.each_slice(3).to_a.map(&:join).join("\n")
  end

end