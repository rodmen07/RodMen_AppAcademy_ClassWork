class Board
    def initialize(size)
        @size = size
        @grid = Array.new(size) {Array.new(size)}
    end

    attr_reader :size

    def [](pos)
        r, c = pos
        @grid[r][c]
    end

    def []=(pos, mark)
        r, c = pos
        @grid[r][c] = mark
    end

    def place_mark(pos, mark)
        self[pos] = mark
    end

    def complete_row?(mark)
        @grid.any? do |row|
            return true if row.all? { |ele| ele == mark}
        end
        false
    end

    def complete_col?(mark)
        @grid.transpose.any? do |col|
            return true if col.all? { |ele| ele == mark}
        end
        false
    end

    def complete_diag?(mark)
        left_diagonal = []
        (0...@grid.length).each do |row|
            (0...@grid.length).each do |col|
                if row == col
                    left_diagonal << @grid[row][col]
                end
            end
        end
        return true if left_diagonal.all? { |ele| ele == mark }

        right_diagonal = []
        i = 0
        while i < @grid.length
            right_diagonal << @grid[i][@grid.length - 1 - i]
            i += 1
        end
        return true if right_diagonal.all? { |ele| ele == mark }

        false
    end

    def winner?(mark)
        return true if ( self.complete_row?(mark) || self.complete_col?(mark) || self.complete_diag?(mark) )

        false
    end

    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @grid.each { |row| p row }
    end
end
