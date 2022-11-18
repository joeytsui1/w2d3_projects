class Board
  def self.print_grid(grid)
    grid.each do |row|
      puts row.join(" ")
    end
  end
  attr_reader :size
  def initialize (num)
    @grid = Array.new(num) {Array.new(num, :N)}
    @size = num * num 
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos,val)
    row, col = pos
    @grid[row][col] = val
  end

  def num_ships
    @grid.flatten.count {|ele| ele == :S}
  end

  def attack (pos)
    if self[pos] == :S 
      self[pos] = :H
      puts "you sunk my battleship"
      return true
    else
      self[pos] = :X 
      return false
    end
  end

  
  def place_random_ships
    max_ship = @size * 0.25

    while max_ship > self.num_ships
      row = rand(0...@grid.length)
      col = rand(0...@grid.length)

      pos = [row,col]
      self[pos] = :S
    end
  end

  def hidden_ships_grid
    arr = []
    @grid.each do |row|
      subarray = []
      row.each do |ele|
        if ele == :S
          subarray << :N 
        else
          subarray << ele
        end
      end
      arr << subarray
    end
    return arr
  end

  def cheat
    Board::print_grid(@grid)
  end

  def print
    Board::print_grid(self.hidden_ships_grid)
  end
end
