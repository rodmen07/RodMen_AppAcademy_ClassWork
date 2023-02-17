class Board
    def self.build_stacks(num_stacks)
        Array.new(num_stacks) { Array.new }
    end

    def initialize(num_stacks, max_height)
        @max_height = max_height
        raise "rows and cols must be >= 4" if (num_stacks < 4 || max_height < 4)
        @stacks = Board.build_stacks(num_stacks)
    end

    attr_reader :max_height

    def add(token, stack_idx)
        if @stacks[stack_idx].length < @max_height
            @stacks[stack_idx] << token
            return true
        else
            return false
        end
    end

    def vertical_winner?(token)
        @stacks.each do |stack|
            if (stack.all? { |ele| ele == token } && stack.length == @max_height)
                return true
            end
        end
        false
    end

    def horizontal_winner?(token)
        (0...@max_height).each do |col|
            column = []
            (0...@stacks.length).each do |row|
                column << @stacks[row][col]
            end
            if column.all? { |ele| ele == token }
                return true
            end
        end
        false
    end

    def winner?(token)
        vertical_winner?(token) || horizontal_winner?(token)
    end


    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end
end
