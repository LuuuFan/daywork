require 'colorize'

class Tile

  attr_accessor :value, :given

  def initialize(value, given)
    @value = value
    @given = given
  end

  def to_s
    if given
      value.to_s.colorize(:white).colorize(:background => :black)
    else
      value.to_s
    end
  end

end
