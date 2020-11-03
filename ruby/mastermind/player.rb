class Player
  attr_accessor :player_type

  def player_select
    puts "Do you want to be a CodeMaker (cm) or CodeBreaker (cb)"
    player_type = gets.chomp
    raise 'Invalid player type' if player_type != 'cb' && player_type != 'cm'

    @player_type = player_type
    player_type
  end

  def is_code_breaker
    @player_type == 'cb'
  end
end