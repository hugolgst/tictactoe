require_relative 'players/human'
require_relative 'board'

@board = Board.new('O')
@human = Human.new('O')
@human.play(@board)
p @board.turn