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

      if @board[first] == @board[second] && @board[second] == @board[third] && @board[first] == player
        return true
      end
    end

    false
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
    lines = @board.map { |e| "[#{e.nil? ? ' ' : e}]" } .each_slice(3).to_a
    puts lines.map(&:join) * '\n'
  end

  def initialize_dup(other)
    super(other)
    @board = other.board.dup
  end

end