class GuessingGame
    def initialize(min, max)
        @min = min
        @max = max
        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over = false
    end

    attr_accessor :num_attempts
    attr_reader :game_over

    def game_over?
        @game_over
    end

    def check_num(num)
        @num_attempts += 1
        if num == @secret_num
            @game_over = true
            p "you win"
        elsif num > @secret_num
            p "too big"
        else
            p "too small"
        end
    end

    def ask_user()
        p "enter a number"
        guess = gets.chomp.to_i
        check_num(guess)
    end

end
