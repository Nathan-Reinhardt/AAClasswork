
class Piece
  attr_reader :pos, :board, :symbol, :color

  def initialize(pos, board, color)
    @pos = pos
    @board = board
    @color = color
  end

  def moves
    moves_arr = []
  end
end