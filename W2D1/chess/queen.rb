require_relative 'piece'
require_relative 'sliding_pieces'

class Queen < Piece
  include SlidingPieces

  def initialize
    super
  end

  def symbol#(color)
    # if color == 'black'
      "\u265B"
    # else
    #   "\u2655"
    # end
  end

  protected

  def move_dirs(start_pos)
    both_dirs
  end

end
