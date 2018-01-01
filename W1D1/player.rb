# require "./Ghost"

class Player

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def guess
    puts "please input the letter"
    alphabet =  ("A".."Z").to_a + ("a".."z").to_a
    input = gets.chomp
    if alphabet.include?(input) && input.length == 1
      return input
    else
      self.guess
    end
  end

  def alert_invalid_guess
    puts "It's not a valid guess, YOU LOST!"
  end

end
