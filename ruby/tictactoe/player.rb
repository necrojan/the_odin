class Player
  attr_reader :name, :mark
  
  def initialize(name, mark)
    @name = name
    @mark = mark
  end

  def get_position
    puts "#{name} please provide 2 digits with space in between."
    position = gets.chomp.split(' ').map(&:to_i)
    raise 'Invalid position' if position.length != 2

    position
  end
end