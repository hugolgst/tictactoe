require_relative 'player/player'
require_relative 'player/min_max'
require_relative 'board'

@board = Board.new
@player = Player.new(@board)
@ai = MinMax.new('O')

puts [*'1'..'9'].map{ |i| "[#{i}]" }.each_slice(3).to_a.map(&:join).join("\n")

while true
  position = gets.to_i
  @player.place(position-1)

  puts @board.draw

  @ai.play(@board)

  puts @board.draw
end