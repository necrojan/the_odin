require './player'

class Game
  attr_reader :guess_limit, :type
  attr_accessor :color_combination

  def initialize
    @guess_count = 0
    @guess_limit = 3
    @color_combination = 'rgbcmy'
    @player = Player.new
  end

  def random_pattern
    color_combination.split('').shuffle.slice(0, 4)
  end

  def intro_message
    puts "Welcome to Master mind\n"
    sleep(1)
  end

  def pattern_generate(type)
    if type == 'cm'
      puts 'Enter your 4 color pattern.'
      @color_combination = gets.chomp.split('')
    else
      @color_combination = random_pattern
    end
    color_combination
  end

  def user_input
    puts "Enter your 4 color pattern (example - rgby): \n"
    gets.chomp.split('')
  end

  def check_guess(guess)
    combination_arr = []

    guess.each_with_index do |guess_letter, idx_guess|
      if color_combination.include?(guess_letter)
        color_combination.each_with_index do |original_letter, idx_original|
          if guess_letter == original_letter
            if idx_guess == idx_original
              combination_arr.insert(idx_guess, true)
            else
              combination_arr.insert(idx_guess, 'wrong position')
            end
          end
        end
      else
        combination_arr.insert(idx_guess, false)
      end
    end
    combination_arr
  end

  def computer_guess
    combination = color_combination.shuffle
    combination
  end

  def display_correct_combination
    puts "Correct pattern is #{color_combination.to_s}"
  end

  def play
    intro_message
    selected_type = @player.player_select

    pattern_generate(selected_type)
    while @guess_count < guess_limit
      guess_pattern = @player.is_code_breaker ? user_input : computer_guess
      puts 'Checking...'

      sleep(2)
      pattern = check_guess(guess_pattern)
      puts "pattern\n"
      p pattern
      if pattern.all? { |element| element == true }
        puts "Winner!\n"
        display_correct_combination
        return
      end
      p pattern
      @guess_count += 1
    end
    puts "Game Over!\n"
    display_correct_combination
  end
end

game = Game.new
game.play
