require_relative 'player/player'
require_relative 'player/min_max'
require_relative 'board'

@board = Board.new
@player = Player.new(@board)
@ai = MinMax.new

while true
  position = gets.to_i
  @player.place(position)

  puts @board.draw

  @ai.play(@board)

  puts @board.draw
end