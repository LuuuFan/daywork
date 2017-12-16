require_relative 'board'
require_relative 'display'
require_relative 'player'

class Game

  def initialize(player1, player2)
    @board = Board.new
    @player1 = player1
    @player2 = player2
  end

  def play
    until @board.checkmate?()
      
    end
  end

  def notify_players()
  end

  def swap_turn!
  end




end
