class MinMax

  attr_reader :symbol

  def initialize(symbol)
    @symbol = symbol
  end

  # MinMax algorithm
  def minmax(board, player, depth)
    return score(board, depth) if board.win_combination
    scores = {}
    depth += 1

    board.available_spaces.each do |space|
      new_board = board.dup
      new_board.place(space, player)

      scores[space] = minmax(new_board, opponent(player), depth)
    end

    @choice, score = best_move(player, scores)
    score
  end

  # Retrieves the game score
  def score(board, depth)
    return 10 - depth if board.winner?(@symbol)
    return depth - 10 if board.winner?(opponent(@symbol))
    return 0
  end

  # Retrieves the opponent of the parameter player
  def opponent(player)
    player == 'O' ? 'X' : 'O'
  end

  # Find the best move for the player
  def best_move(piece, scores)
  	scores = scores.compact
  	return piece == @symbol ? scores.max_by { |_k, v| v } : scores.min_by { |_k, v| v }
  end

end