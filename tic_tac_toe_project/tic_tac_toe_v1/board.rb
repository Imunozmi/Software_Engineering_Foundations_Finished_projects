
class Board

    attr_reader :grid

    def initialize(grid_size)
        @grid = (0...grid_size).map { |row| (0...grid_size).map { |cel| "_" } }
        @size = grid_size
    end

    def valid?(pos)
        pos.all? { |cord| cord >= 0 && cord < @size }
    end

    def empty?(pos)
        @grid[pos[0]][pos[1]] == "_"
    end

    def place_mark(pos, mark)
        if self.valid?(pos) && self.empty?(pos) && (mark == :X || mark == :O) 
            @grid[pos[0]][pos[1]] = mark 
        else
            raise "Invalid Mark"
        end
    end

    def print
        @grid.each { |row| p row.join(" | ") }
    end

    def win_row?(mark)
        @grid.any? { |row| row.all? { |space| space == mark } }
    end

    def win_col?(mark)
        (0...@size).any? { |i| (0...@size).all? { |j| @grid[j][i] == mark } }
    end

    def win_diagonal?(mark)
        (0...@size).all? { |i| @grid[i][i] == mark } || (0...@size).all? { |i| @grid[i][-i-1] == mark }
    end

    def win?(mark)
        win_col?(mark) || win_row?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.any? { |row| row.any? { |space| space == "_" } }
    end
end