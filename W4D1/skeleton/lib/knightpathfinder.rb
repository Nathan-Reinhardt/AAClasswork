require_relative '00_tree_node.rb'
require "byebug"

class KnightPathFinder
  attr_accessor :start_pos, :considered_positions, :root_node
  NEXT_MOVES = [
    [2,1],
    [2,-1],
    [1,-2],
    [1,2],
    [-1,2],
    [-1,-2],
    [-2,1],
    [-2,-1]
  ]
  def initialize(array)
    @start_pos = array
    @considered_positions = [array]
    @root_node = PolyTreeNode.new(@start_pos)
  end

  def self.valid_moves(pos)
    @new_moves = []
    NEXT_MOVES.each do |move|
      potential_move = []
      x = move[0] + pos[0]
      y = move[1] + pos[1]
      if (x >= 0 && x < 8) && (y >= 0 && y < 8)
        potential_move << x
        potential_move << y
      end
        @new_moves << potential_move if !potential_move.empty?
    end
    @new_moves
  end

  def new_move_positions(pos)
    moves = KnightPathFinder.valid_moves(pos)
    moves.reject! {|move| @considered_positions.include?(move)}
    @considered_positions += moves
    moves
  end

  def build_move_tree
    queue = [root_node]
    until queue.empty?
      current_node = queue.shift
      new_move_positions(current_node.value).each do |move|
        child_node = PolyTreeNode.new(move)
        current_node.add_child(child_node)
        queue << child_node
      end
    end
    root_node
  end

  def find_path(end_pos)
    leaf_node = root_node.bfs(end_pos)
    trace_path_back(leaf_node)
  end

  def trace_path_back(node)
    array = [node.value]
    current_parent = node.parent
    until current_parent.nil?
      array.unshift(current_parent.value)
      current_parent = current_parent.parent
    end
    array
  end

end
# a = KnightPathFinder.new([0,0])
# a.build_move_tree
# a.find_path([])
# load 'knightpathfinder.rb'