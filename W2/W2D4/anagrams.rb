require 'byebug'

def first_anagram?(str1, str2)
  result = []
  (0..str1.length - 1).to_a.each do |id|
    result << str1[id]
    id2 = id + 1
    while id2 < str1.length
      result << str1[id..id2]
      id2 += 1
    end
  end
  result.map{ |el| el.chars.sort.join }.include?(str2.chars.sort.join)
end

# anagram?("gizmo", "sally")    #=> false
# anagram?("elvis", "lives")    #=> true
# p first_anagram?("gizmo", "sally")
# p first_anagram?("elvis", "lives")

def second_anagram?(str1, str2)
  arr1 = str1.chars
  arr2 = str2.chars
  copy1 = Array.new(arr1)
  copy2 = Array.new(arr2)
  # debugger
  arr1.each_with_index { |el, idx| copy1.delete(el) if arr2.include?(el) }
  arr2.each_with_index { |el, idx| copy2.delete(el) if arr1.include?(el) }
  copy1.empty? && copy2.empty?
end
#
# p second_anagram?("gizmo", "sally")
# p second_anagram?("elvis", "lives")

def third_anagram?(str1, str2)
  #time complexity: n + n log n => n log n
  #space complexity: n
  str1.chars.sort == str2.chars.sort
end

p third_anagram?("gizmo", "sally")
p third_anagram?("elvis", "lives")

def fourth_anagram?(str1, str2)
  hash = Hash.new(0)
  str1.chars.each { |char| hash[char] += 1}
  str2.chars.each { |char| hash[char] -= 1}
  hash.all? { |k, v| v == 0 }
end

p fourth_anagram?("gizmo", "sally")
p fourth_anagram?("elvis", "lives")
