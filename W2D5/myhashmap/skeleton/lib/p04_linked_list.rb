require 'byebug'
class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  attr_reader :first, :last
  def initialize
    @first = nil
    @last = nil
    # @first.next = @last
    # @last.next = @first
    # @last.prev = @first
    # @first.prev = @last
    @dummy_first = Node.new(:dummy, :dummy)
    @dummy_last = Node.new(:dummy, :dummy)
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  # def first
  #
  # end
  #
  # def last
  #
  # end

  def empty?
    # p @first.next.object_id
    # p @last.object_id
    # p @first.next == @last
    @first.nil? && @last.nil?
  end

  def get(key)
  end

  def include?(key)
  end

  def append(key, val)
    # debugger
    new_node = Node.new(key, val)
    if @first.nil?
      @dummy_first.next = new_node
      new_node.prev = @dummy_first
      @dummy_last.prev = new_node
      new_node.next = @dummy_last
      @first = new_node
      # @last = new_node
    elsif @last.nil?
      temp_node = @last.prev
      @last.prev = new_node
      new_node.prev = temp_node
    end
    # node = @first.next
    # new_node = Node.new(key, val)
    # @first.next = new_node
    # new_node.next = node
    # new_node.prev = @first
    # node.prev = new_node
    # @first = @first.next if @first.key == :dummy
    # @last = @last.prev if @last.key == :dummy && @last != @first
    # p self
  end

  def update(key, val)
  end

  def remove(key)
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
