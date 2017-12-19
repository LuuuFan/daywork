require_relative "board"
require 'byebug'

class Game

  def initialize(path)
    @board = Board.from_file(path)
  end

  def play
    @board.render
    until @board.solved?
      input = getinput
      until validinput(input)
        puts "Invalid input, please try again"
        input = getinput
      end
      make_move(input)
      @board.render
    end
  end

  def getinput
    puts 'Give input of position'
    pos = gets.chomp.split(', ').map(&:to_i)
    puts 'What number you want to input'
    value = gets.chomp.to_i
    [pos, value]
  end

  def validinput(input)
    # debugger
    check_input = input[0].all? { |el| el >= 0 && el < 9 }
    check_given = !@board.check_given(input[0])
    check_input && input[1] > 0 && input[1] < 10 && check_given
  end

  def make_move(input)
    @board.update_tile(input[1], input[0])
  end

end

if __FILE__ == $PROGRAM_NAME
  game = Game.new('sudoku1-almost.txt')
  game.play
end
