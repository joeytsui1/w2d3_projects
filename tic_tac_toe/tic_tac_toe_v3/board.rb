class Board
    def initialize (num)
        @grid = Array.new(num) {Array.new(num, "_")}
    end

    def valid?(pos)
        row = pos[0]
        col = pos[1]

        @grid[0] != nil && @grid[row][col] != nil && (row >= 0 && col >= 0)
    end

    def empty? (pos)
        @grid[pos[0]][pos[1]] == "_"
    end

    def legal_position
        legal = []
        @grid.each_with_index do |ele1, i|
            @grid[i].each_with_index do |ele2, j|
                if @grid[i][j] == "_"
                    legal.push([i, j])
                end
            end
        end
        return legal
    end

    def place_mark?(pos, mark)
        if valid?(pos) && empty?(pos)
            @grid[pos[0]][pos[1]] = mark
        else
            raise " Invalid Input"
        end
    end

    def print 
        @grid.each do |row|
            puts row.join(" ")
        end
    end

    def win_row?(mark)
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
        left_diag = []
        right_diag = []

        @grid.each_with_index do |row, i|
            left_diag = (0..@grid[i].length).map {|ele|@grid[i][i]}
            right_diag = (0..@grid[i].length).map {|ele|@grid[i][-i-1]}
        end

        if left_diag.all? {|ele| ele == mark} || right_diag.all? {|ele| ele == mark}
            return true
        end
        return false
    end

    def win?(mark)
        win_row?(mark) || win_col?(row) || win_diagonal?(mark)
    end

    def empty_posiitions?
        @grid.each_with_index do |row, i|
            @grid[i].each_with_index do |col, j|
                return true if @grid[i][j] == "_"
            end
        end
        return false
    end

end