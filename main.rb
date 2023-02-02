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
puts "Appending value 56 and then prepending 'hello':"
test_ll.append(56)
test_ll.prepend('hello')
puts test_ll
