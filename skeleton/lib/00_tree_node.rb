class PolyTreeNode

    attr_reader :value, :parent, :children
    
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(new_parent)
        parent.children.delete(self) unless @parent.nil?
        @parent = new_parent
        parent.children << self unless parent.children.include?(self)
    end

end

# node1 = PolyTreeNode.new('root')
# node2 = PolyTreeNode.new('child1') 
# node3 = PolyTreeNode.new('child2') 

# node4 = PolyTreeNode.new('new_parent')

# node1.parent = node4

# Remove ourselves from old parent's children's_arr
# Reassign our parent
# Add ourselves to new_parent's arr

# Nil?? 

# Does node1 have a parent? 