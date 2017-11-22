require_relative 'players/human'
require_relative 'players/min_max'
require_relative 'board'

def opponent(symbol)
  symbol == 'O' ? 'X' : 'O'
end

def win_check(board, player_symbol)
  human = board.winner?(player_symbol)
  computer = board.winner?(opponent(player_symbol))
  draw = board.available_spaces.empty?

  puts "YOU WON INCREDIBLE" if human
  puts "I won! :)" if computer
  puts "It's a draw." if draw

  exit if human || computer || draw
end

puts "Welcome to the tic tac toe game, you can't beat me but you can try.",
     'I am going to ask you some simple questions.', ''

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

puts '', "Let's go, good luck."

@ai.play(@board) if @turn == 'YOU'

loop do
  @human.play(@board)
  puts
  @ai.play(@board)
  win_check(@board, @player_symbol)
end