require_relative 'p02_hashing'

class HashSet
  attr_reader :count, :store

  def initialize(num_buckets = 40)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end
  def insert(num)
    if @count == @store.length
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
    @store[num.hash % @store.length]
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
  # def insert(key)
  #   p @count
  #   p @store
  #   resize! if full?
  #   unless include?(key)
  #     self[key] << key
  #     @count += 1
  #   end
  # end
  #
  # def include?(key)
  #   self[key].include?(key)
  # end
  #
  # def remove(key)
  #   if include?(key)
  #     index = self[key].index(key)
  #     self[key].delete_at(index)
  #   end
  # end
  #
  # # private
  #
  # def [](num)
  #   # optional but useful; return the bucket corresponding to `num`
  #   # if num.is_a?(Array) && num.empty?
  #   #   num.hash
  #   @store[num.hash % @store.length]
  # end
  #
  # def num_buckets
  #   @store.length
  # end
  #
  # def full?
  #   @store.none?{ |el| el.empty? }
  # end
  #
  # def resize!
  #   store_copy = @store.dup
  #   @store = Array.new(@store.length * 2) { Array.new }
  #   @count = 0
  #   store_copy.flatten.each do |el|
  #     insert(el)
  #   end
  # end
end
