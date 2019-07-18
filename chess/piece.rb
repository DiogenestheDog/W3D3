require_relative "slideable.rb"
require_relative "stepable.rb"
require "singleton"

class Piece
  include Stepable
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def to_s
    
  end

  def empty?
    return false
  end

  def valid_moves
    # moves(self.pos).select { |pos| board.valid_pos?(pos) } #????
  end
    
  def pos=(val)
    @pos = val
  end

  def symbol
  end

  private
  def move_into_check?(end_pos)
  end

  def inspect
    p "#< #{self.class} : #{self.color} >"
  end
end

class Knight < Piece
  include Stepable
   
  def move_diffs
    [[1,-2], [1,2], [-1,2], [-1,-2], [2,1], [2,-1], [-2,1], [-2,-1]]
  end
end

class King < Piece
  include Stepable
  def move_diffs
    [[1,-1], [1,1], [-1,1], [-1,-1], [0,1], [0,-1], [1,0], [-1,0]]
  end
end

class Rook < Piece
  include Slideable
  def move_dirs
    self.horizontal_dirs
  end
end

class Bishop < Piece
  include Slideable
  def move_dirs
    self.diagonal_dirs
  end
end

class Queen < Piece
  include Slideable
  def move_dirs
    self.diagonal_dirs.concat(self.horizontal_dirs)
  end
end

class Pawn < Piece
  def symbol
  end

  def move
    # [[0,1],[0,-1]]
    pawn_moves = []
    pawn_moves.concat(forward_steps, side_attacks)
  end 

  private
  def at_start_row?
    if self.color == "black" and self.pos[1] == 6
      true
    elsif self.color == "white" and self.pos[1] == 1
      true
    else
      false
    end 
  end

  def forward_steps
    foward_steps = []
    if at_start_row?
      forward_steps << [self.pos[0], self.pos[1] + forward_dir]
      forward_steps << [self.pos[0], (self.pos[1] + forward_dir * 2)]
    else
      forward_steps << [self.pos[0], self.pos[1] + forward_dir]
    end
    forward_steps
  end

  def forward_dir
    # 1 if black
    # -1 if white
  end

  def side_attacks
    side_attacks_moves = []
    right_dia_pos = self.board[ pos[0] + 1, pos[1] + forward_dir]
    left_dia_pos = self.board[ pos[0] - 1, pos[1] + forward_dir]
    # if opposite color at [1,1], [-1,1] from cur_pos
    if self.color != right_dia_pos.color
      # self.board[ pos[0] + 1, pos[1] + 1].color = self.color
      side_attacks_moves << right_dia_pos
      # right_dia_pos = self
      # self.board[self.pos] = NullPiece
      # self.pos = [ pos[0] + 1, pos[1] + forward_dir]

     # if opposite color at [1,1], [-1,1] from cur_pos
    elsif self.color != left_dia_pos.color
      # self.board[ pos[0] + 1, pos[1] + 1].color = self.color

      # left_dia_pos = self
      # self.board[self.pos] = NullPiece
      # self.pos = [ pos[0] - 1, pos[1] + forward_dir]
      side_attacks_moves << left_dia_pos
    end
  end
end

class NullPiece < Piece
  include Singleton

  def initialize
  end

  def moves
  end

  def symbol
  end

  def empty?
    true
  end
end
