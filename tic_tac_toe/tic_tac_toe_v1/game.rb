require_relative "board"
require_relative "human_player"

class Game
    def initialize (player1, player2)
        @player1 = HumanPlayer.new(player1)
        @player2 = HumanPlayer.new(player2)
        @current_player = @player1
        @board = Board.new

    end

    def switch_turn 
        if @current_player == @player1
            @current_player = @player2
        else
            @current_player = @player1
        end
    end

    def play
        while
            @board.print
            pos = @current_player.get_position
            @board.place_mark(pos, @current_player.mark)
            if @board.win?(@current_player.mark)
                puts "victory"
                return
            else
                switch_turn
            end
        end
        puts "draw"
        return 
    end
end