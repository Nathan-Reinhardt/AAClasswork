require_relative "card"

class Board

    def initialize(size)
        if size % 2 == 0
            @size = size * size
        else
            @size = (size - 1) * (size - 1)
        end
        @grid = Array.new(@size) { Array.new(@size, 0) }
    end

    def populate
        pairs = []
        value = 0

        while pairs.length < @size / 2
            value = rand(1...@size)

            while pairs.include?(value)
                value = rand(1...@size)
            end
            
            pairs << value

            while @grid.flatten.count(value) != 2

                row = rand(0...@size)
                col = rand(0...@size)

                while @grid[row][col] != 0
                    row = rand(0...@size)
                    col = rand(0...@size)
                end
            
                @grid[row][col] = Card.new(value)
            end
        end
    end

    def render
        @grid.each do |row|
            puts row.join(" ")
        end
    end

    def won?
        @grid.flatten.all? { |card| card.face_show == true }
    end

    def reveal(guessed_pos)
        row = guessed_pos[0]
        col = guessed_pos[1]
        
        card = @grid[row][col]
        if card.face_show
            raise "card is already shown, pick a different position"
            return false
        else
            card.reveal
            return true 
        end
    end

end