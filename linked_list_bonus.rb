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

def is_infinite(list)
  lam, mu = floyd(list)
  return lam > 1
end

def f(node)
  node.next_node if node
end

# For the sake of simplicity, we assume that we've been passed the first node in a list that has
# at least two nodes (a prerequisite for a loop-capable list).
def floyd(x0)
  tortoise = f(x0)
  hare = f(f(x0))

  while tortoise != hare
    tortoise = f(tortoise)
    hare = f(f(hare))
  end

  mu = 0
  tortoise = x0
  while tortoise != hare
    tortoise = f(tortoise)
    hare = f(hare)
    mu += 1
  end

  lam = 1
  hare = f(tortoise)
  while tortoise != hare
    hare = f(hare)
    lam += 1
  end

  return [lam, mu]
end

# Example Nodes

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
node1.next_node = node3

# Example Usage

if is_infinite(node3)
  puts "Cannot print infinite lists."
else
  print_values(node3)
end
