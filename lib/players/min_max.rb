require_relative '../player'

class MinMax < Player

  def play(board)
    minmax(board, @symbol, 0)
    place(board, @best_move)
    board.draw
  end

  def minmax(board, player, depth)
    new_board = board.dup
    new_board.change_turn

    return 10 - depth if new_board.winner?(@symbol)
    return -10 + depth if new_board.winner?(opponent(@symbol))
    return 0 if new_board.available_spaces.empty?

    depth += 1
    moves = {}
    new_board.available_spaces.each do |space|
      new_board_ = new_board.dup
      new_board_.place(space, player)
      moves[space] = minmax(new_board_, opponent(player), depth)
    end

    best_score = 0
    if board.turn == @symbol
      @best_move, best_score = moves.max_by { |_, v| v }
    else
      @best_move, best_score = moves.min_by { |_, v| v }
    end

    best_score
  end

  def opponent(player)
    player == 'O' ? 'X' : 'O'
  end

end