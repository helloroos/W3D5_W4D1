require_relative "./poly_tree_node.rb"

class KnightPathFinder # FIND SHORTEST PATH

    MOVES = [
        [2,1],
        [1,2], 
        [2,-1], 
        [-1,2],
        [-1,-2], 
        [-2,-1], 
        [1,-2], 
        [-2,1] 
    ]

    def self.valid_moves(pos) # [0,0] // [-2,1]
        moves = []
        MOVES.each do |move|
            row = pos[0] + move[0]
            col = pos[1] + move[1]
            new_pos = [row,col] #[2,1]
            moves << new_pos if (row > 0 && row < 7) && (col > 0 && col < 7)
        end
        moves
    end

    attr_reader :value, :considered_positions, :root_node

    def initialize(start_pos) # [0, 0]
        @value = start_pos
        @root_node = PolyTreeNode.new(value)
        @considered_positions = [value]
        build_move_tree(root_node)
    end

    def new_move_positions(pos)
        positions = KnightPathFinder.valid_moves(pos).select do |move|
            !considered_positions.include?(move)
        end
        positions.each do |position|
            @considered_positions << position
        end
        positions
    end

    def find_path(pos)
        path = []
        path
        #use dfs here once tree has been built
    end

    def build_move_tree(root_node) #BFS
        tree = [root_node]
        until tree.empty? 
        node = tree.shift
            new_move_positions(node.value).each do |pos|
               new_node = PolyTreeNode.new(pos)
               new_node.parent = node
               tree << new_node
            end 
        end
        tree
    end



    # def inspect
    #     {
    #         root_node: @root_node,
    #     }.to_s
    # end

end

# p kpf = KnightPathFinder.new([0,0])
# p kpf.find_path([2, 1]) # => [[0, 0], [2, 1]]
# p kpf.find_path([3, 3]) # => [[0, 0], [2, 1], [3, 3]]

# [
#     [0, 1, 2, 3, 4, 5, 6, 7] R0
#     [0, 1, 2, 3, 4, 5, 6, 7] R1
#     [0, 1, 2, 3, 4, 5, 6, 7] R2
#     [0, 1, 2, 3, 4, 5, 6, 7] R3
#     [0, 1, 2, 3, 4, 5, 6, 7] R4
#     [0, 1, 2, 3, 4, 5, 6, 7] R5
#     [0, 1, 2, 3, 4, 5, 6, 7] R6
#     [0, 1, 2, 3, 4, 5, 6, 7] R7
# ]col:A  B  C  D  E  F  G  H


# Start at root = start_pos
# Find all valid positions that a knight can move // BFS
# From that element we create a parent element
# Then we look at every possible move from there
# KEep doing that until we exhausted every poss

# Traverse > row, col > when col == 7 > return 