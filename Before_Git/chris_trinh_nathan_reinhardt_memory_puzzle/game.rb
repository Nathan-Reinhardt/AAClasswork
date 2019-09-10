require_relative "card"
require_relative "board"
require_relative "player"

class Game

    def initialize(board)
        @board = board.populate
        @guessed_pos = []
        @previous_guess = []
        @player = Player.new
    end

    def play
        until @board.won?
            @board.render
            @guessed_pos = @player.get_input
            
            if @board.reveal(@guessed_pos)
                if @previous_guess == []
                    @previous_guess = @guessed_pos
                else
                    card_1 = @board[@previous_guess]
                    card_2 = @board[@guessed_pos]

                    if card_1.!=(card_2)
                        puts "They do not match..\n "
                        @board.render
                        sleep(3)
                        card_1.hide
                        card_2.hide
                    else
                        puts "They matched!"
                    end
                    @previous_guess = []
                    system("clear")
                end
            end
        end
    end

end