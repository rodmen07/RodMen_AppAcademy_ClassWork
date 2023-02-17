class Player
    def get_move
        puts "enter a position with coordinates separated with a space like '4 7'"
        user_move = gets.chomp
        arr = user_move.split(" ")
        arr.map! {|ele| ele.to_i}
    end
end
