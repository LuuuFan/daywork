require_relative 'Piece'
require_relative 'sliding_pieces'

class Rook < Piece
  include SlidingPieces

  def initialize(name)
    super(name)
  end

  def symbol(color)
    if color == 'black'
      "\u265C"
    else
      "\u2656"
    end
  end

  protected

  def move_dirs(start_pos)
    horizontal_dirs
  end

end
