require 'pry'
require_relative 'node'
class LinkedList
  attr_accessor :head

  def initialize()
      @head = nil
  end

  # wrote this one just so i could create lists to test my code
  def add(value)
    if (@head == nil)
      @head = Node.new(value)
    else
      current_node = @head
      while (!current_node.next_node.nil?)
        current_node = current_node.next_node
      end
      current_node.next_node = Node.new(value)
    end
  end

  def to_s
    @head.to_s
  end

end

def remove_from_any_list(head_node, value_to_remove)
  current_node = head_node
  # while there isn't a node value match to the value in the parameter, keep moving to the next node
  while (current_node.next_node) && (current_node.next_node.value != value_to_remove)
    current_node = current_node.next_node
  end
  # if the value is found in the list:
  if (!current_node.end?)
    node_to_remove = current_node.next_node
    if (node_to_remove.next_node == nil) #if removing the last node, point the previous node to nil
      current_node.next_node = nil
    else  #if not the last node, point the current node to the node after the next(removed) one
      current_node.next_node = node_to_remove.next_node
    end
  end

end

def sort_list_values(head_node)
  if (head_node.value == nil || head_node.next_node.value == nil)
    return head_node.to_s
  end

  temp = head_node
  slow = head_node
  fast = head_node

  while (fast != nil && fast.next_node != nil)
    temp = slow
    slow = slow.next_node
    fast = fast.next_node.next_node
  end

  temp.next_node = nil
  first_head = head_node
  first_tail = temp
  second_head = slow
  second_tail = fast

  merge(first_head, second_head)
end

def merge(node1, node2)
  current_node = Node.new(0)
  sorted = LinkedList.new(current_node)
  while (node1 != nil && node2 != nil)
    if (node1.value < node2.value)
      current_node.next_node = node1
      node1 = node1.next_node
    else
      current_node.next_node = node2
      node2 = node2.next_node
    end
  end
  return sorted
end