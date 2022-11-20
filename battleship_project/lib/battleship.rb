require_relative "board"
require_relative "player"

class Battleship

    def initialize (num)
        @board = Board.new(num)
        @player = Player.new
        @remaining_misses = @board.size / 2
    end

    attr_reader :board, :player

    def start_game
        @board.place_random_ships

        puts @board.num_ships

        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            puts "you lose"
            return true
        end
        return false
    end

    def win?
        if @board.num_ships == 0
            puts "you win"
            return true
        end
        return false
    end

    def game_over?
        win? || lose?
    end

    def turn 
        pos = @player.get_move
        if !@board.attack(pos)
            @remaining_misses -= 1
        end
        @board.print
        puts @remaining_misses
    end
end 
