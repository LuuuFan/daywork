require_relative 'Piece'
require_relative 'sliding_pieces'

class Bishop < Piece
  include SlidingPieces

  def initialize(name)
    super(name)
  end

  def symbol(color)
    if color == 'black'
      "\u265D"
    else
      "\u2657"
    end
  end

  protected

  def move_dirs(start_pos)
    diagonal_dirs
  end

end
