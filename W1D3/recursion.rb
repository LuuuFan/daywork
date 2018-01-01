p require 'byebug'

def range(s, e)
  return [] if e <= s
  # return [s] if s == e

  range(s, e - 1) << e - 1
end

# p range(1, 5)
# p range(1, -2)
# p range(1, 1)

def range_sum_iterative(s, e)
  arr = range(s, e)
  sum = 0
  arr.each { |el| sum += el }
  sum
end

# p range_sum_iterative(1, 5)
# p range_sum_iterative(1, -2)
# p range_sum_iterative(1, 1)

def range_sum(s, e)
  arr = range(s, e)
  return 0 if e <= s
  last_el = arr.pop
  last_el + range_sum(s, last_el)
  arr.pop + range_sum(s, arr.last)
end

# p range_sum(1, 5)
def exp_r1(b, n)
  return 1 if n == 0
  if n > 0
   exp_r1(b, n - 1) * b
  else
    1 / (exp_r1(b, n.abs - 1) * b).to_f
  end
end



def exp_r2(b, n)
  return 1 if n == 0
  return b if n == 1
  if n > 0
    if n.even?
      exp_r2(b, n / 2) ** 2
    else
      b * (exp_r2(b, (n - 1) / 2) ** 2)
    end
  else
    if n.even?
      1 / (exp_r2(b, n.abs / 2) ** 2).to_f
    else
      1 / (b * (exp_r2(b, (n.abs - 1) / 2) ** 2)).to_f
    end
  end
end
#
# p exp_r2(2, 3)
# p exp_r2(2, -1)
# p exp_r2(2, -3)


class Array
  def deep_dup
    return [] if self.empty?

    arr = []
    self.each do |el|
      if el.is_a?(Array)
        arr << el.deep_dup
      else
        arr << el
      end
    end
    arr
  end
end

# robot_parts = [
#   [1, [2], [3, [4]]]
# ]
#
# p robot_parts_copy = robot_parts.deep_dup
#
# # shouldn't modify robot_parts
# p robot_parts_copy[0] << "LEDs"
# # but it does
# p robot_parts[0] # => ["capacitors", "resistors", "inductors", "LEDs"]

def fib_recursive(n)
  return 0 if n == 0
  return 1 if n == 1

  fib_recursive(n - 1) + fib_recursive(n -2)
end

# p fib_recursive(5)

def fib_iterative(n)
  arr = [0, 1]

  while arr.length <= n
    arr << arr[-1] + arr[-2]
  end

  arr.last
end

# p fib_iterative(6)

def subsets(arr)
  return [[]] if arr.empty?
  return [[], arr] if arr.length == 1

  last_el = [arr.pop]
  old_arr = subsets(arr)
  old_arr + old_arr.map { |el| el += last_el }
end

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3])
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]


def permutations(arr)
  return arr if arr.length <= 1
  return [arr, arr.reverse] if arr.length == 2
  permutation = []
  # debugger
  last_el = arr.pop
  old_arr = arr.deep_dup
  permutations(old_arr).each do |el|
    (0..el.length).each do |pos|
      base_el = el.deep_dup
      permutation += [base_el.insert(pos, last_el)]
    end
  end
  permutation
end

# p permutations([1])
# p permutations([1, 2])
# p permutations([1, 2, 3])

def bsearch(arr, target)
  return 0 if arr.length == 1 && arr[0] == target
  return nil if arr.length == 1 && arr[0] != target
  left_arr = arr[0..arr.length / 2 - 1]
  right_arr = arr[arr.length / 2 + 1..-1]
  mid_idx = arr.length / 2

  if target < arr[arr.length / 2]
    bsearch(left_arr, target)
  elsif target == arr[mid_idx]
    return mid_idx
  else
    bsearch(right_arr, target).nil? ? nil : bsearch(right_arr, target) + mid_idx + 1
  end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# # p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil
# p bsearch([5, 7], 6) # => nil

def merge_sort(arr)
  return arr if arr.length <= 1
  # first_part = arr[0..arr.length / 2]
  first_part = arr[0..arr.length / 2 - 1]
  # p first_part
  second_part = arr[arr.length / 2..-1]
  # p second_part
  merge(merge_sort(first_part), merge_sort(second_part))
end

def merge(arr1, arr2)
  arr = []
  arr1_length = arr1.length
  arr2_length = arr2.length
  length = arr1_length + arr2_length
  while arr.length <= length
    if arr1.empty?
      arr << arr2.shift
    elsif arr2.empty?
      arr << arr1.shift
    elsif arr1.first <= arr2.first
      arr << arr1.shift
    else
      arr << arr2.shift
    end
  end
  arr.compact
end

def greedy_make_change(amount, coins = [25, 10, 5, 1])
  arr = []
  coins.each do |coin|
    (amount/coin).times do
      arr << coin
    end
    amount = amount % coin
  end
  arr
end

def make_better_change(amount, coins = [25, 10, 5, 1])
  correct_coin = coins.select { |coin| amount % coin == 0 }.first

  if !correct_coin.nil? && correct_coin != 1  && amount >= 5
    arr = []
    (amount / correct_coin).times do
      arr << correct_coin
    end
  elsif correct_coin == 1 && amount < 5
    arr = []
    (amount / correct_coin).times do
      arr << correct_coin
    end
    greedy_arr = greedy_make_change(amount, coins)
    return arr.length <= greedy_arr.length ? arr : greedy_arr
  end
  # debugger
  # static_amount = amount
  # static_coins = coins.deep_dup
  # debugger
  if !coins.empty?
    biggest_coin = coins[0]
  end
  # amount -= biggest_coin
  [biggest_coin] + make_better_change(amount - biggest_coin, coins[1..-1])
  # greedy_arr.length <= better_arr.length ? greedy_arr : better_arr
end
