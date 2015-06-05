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
    @data = LinkedListNode.new(element, @data)
  end

  # Pop an item off the stack.
  # Remove the last item that was pushed onto the
  # stack and return it to the user
  def pop
    old_head = @data
    @data = @data && @data.next_node # Note the nil guard
    old_head
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

def reverse_list(list)
  stack = Stack.new

  stack.push(list.value) while list = list.next_node

  return stack.data
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

stack.pop
print_values(stack.data)
stack.pop
print_values(stack.data)
stack.pop

revlist = reverse_list(node3)

print_values(revlist)

