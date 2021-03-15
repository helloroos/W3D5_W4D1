require_relative "../skeleton/lib/00_tree_node.rb"

class KnightPathFinder # FIND SHORTEST PATH

    MOVES = [
        [2,1],
        [1,2], 
        [2,-1], 
        [-1,2],
        [-1,-2], 
        [-2,-1], 
        [2,-1], 
        [-1,2] 
    ]

    # def self.root_node
    #     PolyTreeNode.new(start_pos) # [0, 0]
    # end

    def self.valid_moves?(pos)
        moves 
    end

    attr_reader :start_pos

    def initialize(start_pos) # [0, 0]
        @start_pos = start_pos
        @root_node = PolyTreeNode.new(start_pos)
        @move_tree = [] # call move_tree (class method)
    end

    def find_path(pos)
        path = []
        path
    end

    def inspect
        {
            root_node: @root_node,
        }.to_s
    end

end

kpf = KnightPathFinder.new([0,0])
kpf.find_path([2, 1]) # => [[0, 0], [2, 1]]
kpf.find_path([3, 3]) # => [[0, 0], [2, 1], [3, 3]]

# [
#     [0, 1, 2, 3, 4, 5, 6, 7] 0
#     [0, 1, 2, 3, 4, 5, 6, 7] 1
#     [0, 1, 2, 3, 4, 5, 6, 7] 2
#     [0, 1, 2, 3, 4, 5, 6, 7] 3
#     [0, 1, 2, 3, 4, 5, 6, 7] 4
#     [0, 1, 2, 3, 4, 5, 6, 7] 5
#     [0, 1, 2, 3, 4, 5, 6, 7] 6
#     [0, 1, 2, 3, 4, 5, 6, 7] 7
# ]


# Start at root = start_pos
# Find all valid positions that a knight can move // BFS
# From that element we create a parent element
# Then we look at every possible move from there
# KEep doing that until we exhausted every poss

# Traverse > row, col > when col == 7 > return 