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
    # IMPLEMENT ME
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
  # ADD CODE HERE

  while list
    # ADD CODE HERE
    list = list.next_node
  end

  # ADD CODE HERE
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

