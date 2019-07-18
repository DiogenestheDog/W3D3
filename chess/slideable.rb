module Slideable
  def horizontal_dirs
    HORIZONTAL_DIRS
   
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves(array, pos)
    moves_array = []

    array.each do |ele|
      temp = [temp[0] + ele[0], temp[1] + ele[1]]
      while self.board[temp].color == nil and temp.all? { |pos| pos > 0 and pos < 8}
        moves_array << temp
        temp = [temp[0] + ele[0], temp[1] + ele[1]]
      end
    end
    moves_array
  end

  private
  HORIZONTAL_DIRS = [[1,0], [-1,0], [0,1], [0,-1]]
  DIAGONAL_DIRS = [[1,1], [1,-1], [-1,1], [-1,-1]]

  def move_dirs
  end

  def grow_unblocked_moves_in_dir(dx, dy)
  end
end