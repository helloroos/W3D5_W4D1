class PolyTreeNode

    attr_reader :value, :parent, :children
    
    def initialize(value)# "[0,0]"
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

    def dfs(target) # 'a', "g" # LIFO 
        # BASE CASE
        return nil if self.value == nil
        return self if self.value == target #'g'
    
        # [c, g]
        # RECURSIVE STEPS
        self.children.each do |child| # b, c
            # prio = [child]
            search_result = child.dfs(target) # will eval to nil or target
            return search_result unless search_result == nil
        end
        nil
    end

    def bfs(target)
        queue = [self] 
        until queue.empty?
            first = queue.shift
            if first.value == target
                return first
            else
                queue += first.children
            end
        end
        nil
    end

end
