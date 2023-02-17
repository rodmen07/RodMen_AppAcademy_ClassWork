class Board
    def initialize(n)
        @grid = Array.new(n, :N) { Array.new(n, :N)}
        @size = n * n
    end

    attr_reader :n, :size

    def [](coordinates)
        row = coordinates[0]
        column = coordinates[1]
        @grid[row][column]
    end

    def []=(position, value)
        row = position[0]
        column = position[1]
        @grid[row][column] = value
    end

    def num_ships
        count = 0
        @grid.each.with_index do |row, i|
            @grid.each.with_index do |column, j|
                count += 1 if @grid[i][j] == :S
            end
        end
        count
    end

    def attack(position)
        row = position[0]
        column = position[1]
        if self[position] == :S
            self[position] = :H
            p "you sunk my battleship!"
            return true
        else
            self[position] = :X
            return false
        end
    end

    def place_random_ships
        num_ships = @size / 4
        until num_ships == 0
            i = rand(0...@grid.length)
            j = rand(0...@grid.length)
            if @grid[i][j] != :S
                @grid[i][j] = :S
                num_ships -= 1
            end
        end
    end

    def hidden_ships_grid
        n = @grid.length
        secret_grid = Array.new(n, :N) { Array.new(n, :N)}
        @grid.each.with_index do |row, i|
            @grid.each.with_index do |column, j|
                if (@grid[i][j] == :S || @grid[i][j] == :N)
                    secret_grid[i][j] = :N
                else
                    secret_grid[i][j] = @grid[i][j]
                end
            end
        end
        secret_grid
    end

    def self.print_grid(grid)
        grid.each { |row| puts row.join(" ")}
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end

    

end
