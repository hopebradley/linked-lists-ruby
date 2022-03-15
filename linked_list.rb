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



def merge_sort(head_node)
  temp = head_node
  slow = head_node
  fast = head_node

  while (fast != nil && fast.next_node != nil)
    temp = slow
    slow = slow.next_node
    fast = fast.next_node.next_node
  end
  temp.next_node = nil
  new_head_1 = merge_sort(head_node)
  new_head_2 = merge_sort(slow)
  final_head = merge(new_head_1, new_head_2)
  return final_head
end

def merge(node1, node2)
  sorted = nil
  if (node1.nil?)
    return node2
  elsif (node2.nil?)
    return node1
  end

  if (node1.value <= node2.value)
    sorted = node1
    sorted.next_node = merge(node1.next_node, node2)
  else
    sorted = node2
    sorted.next_node = merge(node1, node2.next_node)
  end
  return sorted.to_s
end

# def merge_sorted(head1, head2)
#   # if both lists are empty then merged list is also empty
#   # if one of the lists is empty then other is the merged list
#   return "Empty List" if !head1 && !head2
#   if (!head1)
#     return head2
#   elsif (!head2)
#     return head1
#   end

#   mergedHead = nil
#   if (head1.value <= head2.value)
#     mergedHead = head1
#     head1 = head1.next_node
#   else
#     mergedHead = head2
#     head2 = head2.next_node
#   end

#   mergedTail = mergedHead

#   while (head1 && head2)
#     temp = nil
#     if (head1.value <= head2.value)
#       temp = head1
#       head1 = head1.next_node
#     else
#       temp = head2
#       head2 = head2.next_node
#     end

#     mergedTail.next_node= temp
#     mergedTail = temp
#   end

#   if (head1)
#     mergedTail.next_node= head1
#   elsif (head2)
#     mergedTail.next_node= head2
#   end

#   return mergedHead.to_s
# end

ll = LinkedList.new
ll.add(6)
ll.add(3)
ll.add(4)
ll.add(1)
puts ll.head
merge_sort(ll.head)