require_relative "board"
require_relative "player"

class Battleship
    attr_reader :board, :player
    def initialize (num)
        @board = Board.new(num)
        @player = Player.new
        @remaining_misses = @board.size / 2
    end

    def start_game
        @board.place_random_ships
        puts @board.num_ships
        @board.print
    end

    def lose?
        if @remaining_misses <= 0 
            puts "you lose"
            return true
        else
            return false
        end
    end

    def win?
        if @board.num_ships == 0
            puts "you win"
            return true
        else
            return false
        end
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
