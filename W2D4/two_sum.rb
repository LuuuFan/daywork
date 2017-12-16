require 'byebug'

def bad_two_sum?(arr, target)

  arr.length.times do |id|
    id2 = id + 1
    while id2 < arr.length
      return true if arr[id] + arr[id2] == target
      id2 +=  1
    end
  end
  false
end

def okay_two_sum?(arr, target)
  arr.sort!
  start = 0
  last = arr.length - 1
  # debugger
  until start != last && arr[start] + arr[last] == target
    if arr[start] + arr[last] > target
      last -= 1
    elsif arr[start] + arr[last] < target
      start += 1
    elsif start >= last
      return false
      break
    end
  end
  true
end

def two_sum?(arr, target)
  hash = Hash.new
  arr.each do |el|
    hash[el] = target - el
  end
  hash.each_value { |v| return true if arr.include?(v) }
  false
end

example = [1,2,3,4]
# arr = [0, 1, 5, 7]
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false

p two_sum?(example, 7)
p two_sum?(example, 10)
