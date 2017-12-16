# require_relative 'display'
require_relative 'piece'
require_relative 'queen'

class PosError < StandardError
end

class Board
  attr_reader :grid

  def initialize
    @grid = make_starting_grid
    place_piece
  end

  def make_starting_grid
    Array.new(8) { Array.new(8) }
  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def []=(pos, piece)
    @grid[pos[0]][pos[1]] = piece
  end

  def place_piece
    # [0,1,6,7].each do |row|
    #   (0..7).each do |col|
    #     @grid[row][col] = Piece.new
    #   end
    # end
    @grid[7][3] = Queen.new
  end

  def dup()
  end

  def move_piece(color, from_pos, to_pos)

  end

  def move_piece!(from_pos, to_pos)
    begin
      raise PosError if @grid[from_pos[0]][from_pos[1]] == nil
      raise PosError if @grid[to_pos[0]][to_pos[1]] != nil
    rescue PosError
      puts "Invalid position, please try again"
    end
    @grid[to_pos[0]][to_pos[1]] = @grid[from_pos[0]][from_pos[1]]
    @grid[from_pos[0]][from_pos[1]] = nil
  end

  def checkmate?()
  end

  def find_king(color)
  end

  def in_bounds?(cursor_pos)
    cursor_pos[0].between?(0, 7) && cursor_pos[1].between?(0, 7)
  end

end
