require_relative "board"
require_relative "card"
require_relative "player"

class Game

  attr_reader :player

  def initialize(player, size = 4)
    @board = Board.new(size)
    @previous_guess = nil
    @player = player
  end

  def setup_player
      @player.size = @board.size
      @player.create_internal_board
  end

  def play
    setup_player
    until over?
      @board.render
      pos = player.prompt
      # debugger
      value = make_guess(pos)
      @player.update_history(pos, value, @previous_guess)
      sleep(1)
      #update_guess
      @board.render
      sleep(0.2)
    end
  end

  def over?
    @board.won?
  end

  def make_guess(pos)
    # debugger
    if @previous_guess.nil?
      value = @board.reveal(pos)
      @previous_guess = [value, pos]
    else
      value = @board.reveal(pos)
      # debugger
      if value != @previous_guess[0]
        @board.render
        @board.hide(pos)
        @board.hide(@previous_guess[1])
      else
        @player.update_match(value)
      end
      @previous_guess = nil
    end
    value
  end


end

if __FILE__ == $PROGRAM_NAME
  computerPlayer = Player.new('station10')
  game = Game.new(computerPlayer, 6)
  game.play
end
