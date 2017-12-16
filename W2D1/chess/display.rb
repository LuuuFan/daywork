require 'colorize'
require_relative 'board'
require_relative 'cursor'

class Display #< Board
    attr_reader :board, :cursor

    def initialize(board)
      @board = board
      @cursor = Cursor.new([1,1], board)
    end

    def render
      system("clear")
      @board.grid.each_with_index do |row, row_idx|
        row.each_with_index do |col, index|
          if row_idx == @cursor.cursor_pos[0] && index == @cursor.cursor_pos[1]
            print "  ".colorize(:background => :yellow)
          elsif (row_idx + index).odd?
            print "#{col.symbol} ".colorize(:background => :white) unless col.nil?
            print "  ".colorize(:background => :white) if col.nil?
          else
            print "#{col.symbol} ".colorize(:background => :light_white) unless col.nil?
            print "  ".colorize(:background => :light_white) if col.nil?
          end
        end
      puts
      end
    end

    def move(new_pos)
      # old_position = @cursor.get_input if @cursor.get_input.is_a?(Array)
      # !@board[old_position].nil?
      # puts "Please select the position you want to put #{@board[old_position].value}"
      # new_position = @cursor.get_input if @cursor.get_input.is_a?(Array)

    end

end


a = Board.new
display = Display.new(a)
loop do
  display.render
  display.cursor.get_input
end
# .get_input
# p String.colors
# p String.color_samples
# print "This is cyan background".colorize(:background => :cyan)
# p "This is color for string".colorize(:color => :blue)
