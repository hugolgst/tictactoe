require_relative 'players/human'
require_relative 'players/min_max'
require_relative 'board'

@board = Board.new('O')
@human = Human.new('O')
@ai = MinMax.new('X')

loop do
  @human.play(@board)
  @ai.play(@board)
end