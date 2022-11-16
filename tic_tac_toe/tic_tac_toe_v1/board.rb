class Board
    def initialize
        @grid = Array.new(3) {Array.new(3, "_")}
    end

    def valid?(pos) #pos = [1,2] 
        row = pos[0]
        col = pos[1]
        @grid[row] != nil && @grid[pos[0]][pos[1]] != nil && (row >= 0 && col >= 0)
    end

    def empty?(pos) # pos[1,0]
        @grid[pos[0]][pos[1]] == "_"

        #grid[1][0]
    end

    def place_mark (pos, mark)

        if valid?(pos) && empty?(pos)
            @grid[pos[0]][pos[1]] = mark
        else
            raise "wrong input"
        end
    end

    def print
        @grid.each do |row|
            puts row.join(" ")
        end
    end

    def win_row? (mark)
        @grid.each do |row|
            return true if row.all? {|ele| ele == mark}
        end
        return false
    end

    def win_col?(mark)
        @grid.transpose.each do |col|
            return true if col.all? {|ele| ele == mark}
        end
        return false
    end

    def win_diagonal?(mark)
        left_D = []
        right_D = []

        @grid.each_with_index do |row, i|
            @grid[i].each_with_index do |col, j|
                left_D = (0..@grid[1].length-1).map {|i| @grid[i][i]}
                right_D = (0..@grid[1].length-1).map {|i| @grid[i][-i-1]}
            end
        end

        if left_D.all? {|ele| ele == mark} || right_D.all? {|ele| ele == mark}
            return true
        end
        return false
    end

    def win? (mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_position?
        @grid.each_with_index do |row, i|
            @grid[i].each_with_index do |col, j|
                if @grid[i][j] == "_"
                    return true
                end
            end
        end
        return false
    end
end