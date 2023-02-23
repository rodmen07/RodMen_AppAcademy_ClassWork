require 'byebug'

class PolyTreeNode
    def initialize(value, children = [])
        @value = value
        @parent = nil
        @children = children
    end

    def parent=(node)
        if node == nil
            @parent = node
            return
        end
        if node.children.include?(self)
            return
        end
        if self.parent != nil
            node.children << self
            self.parent.children.delete(self)
            @parent = node
        else
            node.children << self
            @parent = node
        end
    end

    def add_child(child_node)
        child_node.parent=(self)
    end

    def remove_child(child_node)
        #Get them out of our children list
        #Get rid of their parent
        raise "Not a child" if !self.children.include?(child_node)
        self.children.delete(child_node)
        child_node.parent = nil
    end

    def inspect
        # puts @value
        # @children
        self
    end

    def dfs(target_value)
        return self if target_value == self.value

        self.children.each do |child|
            # puts child.value
            search = child.dfs(target_value)
            return search if search != nil
        end
        nil
    end

    def bfs(target_value)
        queue = []
        queue << self
        until queue.empty?
            first = queue.shift
            # puts first.value
            return first if first.value == target_value
            queue.concat(first.children)
        end
        nil
    end


    attr_reader :children, :parent, :value
end

# f = PolyTreeNode.new('F')
# e = PolyTreeNode.new('E')
# d = PolyTreeNode.new('D')
# c = PolyTreeNode.new('C', [f])
# b = PolyTreeNode.new('B', [d, e])
# a = PolyTreeNode.new('A', [b, c])

# p a.dfs('A').value
# p a.dfs('B').value
# p a.dfs('C').value
# p a.dfs('D').value
# p a.dfs('E').value
# p a.dfs('F').value

# p a.bfs('A').value
# p a.bfs('B').value
# p a.bfs('C').value
# p a.bfs('D').value
# p a.bfs('E').value
# p a.bfs('F').value
