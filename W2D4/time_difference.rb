require 'byebug'
def my_min(list)
  hash = Hash.new { |h, k| h[k] = [] }
  list.each do |el|
    list.each do |el2|
      hash[el] << el2 if el <= el2
    end
  end
  hash.sort_by { |k, v| v.length }.last.first
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

def my_min_2(list)
  smallest = 0
  list.each do |el|
    smallest = el if el < smallest
  end
  smallest
end

# p my_min_2(list)  # =>  -5

def largest_contiguous_subsum(list)
  arr = []
  list.length.times do |id|
    arr << [list[id]]
    id2 = id + 1
    while id2 < list.length
      arr << list[id..id2]
      id2 += 1
    end
  end
  sum_arr = arr.map{ |el| el.reduce(:+)}
  arr[sum_arr.find_index{|el| el == sum_arr.max}]
end
#


def largest_contiguous_subsum_2(list)
  # debugger
  new_arr = list.dup
  from_idx = new_arr.find_index { |el| el == new_arr.max}
  largest = new_arr.delete_at(from_idx)
  to_idx = new_arr.find_index { |el| el == new_arr.max }
  to_idx += 1
  range = list[from_idx..to_idx]
  range.reduce(:+) > largest ? range : [largest]
end

list1 = [5, 3, -7] #=> [5, 3]
list2 = [2, 3, -6, 7, -6, 7]# => [7,-6,7]
list3 = [-5, -1, -3]# => [-1]


start_time = Time.now
100000.times do
  largest_contiguous_subsum(list1)
end
end_time = Time.now
p start_time - end_time


start_time = Time.now
100000.times do
  largest_contiguous_subsum_2(list1)
end
end_time = Time.now
p start_time - end_time
#
# p largest_contiguous_subsum_2(list1)
# p largest_contiguous_subsum_2(list2)
# p largest_contiguous_subsum_2(list3)
