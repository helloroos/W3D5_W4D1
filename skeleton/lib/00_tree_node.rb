class PolyTreeNode

    attr_reader :value, :parent, :children
    
    def initialize(value)
        @value = value
        @parent = nil # Node1
        @children = []
    end

    def parent=(new_parent)
        parent.children.delete(self) unless @parent.nil?
        @parent = new_parent
        parent.children << self unless new_parent == nil
    end

    def add_child(child)
        child.parent = self
    end

    def remove_child(child)
        if @children.include?(child)
            child.parent = nil
        else
            raise "Error!"
        end
    end

end

