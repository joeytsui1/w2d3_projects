class HumanPlayer
    attr_accessor :mark
    def initialize (mark_value)
        @mark = mark_value
    end

    def get_position(legal_position)
        puts "Player #{@mark}, enter two numbers representing a position in the format 'row col'"
        pos = gets.split.map(&:to_i)

        if legal_position.include?(pos)
            return pos
        else
            puts "Invalid input, try again"
            get_position(legal_position)
        end
    end
end