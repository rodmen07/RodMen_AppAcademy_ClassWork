require_relative 'board'
require_relative 'human_player'

class Game
    def initialize(board_size, player_1_mark, player_2_mark)
        @board = Board.new(board_size)
        @player_1 = HumanPlayer.new(player_1_mark)
        @player_2 = HumanPlayer.new(player_2_mark)
        @current_player = @player_1
    end

    attr_reader :player_1_mark, :player_2_mark

    def switch_turn
        @current_player == @player_1 ? @current_player = @player_2 : @current_player = @player_1
    end

    def play
        while @board.empty_positions?
            @board.print
            position = @current_player.get_position
            @board.place_mark(position, @current_player.mark)
            if @board.win?(@current_player.mark)
                puts 'Game_Over'
                puts @current_player.mark.to_s + " has won!"
                return
            else
                switch_turn
            end
        end
        p "the game is a draw"
    end

end
