class MaxIntSet

  attr_reader :store
  def initialize(max)
    # @set = Set.new
    @max = max
    @store = (0..max).map { false }
  end

  def insert(num)
    raise "Out of bounds" unless is_valid?(num)
    @store[num] = num
    true
  end

  def remove(num)
    raise "Out of bounds" unless is_valid?(num)
    @store[num] = false
  end

  def include?(num)
    raise "Out of bounds" unless is_valid?(num)
    @store[num] == num
  end

  private

  def is_valid?(num)
    if num.between?(0, @max)
      true
    else
      false
    end
  end

  def validate!(num)

  end
end


class IntSet

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    if include?(num)
      # num = 1
      # [1]
      self[num].delete_at([num].index(num))
    else
      raise "num not in bucket"
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % @store.length]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if full
      # @count -= @store.length
      resize!
    end
    if !include?(num)
      self[num] << num
      @count += 1
    end
  end

  def remove(num)
    if include?(num)
      # num = 1
      # [1]
      self[num].delete_at([num].index(num))
      @count -= 1
    # else
    #   raise "num not in bucket"
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  def full
    @store.all? { |subarr| subarr.count > 0 }
  end

  private


  def [](num)
    @store[num % @store.length]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
      store_copy = @store.dup
      @store = Array.new(@store.length * 2) { Array.new }
      @count = 0
      store_copy.flatten.each do |el|
        insert(el)
      end
      # @store.concat(Array.new(@store.length) {Array.new})
      # @store.flatten.each do |el|
      #   remove(el)
      #   @count -= 1
      #   insert(el)
      # end
  end
end
