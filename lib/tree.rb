require_relative 'node'
require 'pry'

# class to create binary search tree objects from arrays
class Tree
  attr_reader :root

  def initialize(input_array)
    @root = build_tree(clean_array(input_array))
  end

  def clean_array(input_array)
    input_array.sort.uniq
  end

  def build_tree(input_array, array_start = 0, array_end = input_array.length - 1)
    return nil if array_start > array_end

    array_mid = (array_start + array_end) / 2
    root = Node.new(input_array[array_mid])

    root.left = build_tree(input_array, array_start, array_mid - 1)
    root.right = build_tree(input_array, array_mid + 1, array_end)
    root
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
