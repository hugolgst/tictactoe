class MinMax

  def play(board)
    minmax(board, 'O', 0)
    puts 'Thinking..'
    sleep 2
    board.place(@best_choice, 'O')
  end

  def minmax(board, player, depth)
    return score(board, depth) if board.win_combination
    scores = {}

    depth += 1

    board.available_spaces.each do |space|
      new_board = board.dup
      new_board.place(space, player)

      scores[space] = minmax(new_board, other(player), depth)
    end

    @best_choice, best_score = best_move(player, scores)
    best_score
  end

  # Retrieves the game score
  def score(board, depth)
    if board.winner?('O')
      return 10 - depth
    elsif board.winner?('X')
      return depth - 10
    else
      return 0
    end
  end

  def other(player)
    player == 'O' ? 'X' : 'O'
  end

  def best_move(piece, scores)
  	scores = scores.compact
    if piece == 'O'
      scores.max_by { |_k, v| v }
    else
      scores.min_by { |_k, v| v }
    end
  end

end