require 'byebug'
class PolyTreeNode
    def initialize(value)
        @value = value
        @children = []
        @parent = nil
    end

    def parent=(parent_node)
        return if self.parent == parent_node
        if self.parent
            self.parent.children.delete(self)
        end

        @parent = parent_node
        self.parent.children << self if !self.parent.nil?
        self
    end
    
    def remove_child(child_node)
        if !self.children.include?(child_node)
            raise 'Tried to remove child that isnt there'
        end
        child_node.parent = nil
    end
    
    def add_child(child_node)
        child_node.parent = self
    end
    
    attr_reader :parent, :children, :value


    def dfs(target_value)
        return self if self.value == target_value
        self.children.each do |child|
            result = child.dfs(target_value)
            return result if result != nil
        end
        nil
    end

    def bfs(target_value)
        
        # return self if self.value == target_value
        queue = [self]
        until queue.empty?
            # debugger
            current_node = queue.shift
            if current_node.value == target_value
                return current_node
            else
                current_node.children.each {|child| queue.push(child)}
                # queue += current_node.children
            end
        end
        
        nil
    end

end