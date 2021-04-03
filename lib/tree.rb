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

  def insert(data, node = root)
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

  def delete(data, node = root)
    # base case
    return nil if node.nil?

    if data < node.data
      node.left = delete(data, node.left)
    elsif data > node.data
      node.right = delete(data, node.right)
    else

      # node to delete has one child or no child
      return node.right if node.left.nil?
      return node.left if node.right.nil?

      # node to delete has two children
      node.data = find_min(node.right).data
      node.right = delete(node.data, node.right)
    end
    node
  end

  def find(data, node = root)
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

  def level_order(node = root)
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

  def inorder(node = root)
    return nil if node.nil?

    inorder_array = []
    inorder_array << inorder(node.left) unless node.left.nil?
    inorder_array << node.data
    inorder_array << inorder(node.right) unless node.right.nil?
    inorder_array.flatten
  end

  def preorder(node = root)
    return nil if node.nil?

    preorder_array = []
    preorder_array << node.data
    preorder_array << preorder(node.left) unless node.left.nil?
    preorder_array << preorder(node.right) unless node.right.nil?
    preorder_array.flatten
  end

  def postorder(node = root)
    return nil if node.nil?

    postorder_array = []
    postorder_array << postorder(node.left) unless node.left.nil?
    postorder_array << postorder(node.right) unless node.right.nil?
    postorder_array << node.data
    postorder_array.flatten
  end

  def height(node = root)
    return -1 if node.nil?

    height = 0
    left_height = height(node.left)
    right_height = height(node.right)
    height += [left_height, right_height].max
    height + 1
  end

  def depth(node = root, current_node = root, node_depth = 0)
    return 0 if current_node.nil? || node.nil?

    return node_depth if current_node == node

    left_depth = depth(node, current_node.left, node_depth + 1)
    right_depth = depth(node, current_node.right, node_depth + 1)

    left_depth.zero? ? right_depth : left_depth
  end

  def balanced?(node = root)
    diff = height(node.left) - height(node.right)
    diff >= -1 && diff <= 1
  end

  def rebalance(node = root)
    initialize(inorder(node))
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
