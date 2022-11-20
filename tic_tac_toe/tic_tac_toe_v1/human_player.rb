class HumanPlayer
    attr_reader :mark
    def initialize(mark)
        @mark = mark
    end

    def get_position
        puts "#{@mark} Enter your position such as '2 0'"
        pos = gets.chomp.split.map(&:to_i)
        raise if pos.length != 2
        return pos
    end
end