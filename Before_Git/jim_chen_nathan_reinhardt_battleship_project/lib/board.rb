class Board
    #Part 1

    attr_reader :size

    def initialize(n)
        @grid = Array.new(n) { Array.new(n, :N) }
        @size = n * n
    end

    def [](arr)
        @grid[arr[0]][arr[1]]
    end

    def []=(arr, val)
        @grid[arr[0]][arr[1]] = val
    end

    def num_ships
        # [[:N, N],[:S,:S],[:N,:S]]
        @grid.flatten.count(:S)
    end

    #Part 2

    def attack(pos)
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
        quarter = self.size / 4
        while self.num_ships < quarter
            row = rand(0...@grid.length)
            col = rand(0...@grid.length)
            pos = [row, col]
            self[pos] = :S
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |col|
                if col == :S
                    :N
                else
                    col
                end
            end
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
        Board.print_grid(self.hidden_ships_grid)
    end
end
