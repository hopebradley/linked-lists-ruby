require_relative 'node'
class LinkedList
    attr_accessor :head, :tail

    def initialize()
        @head = nil
        @tail = nil
    end

  def add(value)
    if (@head == nil)
      @head = Node.new(value)
    else
      @tail = @head
      while (!@tail.next_node.nil?)
        @tail = @tail.next_node
      end
      @tail.next_node = Node.new(value)
    end
  end

  def remove_value(value_to_remove)
    current_node = @head

    if (@head.value == value_to_remove)
      @head = @head.next_node
    end

    while current_node.next_node && (current_node.next_node.value != value_to_remove)
      current_node = current_node.next_node
    end

    if !current_node.end?
      node_to_remove = current_node.next_node
      if (node_to_remove.next_node == nil)
        current_node.next_node = nil
      else 
        current_node.next_node = node_to_remove.next_node
      end
    end
  end

  def to_s
    @head.to_s
  end

end


def remove_from_any_list(first_node, value_to_remove)
end