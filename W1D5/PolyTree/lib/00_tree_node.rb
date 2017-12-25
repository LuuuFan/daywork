require "byebug"

class PolyTreeNode
  attr_reader :value, :parent
  attr_accessor :children

  def initialize(value, parent = nil, children = [])
    @value = value
    @parent = parent
    parent.add_child(self) unless parent.nil?
    @children = children
  end

  def parent=(parent)
    if parent.nil? && !@parent.nil?
      @parent.children.delete(self)
      @parent = parent #????????????????
    elsif !@parent.nil?
      @parent.children.delete(self)
      @parent = parent
      parent.children.push(self) unless parent.children.include?(self)
    else
      @parent = parent
      parent.children.push(self) unless parent.children.include?(self)
    end
  end

  def add_child(child_node)
    child_node.parent = self
    @children.push(child_node) unless @children.include?(child_node)
  end

  def remove_child(child_node)
    if @children.include?(child_node)
      child_node.parent = nil
      @children.delete(child_node)
    elsif @parent == child_node
      raise "Cannot remove parent as a child "
    else
      raise "#{child_node.value} is not my child"
    end
  end

  def dfs(target_value)
    return self if target_value == self.value
    return nil if @children.empty?
    # result = nil
    i = 0
    while i < @children.length
      # debugger
      result = @children[i].dfs(target_value)
      break unless result.nil?
      i += 1
    end
    result
  end

  def bfs(target_value)
    queue = [self]
    queue.each do |el|
      return el if el.value == target_value
      unless el.children.empty?
        el.children.each do |child|
          queue << child
        end
      end
    end
    nil
  end
end


if __FILE__ == $PROGRAM_NAME

end
