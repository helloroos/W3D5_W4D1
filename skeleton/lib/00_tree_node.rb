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
        parent.children << self unless new_parent == nil
    end

    def add_child(child)
        child.parent = self
    end

    def remove_child(child)
        if children.include?(child)
            child.parent = nil 
        else
            raise 'Error'
        end
    end

    def push(node)
    
    end

    def dfs(target) # 'a', "g"
        # Run through one side of the tree at a time
        return nil if self.value == nil
        return self.value if self.value == target #'g'
    
        self.children.each do |child|
            search_result = dfs(child, target)
            return search_result unless search_result == nil
    
        end
    
        #children array = [b [d, e], c[f,g]]
            # call dfs recursively on the children
            # if we return a val, that's great
            # if nil, recursively call on the remaining children
        nil
    end

end

