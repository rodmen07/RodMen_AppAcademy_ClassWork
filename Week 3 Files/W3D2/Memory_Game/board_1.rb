require_relative 'card.rb'
require 'byebug'

class Board
    attr_reader :grid

    def initialize
        @grid = Array.new(4){Array.new(4)}
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

            i = 0
            empty = true
            while i < 8
                while !empty
                    new_card = Card.new(:A)
                    rand_row = rand(0...@grid.length)
                    rand_col = rand(0...@grid.length)
                    if @grid[rand_row][rand_col] == nil
                        @grid[rand_row][rand_col] = new_card
                        i += 1
                        empty = false
                    else
                        break
                    end
                end
            end
            i = 0
            while i < 8
                new_card = Card.new(:K)
                rand_row = rand(0...@grid.length)
                rand_col = rand(0...@grid.length)
                if @grid[rand_row][rand_col] == nil
                    @grid[rand_row][rand_col] = new_card
                    i += 1
                else
                    break
                end
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
