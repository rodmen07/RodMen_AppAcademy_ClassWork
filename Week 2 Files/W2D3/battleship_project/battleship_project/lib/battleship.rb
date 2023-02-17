require_relative "board"
require_relative "player"

class Battleship
    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size / 2
    end

    attr_reader :board, :player

    def start_game
        @board.place_random_ships
        p @board.num_ships
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            p "you lose"
            return true
        elsif @remaining_misses > 0
            return false
        end
    end

    def win?
        if @board.num_ships == 0
            p "you win"
            return true
        else
            return false
        end
    end

    def game_over?
        (self.lose? || self.win?) ?  true :  false
    end

    def turn
        player_move = @player.get_move
        @remaining_misses -= 1 if !@board.attack(player_move)
        p @remaining_misses
        @board.print
    end
end
