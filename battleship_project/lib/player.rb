class Player
    def get_move
        puts "enter a position with a coordinate separated with a space like '4 7'"
        pos = gets.chomp.split(" ").map(&:to_i)
        return pos
    end
end
