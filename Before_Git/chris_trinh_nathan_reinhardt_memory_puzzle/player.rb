class Player

    def initialize
        
    end

    def get_input
        puts "Please enter position of what card you want to reveal:  Ex. (1,1)"
        input = gets.chomp
        input = input.split(",")
        input.map(&:to_i)
    end

    def get_size
        puts "Please enter a size for the board:  Ex. 3"
        input = gets.chomp
        input.to_i
    end
end