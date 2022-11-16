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

    puts win_diagonal?(1)