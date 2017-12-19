require_relative 'tile'

class Board

  attr_accessor :grid
  def initialize
    @grid = []
  end

  def self.from_file(file_path)
    board = Board.new
    file = File.new(file_path)

    file.each_line { |line| board.grid << line.chomp }
    board.grid.map! do |row|
      row = row.chars.map do |el|
        if el == "0"
          el = Tile.new(0, false)
        else
          el = Tile.new(el.to_i, true)
        end
      end
    end
    board
  end

  def update_tile(val, pos)
    tile = @grid[pos[0]][pos[1]]
    if !tile.given
      tile.value = val
    end
  end

  def check_given(pos)
    tile = @grid[pos[0]][pos[1]]
    tile.given
  end

  def solved?
    arr = (1..9).to_a
    result_row = @grid.all? do |line|
      arr == line.map{|el| el.value }.sort
    end
    col = @grid.transpose
    result_col = col.all? do |line|
      arr == line.map{ |el| el.value }.sort
    end
    chunk1 = @grid[0..2].transpose
    chunk2 = @grid[3..5].transpose
    chunk3 = @grid[6..8].transpose
    result_chunk = [chunk1, chunk2, chunk3].all? { |chunk| chunk_checker(chunk)}
    result_row && result_col && result_chunk
  end

  def chunk_checker(chunk)
    arr = (1..9).to_a
    i = 0
    while i < 9
      result = []
      j = 0
      while j < 3
        result.concat(chunk[j])
        j += 1
      end
      return false if arr != result.map{ |el| el.value }.sort
      i += 3
    end
    true
  end

  def render
    @grid.each do |line|
      line.each do |el|
        print " #{el} "
      end
      puts
      puts
    end
    nil
  end


end
