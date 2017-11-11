require_relative 'players/human'
require_relative 'players/min_max'
require_relative 'board'

def opponent(symbol)
  symbol == 'O' ? 'X' : 'O'
end

loop do
  puts 'Which symbol do you want? (O/X)'
  @player_symbol = gets.chomp.upcase
  break if @player_symbol == 'O' || @player_symbol == 'X'
end

loop do
  puts 'Who starts? (me/you)'
  @turn = gets.chomp.upcase
  break if @turn == 'ME' || @turn == 'YOU'
end

@board = Board.new(@turn == 'ME' ? @player_symbol : opponent(@player_symbol))
@human = Human.new(@player_symbol)
@ai = MinMax.new(opponent(@player_symbol))

if @turn == 'YOU'
  @ai.play(@board)
end

loop do
  @human.play(@board)
  puts '-' * 9
  @ai.play(@board)
end