require_relative "./00_tree_node.rb"

class Searchable

    def dfs(root, target) # node, "b"
        # Run through one side of the tree at a time
        if root.value == target
             return root.value
        else
            # call dfs recursively on the children
            # if we return a val, that's great
            # if nil, recursively call on the remaining children
        end
    end

end