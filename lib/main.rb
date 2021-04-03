# frozen_string_literal: true

require_relative 'tree'

my_array = Array.new(15) { rand(1..100) }
puts "\nArray: #{my_array}"
my_bst = Tree.new(my_array)
puts "\nBinary search tree:"
my_bst.pretty_print
puts ''
puts my_bst.balanced? ? 'This tree is balanced!' : 'This tree is unbalanced!'
puts ''
puts '----------'

puts "\nPrinting numbers:"
puts "\nlevel order:  #{my_bst.level_order}"
puts "preorder:     #{my_bst.preorder}"
puts "postorder:    #{my_bst.postorder}"
puts "inorder:      #{my_bst.inorder}"
puts ''
puts '----------'

puts "\nAdding these numbers:"

10.times do
  n = rand(100..200)
  puts "- #{n}"
  my_bst.insert(n)
end

puts "\nNew tree:"
my_bst.pretty_print
puts ''
puts my_bst.balanced? ? 'This tree is balanced!' : 'This tree is unbalanced!'
puts ''
puts '----------'

puts "\nRebuilt tree:"
my_bst.rebalance
my_bst.pretty_print
puts ''
puts my_bst.balanced? ? 'This tree is balanced!' : 'This tree is unbalanced!'
puts ''
puts '----------'

puts "\nPrinting numbers:"
puts "\nlevel order:  #{my_bst.level_order}"
puts "preorder:     #{my_bst.preorder}"
puts "postorder:    #{my_bst.postorder}"
puts "inorder:      #{my_bst.inorder}"
puts ''
puts '----------'
