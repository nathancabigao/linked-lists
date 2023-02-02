# frozen-string-literal: true

# Class for creating instances of LinkedLists
class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end
end

# Class for creating Nodes to be used in LinkedList
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
