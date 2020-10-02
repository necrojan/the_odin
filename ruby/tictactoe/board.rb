class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(3) { Array.new(3, '_') }
  end

  def display
    grid.each do |row|
      puts row.join(' ')
    end
  end

  def valid_position?(position)
    position.all? do |i|
      i >= 0 && i < grid.length
    end
  end

  def mark(pos, mark)
    raise 'invalid position' if !valid_position?(pos) || !empty?(pos)

    set_position(pos, mark)
  end

  def empty?(pos)
    get_position(pos) == '_'
  end

  def get_position(pos)
    @grid[pos[0]][pos[1]]
  end

  def set_position(pos, val)
    @grid[pos[0]][pos[1]] = val
  end

  def row_winner(mark)
    grid.any? { |row| row.all?(mark) }
  end

  def col_winner(mark)
    grid.transpose.any? { |col| col.all?(mark) }
  end

  def diagonal_winner(mark)
    left_to_right = left_right_check(mark)

    right_to_left = right_left_check(mark)

    left_to_right || right_to_left
  end

  def empty_positions?
    arr = (0...grid.length).to_a

    combinations = arr.product(arr)

    combinations.any? { |row| empty?(row) }
  end

  def winner?(mark)
    return false if !row_winner(mark) && !col_winner(mark) && !diagonal_winner(mark)

    true
  end

  private

  def left_right_check(mark)
    left_to_right = (0...grid.length).all? do |i|
      pos = [i, i]

      get_position(pos) == mark
    end
    left_to_right
  end

  def right_left_check(mark)
    right_to_left = (0...grid.length).all? do |i|
      row = i
      col = grid.length - 1 - i
      pos = [row, col]

      get_position(pos) == mark
    end
    right_to_left
  end
end