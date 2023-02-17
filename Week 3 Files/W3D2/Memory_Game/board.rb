require_relative 'card.rb' 

class Board 
    attr_reader :grid

    def initialize(card_1,card_2)
        @grid = Array.new(4){Array.new(4)}
        @card_1 = Card.new(card_1)
        @card_2 = Card.new(card_2)
    end

    def [](pos) 
        row,col = pos
        @grid[row][col]
    end 

    def []=(pos,value)
        row,col = pos
        @grid[row][col] = value
    end 

    def filled?
        (0...@grid.length).each do |row|
            (0...@grid.length).each do |col|
                return false if @grid[row][col] == nil
            end
        end
        true
    end 

    def populate
        until self.filled?
            (0..1).each do |i|
                rand_row = rand(0...@grid.length)
                rand_col = rand(0...@grid.length)
                @grid[rand_row][rand_col] = @card_1
            end
            (0..1).each do |i|
                rand_row = rand(0...@grid.length)
                rand_col = rand(0...@grid.length)
                @grid[rand_row][rand_col] = @card_2
            end
        end
    end 

    def render
        newarray = Array.new(4) { Array.new(4)} 
        (0...@grid.length).each do |row|
            (0...@grid.length).each do |ele|
                if @grid[row][ele].face_up == true
                    newarray[row][ele] = @grid[row][ele].card_value
                else
                    newarray[row][ele] = ""
                end
            end
            puts newarray[row].join(" ")
        end
    end

    def won?
        (0...@grid.length).each do |row|
            (0...@grid.length).each do |ele|
                return false if @grid[row][ele].face_up == false
            end
        end
        return true
    end 


end 