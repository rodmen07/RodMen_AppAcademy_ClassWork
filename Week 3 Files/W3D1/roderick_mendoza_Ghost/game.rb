require_relaive "./player.rb"

class Game
    def initialize
        @player1 = Player.new("Player 1")
        @player2 = Player.new("Player 2")
        @fragment = ''
    end

    def play_round
    end

    def current_player
    end

    def previous_player
    end

    def next_player!
    end

    def take_turn(player)
    end

    def valid_play?(string)
    end

    def losses
    end

    def record
    end

    def run
    end

end
