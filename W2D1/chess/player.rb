
class Player

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def make_move

  end

end

class HumanPlayer < Player
  attr_reader :name
  def initialize(name)
    super(name)
  end

  def make_move

  end

end

class ComputerPlayer < Player
  attr_reader :name
  def initialize(name)
    super(name)
  end

  def make_move

  end

end
