require "./player"

class Game

  attr_reader :player_a, :player_b, :dictionary
  attr_accessor  :fragment

  def initialize(player_a, player_b, dictionary)
    @player_a = player_a
    @player_b = player_b
    @fragment = ""
    @dictionary = dictionary
    @score_a = ""
    @score_b = ""
    @a= 0
    @b =0
    @current_player = player_a
    @previous_player = player_b
  end

  def play_round
    @fragment += @current_player.guess
    if valid_play?(@fragment)
      p @fragment
      p @current_player.name
      self.next_player!
    else
      self.record
    end
  end

  def record
    lost = "GHOST"
    if @current_player == @player_a
      @score_a += lost[@a]
      @a += 1
      p @a
    elsif @current_player == @player_b
      @score_b += lost[@b]
      @b +=1
      p  @b
    end
    @fragment = ""
    p "scorea: #{@score_a} & scoreb : #{@score_b} & frag is #{@fragment}"
    # p "scorea: "+ @score_a + " scoreb:" @score_b + " frag" + @fragment
  end

  def gameOver?
    gameOver = false
    if @score_a == "GHOST" || @score_b == "GHOST"
      gameOver = true
    end
    gameOver
  end

  def losses
    if dictionary.include?(@fragment)
      self.record
      @fragment = ""
    end
  end

  def run
    while !self.gameOver?
      self.play_round
      self.losses
    end
    puts "#{@current_player.name} LOST"
  end

  # private
    # def current_player
    #   current_player = @player_a
    # end
    #
    # def previous_player
    #   previous_player = @player_b
    # end

    def next_player!
      if @current_player == @player_a
        @current_player = @player_b
        @previous_player = @player_a
      else
        @current_player = @player_a
        @previous_player = @player_b
      end
    end

    def valid_play?(frag)
      dictionary.any?{ |x| x.include?(frag) }
    end


end


player_a = Player.new('Lu')
player_b = Player.new('KangLi')
dictionary = File.readlines('dictionary.txt').map(&:chomp)
# p dictionary
# p dictionary.include?("zygotic")
# dictionary= ["garage", "gar", "abbot", "abb"]
new_game = Game.new(player_a, player_b, dictionary)
new_game.run
