# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {ListNode}

#This solution uses a hash to help identifying duplicate entries
def delete_duplicates(head)
  return unless head
  previous_node = head
  current_node = head
  nodes = {}
  
  while current_node do
      nodes[current_node.val] = nodes[current_node.val] ? nodes[current_node.val] + 1 : 1
      
      current_node = current_node.next
  end
  
  return_head = ListNode.new
  current_node = return_head
  previous_node = return_head
  at_least_one_valid = false
  
  nodes.each do |key, value|
      if value == 1
          current_node.val = key
          current_node.next = ListNode.new
          previous_node = current_node
          current_node = current_node.next
          at_least_one_valid = true
      end
  end
  
  return unless at_least_one_valid
  
  previous_node.next = nil
  return_head
end

# This is a inplace solution only modifying the original list
def delete_duplicates(head)
  current_node = head
  previous_node = head

  
  while current_node do
      duplicate = false
      current_value = current_node.val
  
      while current_node.next && current_value == current_node.next.val do
          duplicate = true
          current_node = current_node.next
      end
      
      previous_node.next = current_node unless duplicate || current_value == previous_node.val
      
      previous_node = previous_node.next unless duplicate || current_value == previous_node.val
      
      previous_node.next = nil if duplicate && current_node.next.nil?
      
      head = current_node.next if duplicate && current_value == head.val
      
      current_node = current_node.next
  end
  
  head
end