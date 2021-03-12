class PolyTreeNode

    attr_reader :value, :parent, :children
    
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        node.children.delete(self) unless node.parent.nil?
        @parent = node
        @parent.children << self unless parent.children.include?(self)
    end

end

# node1 = PolyTreeNode.new('root')

