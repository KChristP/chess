module SlidingPiece


  def moves#return an array of allowed moves

    #1 iterate in allowed direction
    #2 check the board for blocked things in that direction

    # @pos = [a,b]
    #currentposition
    row, col = @pos

    #row --> [x, y+n]
    #col --> [x+n, y]
    #diag --> [x+n, y+n]

  end

  private
  def move_dirs()
    # dirs = []
    # out << horizontal_dirs
    # out << diagonal_drs
  end

  def vertical_dirs()
    row,col = @pos

    possible_moves = []#horizontal
    (1..7).each do |i|
      next_piece_D = @board.grid[row + i][col]
      next_piece_U = @board.grid[row - i][col]
      unless next_piece_D.color != self.color || next_piece_R.nil?
        possible_moves << [row + i, col]
      end

      unless next_piece_U.color != self.color || next_piece_L.nil?
        possible_moves << [row - i, col]
      end
    end

  end

  def horizontal_dirs()
    possible_moves = []#horizontal
    (1..7).each do |i|
      next_piece_R = @board.grid[@pos[0]][pos[1] + i]
      next_piece_L = @board.grid[@pos[0]][pos[1] - i]
      unless next_piece_R.color != self.color || next_piece_R.nil?
        possible_moves << [@pos[0], pos[1] + i]
      end

      unless next_piece_L.color != self.color || next_piece_L.nil?
        possible_moves << [@pos[0], pos[1] - i]
      end
    end
  end

  def diagonal_dirs()
  end

  def grow_unblocked_moves_in_dir(dx,dy)#return array of moves in just this direction
    possible_moves = []#horizontal
    (1..7).each do |i|
      next_piece_R = @board.grid[@pos[0]][pos[1] + i]
      next_piece_L = @board.grid[@pos[0]][pos[1] - i]
      unless next_piece_R.color != self.color || next_piece_R.nil?
        possible_moves << [@pos[0], pos[1] + i]
      end

      unless next_piece_L.color != self.color || next_piece_L.nil?
        possible_moves << [@pos[0], pos[1] - i]
      end
    end

  end
end
