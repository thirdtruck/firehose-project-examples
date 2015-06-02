# Classes

class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

class Stack
  attr_reader :data

  def initialize
    @data = nil
  end

  # Push an item onto the stack
  def push(element)
    # IMPLEMENT ME!
    if @data
      last_node = last_node_in_list(@data)
      last_node.next_node = LinkedListNode.new(element)
    else
      @data = LinkedListNode.new(element)
    end

    self # Return self to make chaining method calls easier. A good default for methods without an obvious return value.
  end

  # Pop an item off the stack.
  # Remove the last item that was pushed onto the
  # stack and return it to the user
  def pop
    last_node = @data
    second_to_last_node = nil

    unless last_node
      return nil
    end

    while next_node = last_node.next_node
      second_to_last_node = last_node
      last_node = next_node
    end

    if second_to_last_node
      second_to_last_node.next_node = nil # Cut off the end of the tail
    else
      @data = nil # We made it down to the very last item, so delete it
    end

    last_node.value
  end

end

# Functions

def last_node_in_list(list)
  last_node = list

  unless last_node
    return nil
  end

  while next_node = last_node.next_node
    last_node = next_node
  end

  last_node
end

def print_values(list_node)
  print "#{list_node.value} --> "
  if list_node.next_node.nil?
    print "nil\n"
    return
  else
    print_values(list_node.next_node)
  end
end

def reverse_list(list)
  stack = Stack.new

  # Populate the stack with the values of the list (in their original order)
  while list
    stack.push(list.value)
    list = list.next_node
  end

  new_head = nil # Our return value, which will remain the same once set
  old_tail = nil # The cursor that tracks the last node added to our new list

  # (For the sake of this exercise, we're assuming that none of the nodes have nil values.
  # A more advanced Stack would provide a #size method or the like, which would allow us to
  # move beyond that assumption.)
  # (We're also assuming that we've been passed a non-empty list. A more advanced version
  # of this method would add additional checks.)
  while next_value = stack.pop
    # If we've already added at least one value, then add the next one to the list and 
    # advance the cursor.
    # Otherwise we're still at the first value, so populate the starting node and set the
    # cursor to that first node.
    if old_tail
      new_tail = LinkedListNode.new(next_value)
      old_tail.next_node = new_tail
      old_tail = new_tail
    else
      new_head = LinkedListNode.new(next_value)
      old_tail = new_head
      next
    end
  end

  new_head
end

# Example Nodes

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

# Example Usage

print_values(node3)

# Linked List Problem #1

stack = Stack.new
stack.push(1)
print_values(stack.data)
stack.push(2)
print_values(stack.data)
stack.push(3)
print_values(stack.data)

puts stack.pop
print_values(stack.data)
puts stack.pop
print_values(stack.data)
puts stack.pop

revlist = reverse_list(node3)

print_values(revlist)

