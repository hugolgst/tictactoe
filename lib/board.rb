class Board

  COMBINATIONS = [
  [0, 1, 2], [3, 4, 5], [6, 7, 8],
  [0, 3, 6], [1, 4, 7], [2, 5, 8],
  [0, 4, 8], [2, 4, 6]
  ]

  def initialize
    @board = Array.new 9
  end

  # Place a piece at a position
  def place(position, piece)
    @board[postion] = piece
  end

  # Check if the game have a win
  def win_combination
    COMBINATIONS.each do |combination|
      first, second, third = combination

      return combination if @board[first] == @board[second] && @board[second] == @board[third] && !@board[first].nil?
    end
    false
  end

  # Check if the player is the winner
  def winner?(player_symbol)
    combination = win_combination
    return combination && @board[combination[0]] == player_symbol
  end

  # Retrieves if the parameter is empty
  def empty_place?(place)
    @board[place].nil?
  end

  # Retrieves an array of available places indexes
  def available_spaces
    availlable = []
    @board.each_index do |i|
      availlable << i if @board[i].nil?
    end
  end

  # Draw the board game
  def draw
    @board.map{ |e| "[#{e.nil? ? " " : e}]" }.each_slice(3).to_a.map(&:join).join("\n")
  end

end