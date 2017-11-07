require_relative 'players/human'
require_relative 'board'

@board = Board.new
@human = Human.new('O')
@human.play(@board)