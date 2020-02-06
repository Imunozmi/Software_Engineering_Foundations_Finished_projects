class Board
    attr_reader :size

    def initialize (n)
        @grid = Array.new(n).map { Array.new( n, :N ) }
        @size = (n * n)
        @n = n
    end
  
    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    def []=(pos, val)
        @grid[pos[0]][pos[1]] = val
    end

    def num_ships
        @grid.flatten.count(:S)
    end

    def attack(pos)
        if self[pos] == :S 
            self[pos] = :H
            puts "you sunk my battleship!"
            true
        else
            self[pos] = :X
            false
        end
    end

    def place_random_ships
        ships = size / 4

        while ships > 0
            pos = [rand(@n-1), rand(@n-1)]
            if self[pos] == :N
                self[pos] = :S
                ships -= 1
            end
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map { |space| space == :S ? :N : space }
        end
    end

    def self.print_grid(grid)
        grid.each do |row|
            puts row.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end

end
