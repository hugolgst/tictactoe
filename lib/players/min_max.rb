require_relative '../player'

class MinMax < Player

  def play(board)
    minmax(board, opponent(@symbol), 0)
    place(board, @best_move)
    board.draw
  end

  def minmax(board, player, depth)
    new_board = board.dup
    new_board.change_turn
    if new_board.winner?(@symbol)
      return 10 - depth
    elsif new_board.winner?(opponent(@symbol))
      return -10 + depth
    elsif new_board.available_spaces.size == 0
      return 0
    end

    depth += 1
    moves = {}
    new_board.available_spaces.each do |space|
      new_board.place(space, player)
      moves[space] = minmax(new_board, opponent(player), depth)
      puts new_board.turn
      new_board.draw
    end

    best_score = 0
    if board.turn == @symbol
      @best_move, best_score = moves.max_by{ |k, v| v }
    else
      @best_move, best_score = moves.min_by{ |k, v| v }
    end

    return best_score
  end

  def opponent(player)
    player == 'O' ? 'X' : 'O'
  end

end