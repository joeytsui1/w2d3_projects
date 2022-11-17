class Board
    def self.print_grid(grid)
        grid.each do |row|
            puts row.join(" ")
        end
    end

    attr_reader :size
  def initialize (n)
    @grid = Array.new(n) {Array.new(n, :N)}
    @size = n * n
  end

  def [](pos) #[pos]
    row, col = pos
    return @grid[row][col]
  end

  def []=(pos, val) #[pos] = value
    row, col = pos
    @grid[row][col] = val
  end

  def num_ships
    # count = 0
    # @grid.each_with_index do |ele1, i|
    #     @grid[i].each_with_index do |ele2, j|
    #         if @grid[i][j] == :S
    #             count += 1
    #         end
    #     end
    # end
    # return count
    @grid.flatten.count {|ele| ele == :S}
  end

  def attack (pos)
    if self[pos] == :S
        self[pos] = :H
        puts "you sunk my battleship!"
        return true
    else
        self[pos] = :X
        return false
    end
  end

  def place_random_ships
    num_of_ships = @size * 0.25
    
    while num_of_ships > self.num_ships
        row = rand(0...@grid.length)
        col = rand(0...@grid.length)
        pos = [row, col]
        self[pos] = :S
    end
  end

  def hidden_ships_grid
    new_arr = []

    @grid.each do |row|
        inner_arr = []
        row.each do |ele|
            if ele == :S 
                inner_arr << :N
            else
                inner_arr << ele
            end
        end
        new_arr << inner_arr
    end
    return new_arr
  end

  def cheat
    Board::print_grid(@grid)
  end

  def print
    Board::print_grid(self.hidden_ships_grid)
  end
end
