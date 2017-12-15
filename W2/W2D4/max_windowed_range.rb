require 'byebug'
def windowed_max_range(arr, range)
  current_max_range = nil
  range_arr = []
  arr.length.times do |idx|
    range_arr << arr[idx..idx + range - 1]
  end
  range_arr.each { |el| current_max_range = (el.max - el.min) if current_max_range.nil? || current_max_range < (el.max - el.min) }
  current_max_range
end

# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

def windowed_max_range_sq(arr, range)
  # copy = arr.dup
  max_range = 0
  (0..arr.length - range).to_a.each do |start|
    holder = []
    (start..start + range - 1).to_a.each do |idx|
      # debugger
      if holder.empty?
        holder << arr[idx]
      elsif holder.length == 1 && arr[idx] > holder[0]
        holder << arr[idx]
      elsif holder.length == 1 && arr[idx] < holder[0]
        holder.unshift(arr[idx])
      elsif arr[idx] > holder.last
        holder.pop
        holder << arr[idx]
      elsif arr[idx] < holder.first
        holder.shift
        holder.unshift(arr[idx])
      end
    end
    amount = holder.last - holder.first
    max_range < amount ? max_range = amount : max_range
  end
  max_range
end

p windowed_max_range_sq([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range_sq([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range_sq([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range_sq([1, 3, 2, 5, 4, 8], 5) == 6 # 3


class MyQueue
  attr_accessor :store
  def initialize
    @store = []
  end

  def enqueue(el)
    @store << el
  end

  def dequeue
    @store.shift
  end

  def peek
    @store[0]
  end

  def size
    @store.count
  end

  def empty?
    @store.empty?
  end
end

class MyStack
  attr_accessor :store
  def initialize
    @store = []
  end

  def pop
    @store.pop
  end

  def push(el)
    @store.push
  end

  def peek

  end

  def size
    @store.count
  end

  def empty?
    @store.empty?
  end
end
