module Stepable
  def moves(pos)
    possible_moves = []
    
    move_diffs.each do |diff|
      possible_moves.concat(pos[0] + diff[0], pos[1] + diff[1])
    end
    possible_moves
  end

  private 
  def move_diffs
  end
end