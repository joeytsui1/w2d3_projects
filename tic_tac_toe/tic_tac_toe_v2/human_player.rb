class HumanPlayer
    attr_accessor :mark
    def initialize (mark)
        @mark = mark
    end

    def get_position
        puts "Player #{mark}, enter two numbers representing a position in a format 'row col'"
        pos = gets.split.map(&:to_i)

        if pos.length != 2
            raise
        end
        return pos
    end
end