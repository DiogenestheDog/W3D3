require_relative "piece.rb"

class Board

  attr_reader :rows

  def initialize
    @sentinel = "null_piece"
    @rows = Array.new(8) { Array.new(8, NullPiece)}

    @rows[0].map!.with_index do |space, i|
      case i
      when 0
        Rook.new("white", self, [i, 0])
      when 1
        Knight.new("white", self, [i,0])
      when 2
        Bishop.new("white", self, [i, 0])
      when 3
        King.new("white", self, [i,0])
      when 4
        Queen.new("white", self, [i, 0])
      when 5
        Bishop.new("white", self, [i,0])
      when 6
        Knight.new("white", self, [i, 0])
      when 7
        Rook.new("white", self, [i,0])
      end
    end

    @rows[1].map!.with_index { |space, i| Pawn.new("white", self, [i, 1])}
    @rows[6].map!.with_index { |space, i| Pawn.new("black", self, [i, 6])}

    @rows[7].map!.with_index do |space, i|
      case i
      when 0
        Rook.new("black", self, [i, 7])
      when 1
        Knight.new("black", self, [i,7])
      when 2
        Bishop.new("black", self, [i, 7])
      when 3
        Queen.new("black", self, [i,7])
      when 4
        King.new("black", self, [i, 7])
      when 5
        Bishop.new("black", self, [i,7])
      when 6
        Knight.new("black", self, [i, 7])
      when 7
        Rook.new("black", self, [i,7])
      end
    end

  end

  def move_piece(color, start_pos, end_pos)
    
    if start_pos == NullPiece 
      raise "no piece"
    end
    if end_pos == nil
      raise "no space to move"
    end 
    
    self.rows[end_pos] = self.rows[start_pos]

  end

  def [](pos)
    row, col = pos
    self.rows[row][col]
  end

  def []=(pos, piece)
    self.rows[pos] = piece
  end
end