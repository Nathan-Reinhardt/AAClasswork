require_relative 'slideable.rb'
require_relative 'piece.rb'

class Queen < Piece
  include Slideable

  def move_dirs
    h_d = horizontal_dirs 
    d_d = diaganol_dirs
    h_d += d_d
  end

  def symbol
    '♕'
  end
end