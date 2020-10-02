require './player'
require './game'

puts 'Welcome to Tic Tac Toe game!'

sleep(2)

puts 'Player 1 name: '
player_1_name = gets.chomp
puts 'Please enter mark for player 1 (eq: :X, :O): '
player_1_mark = gets.chomp

puts "Thanks #{player_1_name}!"


puts 'Player 2 name: '
player_2_name = gets.chomp
puts 'Please enter mark for player 2 (eq: :X, :O): '
player_2_mark = gets.chomp

puts "Thanks #{player_2_name}!"

player_1 = Player.new(player_1_name, player_1_mark)
player_2 = Player.new(player_2_name, player_2_mark)

game = Game.new(player_1, player_2)
game.start
