class ComputerPlayer
    def initialize (mark_value)
        @mark = mark_value
    end

    def is_computer
        return true
    end
    def get_position(legal_position)
        pos = legal_position.sample
        return pos
    end
end