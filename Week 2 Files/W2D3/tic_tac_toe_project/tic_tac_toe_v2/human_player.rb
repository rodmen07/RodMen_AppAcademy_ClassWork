class HumanPlayer
    def initialize(mark_value)
        @mark = mark_value
    end

    attr_reader :mark

    def get_position
        puts "enter coordinates separated with a space such as '0 1'"
        user_move = gets.chomp
        arr = user_move.split(" ")
        arr.map! {|ele| ele.to_i}
        (0...arr.length).each do |coordinate|
            raise "invalid input! please enter two coordinates from the grid" if arr[i] < 0 || arr[i] > @grid.length
        end
        arr
    end

end
