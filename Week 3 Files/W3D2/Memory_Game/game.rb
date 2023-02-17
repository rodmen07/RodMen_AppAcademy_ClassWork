require_relative 'card.rb'
require_relative 'board_1.rb' 

class Game
    attr_reader :board
    def initialize
        @board = Board.new
    end

    def play
        @board.populate
        @board.render
        i = 0
        until @board.won?
            p "Enter first guess as a position of two numbers with a space: "
            guessed_pos_1 = gets.chomp.split.map(&:to_i)
            @board[guessed_pos_1].reveal
            @board.render

            p "Enter second guess as a position of two numbers with a space: "
            guessed_pos_2 = gets.chomp.split.map(&:to_i)
            @board[guessed_pos_2].reveal
            @board.render

            if @board[guessed_pos_1].card_value  != @board[guessed_pos_2].card_value
                @board[guessed_pos_1].hide
                @board[guessed_pos_2].hide
            end
        end
    end

end
