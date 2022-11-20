class HumanPlayer
    def initialize (mark)
        @mark = mark
    end

    attr_accessor :mark

    def get_position
        puts "Player #{@mark}, enter two numbers representing a position in the format 'row col' "
        pos = gets.split.map(&:to_i)
        raise if pos.length != 2
        return pos
    end
end