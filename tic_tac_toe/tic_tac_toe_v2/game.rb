require_relative "board"
require_relative "human_player"

class Game
    def initialize (num, *mark_values)
        @players = []
        mark_values.each do |mark_value|
            @players << HumanPlayer.new(mark_value)
        end
        @current_player = @players[0]
        @board = Board.new(num)
    end

    def switch_turn
        @players.each_with_index do |player, i|
            @current_player = @players[(@players.index(@current_player) + 1) % @players.length]
            return @current_player
        end
    end

    def play
        while @board.empty_position?
            @board.print

            pos = @current_player.get_position

            @board.place_mark(pos, @current_player.mark)

            if @board.win?(@current_player.mark)
                return " Player #{@current_player.mark}'s Victory"
            else
                switch_turn
            end
        end
        return "draw"
    end
end