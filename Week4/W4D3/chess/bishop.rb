require_relative 'slideable.rb'
require_relative 'piece.rb'

class Bishop < Piece
  include Slideable

  def move_dirs
    diaganol_dirs
  end
  
  def symbol
    '♗'
  end
  
end