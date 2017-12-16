require_relative 'piece'
require_relative 'stepping_piece'

class King < Piece
  include SteppingPieces

  def initialize
    super
  end

  def symbol(color)
    if color == 'black'
      "\u265A"
    else
      "\u2654"
    end
  end

  protected

  def move_dirs(start_pos)
    both_dirs
  end

end
