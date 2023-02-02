# frozen-string-literal: true

require_relative 'lib/node'
require_relative 'lib/linked_list'

# Testing initialization of node
puts 'Creating a node. Here is its representation after initalization:'
test_node = Node.new
p test_node
puts 'Assigning a value and printing it:'
test_node.value = 'hi'
puts test_node.value

# Testing initialization of LinkedList
puts "\nCreating a LinkedList. Here is its representation after initalization:"
test_ll = LinkedList.new
puts test_ll

# Test #append and #prepend
puts "\nAppending value 56 and then prepending 'hello':"
test_ll.append(56)
test_ll.prepend('hello')
puts test_ll

# Test #size, #head, and #tail
puts "\nThe size of the LinkedList is #{test_ll.size}."
puts "The head is #{test_ll.head.value}"
puts "The tail is #{test_ll.tail.value}"

# Test at(index)
puts "\nAdding more elements and testing at with a random number..."
test_ll.append(69)
test_ll.append('pop_me')
test_ll.prepend('o/')
test_ll.prepend([0, 1, 3])
random_index = rand(test_ll.size)
puts test_ll
puts "The value at index #{random_index} is #{test_ll.at(random_index).value}."

# Test pop
puts "\nPopping an element and printing the result..."
puts "We have popped #{test_ll.pop.value} and the LinkedList is now:"
puts test_ll

# Test contains? and find
puts "\nWe will test contains? and find by checking for values 'o/' and 'pop_me'."
puts "contains?('o/'): #{test_ll.contains?('o/')}"
puts "contains?('pop_me'): #{test_ll.contains?('pop_me')}"
puts "find('o/'): #{test_ll.find('o/')}"
puts "find('pop_me'): #{test_ll.find('pop_me')}"

# Test insert_at() with edge cases (0 and last index) along with middle
puts "\nTesting insert_at with edge cases included."
puts "Inserting 'beginning' at index 0:"
test_ll.insert_at('beginning', 0)
puts test_ll
puts "Inserting 'end' at last index:"
test_ll.insert_at('end', test_ll.size - 1)
puts test_ll
puts "Inserting 'middle' at a middle index:"
test_ll.insert_at('middle', test_ll.size/2)
puts test_ll

puts "\nTesting complete."
