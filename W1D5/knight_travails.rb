class KnightPathFinder

  attr_reader :visited_positions

  def initialize(pos)
    build_move_tree(pos)
    @visited_positions = [pos]
    @start_pos = pos
  end

  def find_path(pos)
  end


  def build_move_tree
    queue = [@start_pos]
    queue.each do |pos|
      next_moves = new_move_positions(@start_pos)
      next_moves.each do |el|
        queue << el
      end
    end
  end

  def new_move_positions(pos)
    KnightPathFinder.valid_moves(pos).select { |pos| !@visited_positions.include?(pos) }
  end

  def self.valid_moves(pos)
    moves = [2,1,-2,-1].permutation.to_a.select{ |el| el[0].abs != el[1].abs}
    valid_moves = []
    moves.each do |move|
      valid_moves << [move[0] + pos[0], move[1] + pos[1]]
    end
    valid_moves.select{ |el| el[0].between?(0, 7) && el[1].between?(0, 7)}.uniq
  end


end

# a = Array.new(8) { Array.new(8){Array.new}}
# a.each_with_index do |row, idx_row|
#   row.each_with_index do |pos, idx|
#     pos << idx_row
#     pos << idx
#   end
# end

# a = KnightPathFinder.new([0,0])
p KnightPathFinder.valid_moves([1,2])
