module SlidingPiece


  def moves
    # @pos = [a,b]
    #currentposition
    row, col = @pos
    
    #row --> [x, y+n]
    #col --> [x+n, y]
    #diag --> [x+n, y+n]

  end

  private
  def move_dirs()
    dirs = []
    out << horizontal_dirs
    out << diagonal_drs
  end

  def horizontal_dirs()

  end

  def diagonal_dirs()
  end

  def grow_unblocked_moves_in_dir(dx,dy)
  end
end
