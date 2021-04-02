# frozen_string_literal: true

require_relative 'tree'

new_tree = Tree.new([1, 2, 5, 4, 4, 100, 4, 3, 6, 7, 12, 1, 17, 8, 9, 10])
new_tree.pretty_print
new_tree.insert(29)
new_tree.pretty_print
new_tree.delete(1)
new_tree.pretty_print
new_tree.delete(10)
new_tree.pretty_print
p new_tree.level_order
puts new_tree.find(100)
p new_tree.preorder
p new_tree.inorder
p new_tree.postorder
p new_tree.height(new_tree.find(12))
p new_tree.depth(new_tree.find(100))
new_tree.insert(101)
new_tree.insert(145)
new_tree.insert(170)
new_tree.insert(160)
new_tree.pretty_print
p new_tree.balanced?
new_tree.rebalance
new_tree.pretty_print
p new_tree.balanced?
