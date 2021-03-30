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
