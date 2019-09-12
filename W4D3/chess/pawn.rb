require_relative 'piece.rb'

class Pawn < Piece
  def move_dirs
    [[1, 0], [-1, 0]]
  end

  def at_start_row?
    #if self.board.field
  end

  def symbol
    '♙'
  end

end