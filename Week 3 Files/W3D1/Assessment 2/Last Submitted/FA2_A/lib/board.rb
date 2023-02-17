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
        # left_diagonal = boolean
        # (0...@grid.length).each do |i|
        #     (0...@grid.length).each do |j|
        #         if i == j
        #             @grid[i]

    end

    def winner?(mark)
        self.complete_row?(mark)
        self.complete_col?(mark)
        self.complete_diag?(mark)
        return false
    end

    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @grid.each { |row| p row }
    end
end
