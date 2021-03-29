require_relative 'node'
require 'pry'

# class to create binary search tree objects from arrays
class Tree
  attr_reader :root

  def initialize(input_array)
    @root = build_tree(input_array)
  end

  def build_tree(input_array)
    binding.pry
    array_start = 0
    array_end = input_array.length - 1
    array_mid = (array_start + array_end) / 2

    if !array_end.zero?
      left_subarray = input_array[0...array_mid] # empty array from array of 2
      right_subarray = input_array[array_mid + 1..array_end]
      Node.new(input_array[array_mid], build_tree(left_subarray), build_tree(right_subarray))
      # puts new_node.data
    else
      Node.new(input_array[array_mid])
      # puts new_node.data
    end
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
