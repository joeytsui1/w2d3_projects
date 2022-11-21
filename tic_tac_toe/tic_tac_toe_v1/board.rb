class Board
    def initialize 
        @grid = Array.new(3) {Array.new(3, "_")}
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []= (pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    def valid?(pos)
        row, col = pos

        @grid[row] != nil && self[pos] != nil && (row >= 0 && col >= 0)
    end

    def empty?(pos)
        self[pos] == "_"
    end

    def place_mark(pos, mark)
        if valid?(pos) && empty?(pos)
            self[pos] = mark
            return true
        else
            raise
        end
    end

    def print
        @grid.each do |row|
            puts row.join(" ")
        end
    end

    def win_row? (mark)
        @grid.any? {|row| row.all?{|ele| ele == mark}}
    end

    def win_col?(mark)
        @grid.transpose.any? {|col| col.all? {|ele| ele == mark}}
    end

    def win_diagonal?(mark)
        left_diag = (0...@grid.length).map {|i| @grid[i][i]}
        right_diag = (0...@grid.length).map {|i| @grid[i][-1-i]}

        left_diag.all? {|ele| ele == mark} || right_diag.all? {|ele| ele == mark} 
    end

    def win?(mark)
        win_col?(mark) || win_diagonal?(mark) || win_row?(mark)
    end

    def empty_positions?
        @grid.any? {|row| row.any? {|ele| ele == "_"}}
    end
end
