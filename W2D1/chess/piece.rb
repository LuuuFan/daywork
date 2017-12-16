# require_relative 'queen'

class Piece

attr_reader

  def initialize


  end

  def to_s

  end

  def symbol()

  end

  def valid_moves?(str_pos)
    # self.move_dirs(str_pos).include?(end_pos)
  end

  private
  def move_into_check(to_pos)

  end

end

class NullPiece < Piece

  def initialize
  end

end
