require "byebug"

class Player
  attr_reader :name, :history, :matches


  attr_accessor :size



  def initialize(name)
    @name = name
    @history = Hash.new {[]}
    @size = nil
    @previous_guess = nil
    @previous_pos
    @internal_board = nil
    @matches = []
  end

  def create_internal_board
    result = []
    (0...@size).each do |el1|
      (0...@size).each do |el2|
        result << [el1, el2]
      end
    end
    @internal_board = result
  end

  def prompt
    # debugger
    if @history.empty?
      return @internal_board.pop
    elsif @previous_guess && @history.keys.include?(@previous_guess) && @history[@previous_guess].length >= 2
      # debugger
      return @history[@previous_guess].reject { |el| el == @previous_pos }[0]
    elsif !@previous_guess
      possible_values = @history.keys.select { |key| @history[key].length == 2 }
      possible_values.reject! { |value| @matches.include?(value) }
      if !possible_values.empty?
        return @history[possible_values[0]][0]
      end
    end
    @internal_board.pop
  end

  def update_history(pos, value, previous_guess)
    @history[value] += [pos]
    if previous_guess
      @previous_guess = value
      @previous_pos = pos
    else
      @previous_pos = nil
      @previous_guess = nil
    end
  end

  def update_match(value)
    @matches << value
  end
end
