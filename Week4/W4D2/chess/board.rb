require_relative "piece.rb"

class Board
  attr_accessor :field

  def initialize
    @field = Array.new(8) {Array.new(8)}
    @field[0].map! { |pos| pos = Piece.new } 
    @field[1].map! { |pos| pos = Piece.new }
    @field[-1].map! { |pos| pos = Piece.new }
    @field[-2].map! { |pos| pos = Piece.new }
  end

  def move_piece(start_pos, end_pos)
    if field[start_pos[0]][start_pos[1]] == nil
      raise 'No piece available'
    elsif field[start_pos[0]][start_pos[1]] != nil || !end_pos[0].between?(0,7) || !end_pos[1].between?(0,7)
      raise 'Cannot place piece here'
    else
      field[end_pos[0]][end_pos[1]] = 'Piece'
      field[start_pos[0]][start_pos[1]] = nil
    end
  end
end