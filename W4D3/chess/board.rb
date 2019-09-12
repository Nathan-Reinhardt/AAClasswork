require_relative "pawn.rb"
require_relative "bishop.rb"
require_relative "king.rb"
require_relative "knight.rb"
require_relative "queen.rb"
require_relative "rook.rb"
require_relative "nullpiece.rb"


class Board
  attr_accessor :field

  def initialize
    @field = Array.new(8) {Array.new(8)}
    
    (0...self.field[1].length).each do |i|
      self.field[1][i] = Pawn.new([1,i], self.field, :b)
    end

    (0...self.field[6].length).each do |i|
      self.field[6][i] = Pawn.new([6,i], self.field, :w)
    end

    self.field[0][3] = King.new([0,3], self.field, :b)
    self.field[7][4] = King.new([7,4], self.field, :w)

    self.field[0][4] = Queen.new([0,4], self.field, :b)
    self.field[7][3] = Queen.new([7,3], self.field, :w)

    self.field[0][1] = Knight.new([0,1], self.field, :b)
    self.field[0][6] = Knight.new([0,6], self.field, :b)
    self.field[7][1] = Knight.new([7,1], self.field, :w)
    self.field[7][6] = Knight.new([7,6], self.field, :w) 

    self.field[0][0] = Rook.new([0,0], self.field, :b)
    self.field[0][7] = Rook.new([0,7], self.field, :b)
    self.field[7][0] = Rook.new([7,0], self.field, :w)
    self.field[7][7] = Rook.new([7,7], self.field, :w)

    self.field[0][2] = Bishop.new([0,2], self.field, :b)
    self.field[0][5] = Bishop.new([0,5], self.field, :b)
    self.field[7][2] = Bishop.new([7,2], self.field, :w)
    self.field[7][5] = Bishop.new([7,5], self.field, :w)

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

b = Board.new

rook_arr = b.field[0][0].moves
p rook_arr
puts
bishop_arr = b.field[0][2].moves
p bishop_arr
puts
queen_arr = b.field[0][4].moves
p queen_arr
