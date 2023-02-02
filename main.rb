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

  # Returns the number of nodes in the list
  def size
    return 0 if @head.nil?

    current_node = @head
    size = 0
    until current_node.nil?
      size += 1
      current_node = current_node.next_node
    end
    size
  end

  # Returns the node at the given index
  def at(index)
    return @head if index.zero?
    return @tail if index == size - 1

    current_node = @head
    current_index = 0
    until current_index == index
      current_node = current_node.next_node
      current_index += 1
    end
    current_node
  end

  # Removes the last element from the list, return the node
  def pop
    popped_node = @tail
    return popped_node if @tail.nil?

    if size == 1
      @head = nil
      @tail = nil
    else
      set_new_tail
    end
    popped_node
  end

  # Sets a new tail when popping from list
  def set_new_tail
    new_tail = at(size - 2)
    new_tail.next_node = nil?
    @tail = new_tail
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
