# frozen-string-literal: true

require_relative 'node'

# Class for creating instances of LinkedLists
class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value)
    @head = new_node if @head.nil?
    @tail.next_node = new_node unless @tail.nil?
    @tail = new_node
  end

  def prepend(value)
    new_node = Node.new(value)
    @tail = new_node if @tail.nil?
    new_node.next_node = @head unless @head.nil?
    @head = new_node
  end

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

  def set_new_tail
    new_tail = at(size - 2)
    new_tail.next_node = nil
    @tail = new_tail
  end

  def contains?(value)
    (0..size - 1).each do |index|
      return true if at(index).value == value
    end
    false
  end

  def find(value)
    (0..size - 1).each do |index|
      return index if at(index).value == value
    end
    nil
  end

  def insert_at(value, index)
    return 'Invalid index, out of bounds' if index >= size

    new_node = Node.new(value)
    # -1 if inserting at head, the index of the prev index otherwise.
    before = index.zero? ? -1 : at(index - 1)
    # -1 if inserting at end, the index of current index otherwise.
    after = index == size - 1 ? -1 : at(index)
    reassign_after_insert(before, after, new_node)
  end

  def reassign_after_insert(before, after, new_node)
    if before == -1
      new_node.next_node = @head
      @head = new_node
    elsif after == -1
      @tail.next_node = new_node
      @tail = new_node
    else
      before.next_node = new_node
      new_node.next_node = after
    end
  end

  def remove_at(index)
    return 'Invalid index, out of bounds' if index >= size

    # -1 if removing head. The index of the prev index otherwise.
    before = index.zero? ? -1 : at(index - 1)
    # -1 if removing tail. The index of current index otherwise.
    current = index == size - 1 ? -1 : at(index)

    reassign_after_remove(before, current)
  end

  def reassign_after_remove(before, current)
    if before == -1
      @head = @head.next_node
    elsif current == -1
      @tail = before
      @tail.next_node = nil
    else
      before.next_node = current.next_node
      p before.next_node.value
    end
  end

  def to_s
    s = ''
    return 'nil' if size.zero?

    (0..size - 1).each { |index| s += "( #{at(index).value} ) -> " }
    s += 'nil'
  end
end
