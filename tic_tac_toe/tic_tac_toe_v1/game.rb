require_relative "board"
require_relative "human_player"

class Game

    attr_reader :current_player, :board
    def initialize (p1_mark, p2_mark)
        @player_1 = HumanPlayer.new(p1_mark)
        @player_2 = HumanPlayer.new(p2_mark)
        @current_player= @player_1
        @board = Board.new
    end

    def switch_player
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end
    end

    def play
        while @board.empty_positions?
            @board.print
            pos = @current_player.get_position
            @board.place_mark(pos, @current_player.mark)
            if @board.win?(@current_player.mark)
                return "you win"
            else
                switch_player
            end
        end
        return "draw"
    end
end