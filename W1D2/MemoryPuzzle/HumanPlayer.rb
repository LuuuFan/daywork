class HumanPlayer

  def prompt
    puts("please give a position ex 1, 2")
    pos = gets.chomp.split(', ').map(&:to_i)
    if (@previous_guess && @previous_guess[1] == pos) || (pos[1] >= @board.size || pos[0] >= @board.size)
      puts "invalid input try again"
      prompt
    end
    pos
  end

  def make_guess(pos)
    if @previous_guess.nil?
      value = @board.reveal(pos)
      @previous_guess = [value, pos]
    else
      value = @board.reveal(pos)
      if value != @previous_guess[0]
        @board.render
        @board.hide(pos)
        @board.hide(@previous_guess[1])
      end
      @previous_guess = nil
    end
  end

  
end
