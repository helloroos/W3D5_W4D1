require_relative "./skeleton/00_tree_node.rb"

class KnightPathFinder # FIND SHORTEST PATH

    def self.root_node
        PolyTreeNode.new(start_pos) # [0, 0]
    end

    def self.valid_moves?(pos)
        moves 
    end

    attr_reader :start_pos

    def initialize(start_pos)
        @start_pos = start_pos
        @move_tree = [] # call move_tree (class method)
    end

end

[
    [00, ] 0
    [] 1
    [] 2
    [] 3
    [] 4
    [] 5
    [] 6
    [] 7
]

# Start at root = start_pos
# Find all valid positions that a knight can move // BFS
# From that element we create a parent element
# Then we look at every possible move from there
# KEep doing that until we exhausted every poss

# Traverse > row, col > when col == 7 > return 