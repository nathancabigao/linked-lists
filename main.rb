# frozen-string-literal: true

# Class for creating instances of LinkedLists
class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  # Creates a new node with value, adds to end of list
  def append(value)
    new_node = Node.new(value)
    @head = new_node if @head.nil?
    @tail.next_node = new_node unless @tail.nil?
    @tail = next_node
  end

  # Creates a new node with value, adds to start of list
  def prepend(value)
    new_node = Node.new(value)
    @tail = new_node if @tail.nil?
    new_node.next_node = @head unless @head.nil?
    @head = new_node
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
