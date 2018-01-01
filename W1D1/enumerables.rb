
require "byebug"
class Array
  def my_each(&prc)
    # takes a block, calls block on each elt in array, returns original array
    i =0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
    #debugger
    #prc.call(self)
    self
  end


  def my_select(&prc)
    arr = []
    self.my_each { |num| arr.push(num) if prc.call(num) }
    arr
  end

  def my_reject(&prc)
    arr = []
    self.my_each { |num| arr.push(num) if !prc.call(num) }
    arr
  end

  def my_any?(&prc)
    ans = false
    self.my_each{|num|  ans = true if prc.call(num)}
  ans
  end

  def my_flatten
    arr = []
    self.my_each do |el|
      if el.class == Array
        arr.concat(el.my_flatten)
      else
        #debugger
        arr <<  el
      end
    end
    # while arr.any? { |el| el.class == Array }
    #
    # end
    arr
  end

  def my_zip(*args)
    arr = []
      self.each_with_index do |el, idx|
        inside_arr = []
        inside_arr << el
        args.each { |x| inside_arr << x[idx] }
        arr << inside_arr
      end
    arr
  end

  def my_rotate(n = 1)
    # n.times do
    #   self.push(self.shift)
    # end
    # if n > 0
    #   n.times do
    #     self.push(self.shift)
    #   end
    # else
    #   n.abs.times do
    #     self.unshift(self.pop)
    #   end
    # end
    arr = Array.new(self)
    m = n % self.length
    arr.each_with_index do |x, idx|
      if (idx - m).abs > self.length - 1
        new_index = (self.length- (idx-m).abs).abs
        self[new_index] = x
      else
        self[idx - m] = x
      end
    end
    self
  end

  def my_join( s = "")
    new_string= self[0]
    self.each_with_index do |x, ind| if ind != 0
      new_string += s
      new_string += x
    end
    end
    new_string
  end

  def my_reverse
    arr= []
    i = self.length-1
    while i >=0
      arr << self[i]
      i -= 1
    end
    arr
  end
end

p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]
# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")
#


#a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
 # p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]



# return_value = [1, 2, 3].my_each do |num|
#   p num
#   puts num.class
# end.my_each do | num|
#   puts num
#   end

#puts return_value

# a = [1, 2, 3]
# a.my_select{ |num| num > 1 }
# a.my_select{ |num| num == 4 }

# p [1, 2, 3].my_reject{ |num| num >1 }
# p [1, 2, 3].my_reject{|num| num == 4}
#
#

# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false

# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]
# #
# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]
