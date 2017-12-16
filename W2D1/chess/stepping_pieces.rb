module SteppingPieces

  def both_dirs(start_pos)
    horizontal_dirs(start_pos) + diagonal_dirs(start_pos)
  end

  def horizontal_dirs(start_pos)
    arr = []
    #start_pos = [4, 4]
    #[4,5],[4,6]...[4,7]
    #[4,1], [4,2],[4,3]
    (-1..1).each { |el| arr << [x + el, y] }
    (-1..1).each { |el| arr << [x, y + el] }
    arr.select { |pos| pos[0].between?(0,7) && pos[1].between?(0,7)}
  end

  def diagonal_dirs(start_pos)
    arr = []
    arr << [start_pos[0] + 1, start_pos[1] - 1 ]
    arr << [start_pos[0] - 1, start_pos[1] + 1 ]
    (-1..1).each { |el| arr << [start_pos[0] + el, start_pos[1] + el }
    arr.select { |pos| pos[0].between?(0,7) && pos[1].between?(0,7)}
  end
end
