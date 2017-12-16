# PHASE 2
def convert_to_int(str)
  begin
    Integer(str)
  rescue ArgumentError => e
    puts "Something went wrong: #{e.message}"
  ensure
    nil
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else
    raise StandardError
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"

  begin
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue StandardError => e
    puts "I don't eat #{maybe_fruit} #{e.message}"
    retry
  # ensure
  end
end

# PHASE 4
class YearsError < StandardError
end

class NameError < StandardError
end

class PastTimeError < StandardError
end

class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    begin
      raise YearsError if yrs_known < 5
      raise NameError if name.length < 1
      raise PastTimeError if fav_pastime.length < 1
    rescue YearsError
      puts "Years need to be more than 5"
      puts "please enter the known years"
      yrs_known = gets.chomp.to_i
      retry
    rescue NameError
      puts "Name cannot be empty. Please input it again"
      name = gets.chomp
      retry
    rescue PastTimeError
      puts "Favorite pastime cannot be empty."
      fav_pastime = gets.chomp
      retry
    ensure
      @yrs_known = yrs_known
      @name = name
      @fav_pastime = fav_pastime
    end
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end
