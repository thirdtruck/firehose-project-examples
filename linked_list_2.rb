# Classes

class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end


# Functions

def print_values(list_node)
  print "#{list_node.value} --> "
  if list_node.next_node.nil?
    print "nil\n"
    return
  else
    print_values(list_node.next_node)
  end
end

def reverse_list(list, previous=nil)
  unless list.next_node
    # We've reached the last item of the original list, so append all of the
    # now-reversed nodes to it and just return our new head node.
    list.next_node = previous
    return list
  end

  # "new_head" is one of two adjacent cursors that run down the length of the list in tandem.
  new_head = list

  # "new_tail" is the other cursor. Save it now, since we'll be detaching it temporarily.
  new_tail = list.next_node

  # "Change the direction of the arrow" here.
  # Note: "previous" will be nil the first time we call this method.
  new_head.next_node = previous

  # With the cursors advanced, change the next arrow.
  reverse_list(new_tail, new_head)
end

# Example Nodes

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

# Example Usage

print_values(node3)

# Linked List Problem #1

revlist = reverse_list(node3)

print_values(revlist)

