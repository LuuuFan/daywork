require_relative "card"

class Board

  attr_reader :size

  def initialize(size = 4)
    @size = size
    @board = create_board(size)
    self.populate
  end


  def render
    system("clear")
    @board.each do |row|
      row.each do |el|
        print(el.to_s)
      end
      puts
    end
  end

  def won?
    @board.flatten.all? { |el| !el.display.nil? }
  end

  def reveal(guessed_position)
    card = @board[guessed_position[0]][guessed_position[1]]
    if !card.display
      card.flip
      card.to_s
    end
    card.display
  end

  def hide(guessed_position)
    card = @board[guessed_position[0]][guessed_position[1]]
    if card.display
      card.flip
    end
  end

  def populate
    value = generate.shuffle
    @board = @board.map do |row|
        row = row.map do |el|
          Card.new(value.pop)
        end
    end
  end

  private
    def create_board(size)
      Array.new(size) { Array.new(size) }
    end


    def generate
      arr = (1..@size ** 2 / 2).to_a
      arr += arr
    end


end
