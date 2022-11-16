class ComputerPlayer
    attr_accessor :mark
    def initialize (mark_value)
        @mark = mark_value
    end

    def get_position(legal_position)
        pos = legal_position.sample
        puts "Computer #{@mark} choose #{pos}"
        return pos
    end
end