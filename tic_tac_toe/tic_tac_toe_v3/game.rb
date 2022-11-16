require_relative "board"
require_relative "computer_player"
require_relative "human_player"
class Game 
    def initialize (num, players)
        @players = []

        players.each do |key, value|
            if value
                @players << ComputerPlayer.new(key)
            else
                @players << HumanPlayer.new(key)
            end
        end

        @current_player = @players[0]
        @board = Board.new(num)
    end

    def switch_turn
        @players.each do |player|
            if @players.include?(@current_player)
                return @current_player = @players[(@players.index(@current_player)+ 1) % @players.length]
            end
        end
    end

    def play
        while @board.empty_posiitions?
            @board.print
            pos = @current_player.get_position(@board.legal_position)
            @board.place_mark?(pos, @current_player.mark)

            if @board.win?(@current_player.mark)
                return "Player #{@current_player.mark}'s victory"
            else
                switch_turn
            end
        end
        puts "GAME OVER"
        return "DRAW"
    end
end