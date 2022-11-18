class Player
    def get_move
        puts "enter a position with coordinates separated with a space like '4 7'"
        pos = gets.chomp.splits(" ").map(&:to_i)
        return pos
    end
end
