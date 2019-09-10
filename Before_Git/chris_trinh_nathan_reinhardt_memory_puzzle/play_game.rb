require_relative "game"
require_relative "board"
require_relative "player"
## player inputs size of game

player_1 = Player.new
input = player_1.get_size

game = Game.new( Board.new(input) )
game.play