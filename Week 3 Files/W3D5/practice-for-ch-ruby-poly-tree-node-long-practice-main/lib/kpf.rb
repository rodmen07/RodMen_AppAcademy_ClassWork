require_relative 'tree_node.rb'
require 'byebug'

class KnightPathFinder
    def initialize(start_pos)
        @start_pos = start_pos
        @root_node = PolyTreeNode.new(start_pos)
        @considered_positions = Hash.new { |h, k| h[k] = false }
        @considered_positions[start_pos] = true
        @tree = self.build_move_tree
    end

    attr_reader :start_pos, :root_node, :considered_positions

    def self.valid_moves(pos)
        row, col = pos
        # row +- 2, col +- 1; row +- 1, col +- 2  (8 possible moves)
        moves = []
        row_moves = [-2, -1, 1, 2]
        col_moves = [-2, -1, 1, 2]
        row_moves.each do |ele_1|
            col_moves.each do |ele_2|
                moves << [ele_1+row, ele_2+col] if (ele_1.abs  + ele_2.abs  == 3) && (ele_1 + row) >= 0 && (ele_1 + row) <=7 && (ele_2 + col) >= 0 && (ele_2 + col) <= 7
            end
        end
        moves
    end

    def new_move_positions(pos)
        moves = KnightPathFinder.valid_moves(pos)
        new_moves = []
        if moves == nil
            return []
        end
        moves.each do |move|
            if @considered_positions[move] == false
                new_moves << move
                @considered_positions[move] = true
            end
        end
        new_moves
    end

    def build_move_tree
        queue = [@root_node]
        until queue.empty?
            first = queue.shift
            new_move_positions(first.value).each do |pos|
                new_node = PolyTreeNode.new(pos)
                queue << new_node
                # p 'row:' + new_node.value[0].to_s + 'col: ' + new_node.value[1].to_s
                new_node.parent = first
            end
        end
        true
    end

    def find_path(end_pos)
        end_node = root_node.bfs(end_pos)
        trace_path_back(end_node)
    end
    
    def trace_path_back(node)
        array_pos = []
        current_node = node
        while current_node != root_node
            array_pos.unshift(current_node.value)
            current_node = current_node.parent 
            if current_node == root_node
                array_pos.unshift(current_node.value)
            end
        end
        array_pos
    end




end
