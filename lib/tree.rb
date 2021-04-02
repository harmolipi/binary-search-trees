# frozen_string_literal: true

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

  def insert(data, node = @root)
    if node.nil?
      Node.new(data)
    else
      if node.data == data
        node
      elsif node.data < data
        node.right = insert(data, node.right)
      else
        node.left = insert(data, node.left)
      end
    node
    end
  end

  def delete(data, node = @root)
    # base case
    return nil if node.nil?

    if data < node.data
      node.left = delete(data, node.left)
    elsif data > node.data
      node.right = delete(data, node.right)
    else

      # node to delete has one child or no child
      if node.left.nil?
        return node.right
      elsif node.right.nil?
        return node.left
      end

      # node to delete has two children
      node.data = find_min(node.right).data
      node.right = delete(node.data, node.right)
    end
    node
  end

  def find(data, node = @root)
    return nil if node.nil?

    if data < node.data
      find(data, node.left)
    elsif data > node.data
      find(data, node.right)
    else
      node
    end
  end

  def find_min(node)
    current = node
    current = node.left until current.left.nil?
    current
  end

  def level_order(node = @root)
    return nil if node.nil?

    level_order_array = []
    queue = []
    current = node
    queue << current
    until queue.empty?
      current = queue[0]
      level_order_array << queue.shift.data
      queue << current.left unless current.left.nil?
      queue << current.right unless current.right.nil?
    end
    level_order_array
  end

  def inorder(node = @root)
    return nil if node.nil?

    inorder_array = []
    inorder_array << inorder(node.left) unless node.left.nil?
    inorder_array << node.data
    inorder_array << inorder(node.right) unless node.right.nil?
    inorder_array.flatten
  end

  def preorder(node = @root)
    # binding.pry
    return nil if node.nil?

    preorder_array = []
    preorder_array << node.data
    preorder_array << preorder(node.left) unless node.left.nil?
    preorder_array << preorder(node.right) unless node.right.nil?
    preorder_array.flatten
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
