require './player.rb'
require './board.rb'

class Game
  attr_reader :board

  def initialize(player_a, player_b)
    @player_a = player_a
    @player_b = player_b
    @current_player = player_a
    @board = Board.new
  end

  def switch_player
    @current_player = if @current_player == @player_a
                        @player_b
                      else
                        @player_a
                      end
  end

  def start
    board.display
    while board.empty_positions?
      board.display
      position = @current_player.get_position

      board.mark(position, @current_player.mark)

      if board.winner?(@current_player.mark)
        puts 'Winner!'
        puts @current_player.name.to_s + ' has won!'
        board.display
        return
      else
        switch_player
      end
    end
    puts 'GAME OVER'
  end
end
