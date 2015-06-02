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

# For the sake of simplicity, we assume that we've been passed the first node in a list that has
# at least two nodes (a prerequisite for a loop-capable list).
def is_infinite(list)
  tortoise = list
  hare = list

  while hare
    if tortoise.nil? || hare.nil? # We've reached the end of a list, which means it's finite
      return false
    end

    tortoise = tortoise.next_node
    hare = hare.next_node

    if hare.nil?
      return false # We've reached the end of a list, which means it's finite
    else
      # The crucial step: The hare moves twice as fast as the tortoise, who only moves one node
      # at a time. If the list in finite, then the hare will always beat the tortoise to the end.
      # However, if they've fallen into a (timey-wimy) loop, then the hare will eventually
      # circle around and catch up with the plodding tortoise (even if it requires hopping over
      # the tortoise one or more times en route).
      hare = hare.next_node
    end

    if tortoise == hare # The hare must have circled back around and caught up, proving a loop
      return true
    end
  end
end

def f(node)
  node.next_node if node
end

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

# Example Usage

if is_infinite(node3)
  puts "Cannot print infinite lists."
else
  print_values(node3)
end

# Create a loop

node1.next_node = node3

if is_infinite(node3)
  puts "Cannot print infinite lists."
else
  print_values(node3)
end
