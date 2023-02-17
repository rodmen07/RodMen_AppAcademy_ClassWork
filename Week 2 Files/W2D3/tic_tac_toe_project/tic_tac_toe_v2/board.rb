class Board
    def initialize(n)
        @grid = Array.new(n) { Array.new(n, '_') }
    end

    

    def [](position)
        row, column = position
        @grid[row][column]
    end

    def []=(position, value)
        row, column = position
        @grid[row][column] = value
    end

    def valid?(position)
        position.all? { |i| i >= 0 && i < @grid.length }
    end

    def empty?(position)
        self[position] == "_" ? true : false
    end

    def place_mark(position, mark)
        if valid?(position) && empty?(position)
            self[position] = mark
        else
            raise "Invalid position provided!"
        end
    end

    def print
        @grid.each { |row| puts row.join(" ")}
    end

    def win_row?(mark)
        @grid.any? { |row| row == [mark, mark, mark] }
    end

    def win_column?(mark)
        @grid.transpose.any? { |column| column == [mark, mark, mark] }
    end

    def win_diagonal?(mark)
        left_to_right = (0...@grid.length).all? do |i|
            position = [i,i]
            self[position] == mark
        end
        right_to_left = (0...@grid.length).all? do |i|
            position = [i, @grid.length - 1 -i]
            self[position] == mark
        end
        left_to_right || right_to_left
    end

    def win?(mark)
        win_row?(mark) || win_column?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        (0...@grid.length).each do |row|
            (0...@grid.length).each do |column|
                position = [row, column]
                return true if self[position] == '_'
            end
        end
        false
    end
end
