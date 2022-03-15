class Node
  attr_accessor :value, :next_node
  def initialize(value, next_node=nil)
      @value = value
      @next_node = next_node
  end

  def end?
    next_node.nil?
  end

  def to_s
    @next_node ? "#{@value} --> #{@next_node.to_s}" : "#{@value} --> nil"
  end

end