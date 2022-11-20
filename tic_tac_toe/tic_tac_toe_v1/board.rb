class Board
    def initialize 
        @grid = Array.new(3) {Array.new(3, "_")}
    
    end

    def [](pos)
        row, col = pos
        @grid[row][col] 
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    def valid?(pos)
        row, col = pos

        self[pos] != nil && (row >= 0 && col >= 0)
    end

    def empty?(pos)
        self[pos] == "_"
    end

    def place_mark (pos, mark)
        if valid?(pos) && empty?(pos)
            self[pos] = mark
        else
            raise 
        end
    end

    def print
        @grid.each do |row|
            puts row.join(" ")
        end
    end

    def win_row?(mark)
        @grid.any? do |row|
            row.all? {|ele| ele == mark}
        end
    end

    def win_col?(mark)
        @grid.transpose.any? do |row|
            row.all? {|ele| ele == mark}
        end
    end

    def win_diagonal?(mark)
        left_diag = []
        right_diag = []

        @grid.each_with_index do |ele1 , i|
            @grid[i].each_with_index do |ele2, j|
                left_diag = (0...@grid.length).map {|i| @grid[i][i]}
                right_diag = (0...@grid.length).map {|i| @grid[i][-1-i]}
            end
        end

        if left_diag.all?{|ele| ele == mark} || right_diag.all?{|ele| ele == mark} 
            return true
        end
        return false
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.each do |row|
            row.each do |ele|
                if ele == "_"
                    return true
                end
            end
        end
        return false
    end
end