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

  end

  def horizontal_dirs()
    moves_R, moves_L, moves_U, moves_D = [],[],[],[]
    (1..7).each do |i|
      p i
      moves_R.concat(grow_unblocked_moves_in_dir(0,i)) #right
      moves_L.concat(grow_unblocked_moves_in_dir(0,-i)) #left
      moves_U.concat(grow_unblocked_moves_in_dir(-i,0)) #up
      moves_D.concat(grow_unblocked_moves_in_dir(i,0)) #down
    end
    unless moves_R.index("break").nil?
      moves_R = moves_R.take(moves_R.index("break"))
    end
    unless moves_L.index("break").nil?
      moves_L = moves_L.take(moves_L.index("break"))
    end
    unless moves_U.index("break").nil?
      moves_U = moves_U.take(moves_U.index("break"))
    end
    unless moves_D.index("break").nil?
      moves_D = moves_D.take(moves_D.index("break"))
    end
    moves_R.concat(moves_L).concat(moves_U).concat(moves_D)

    p moves_R
  end

  def diagonal_dirs()
    moves = []
    (1..7).each do |i|

      moves.concat(grow_unblocked_moves_in_dir(i,i))
      # moves = moves.take(moves.index("break"))
      moves.concat(grow_unblocked_moves_in_dir(i,-i))
      # moves = moves.take(moves.index("break"))
    end
    moves
  end

  def grow_unblocked_moves_in_dir(drow,dcol)#return array of moves in just this direction (L,R,U,D)
    possible_moves = []
      # p @pos[0] + drow if @board.grid[@pos[0] + drow].nil?

      pRow, pCol = [@pos[0] + drow , @pos[1] + dcol]
      nRow, nCol = @pos[0] - drow , @pos[1] - dcol

      # byebug
      p_check = [pRow, pCol].all? {|n| n.between?(0,7)}


      next_piece = @board.grid[@pos[0] + drow][@pos[1] + dcol] if p_check
      # next_piece_negative = @board.grid[@pos[0] - drow][@pos[1] - dcol] if n_check


      # p "#{pRow} #{pCol} #{nRow} #{nCol}" if next_piece.nil? || next_piece_negative.nil?
      unless !p_check || next_piece.color == self.color
        possible_moves << [@pos[0] + drow , @pos[1] + dcol]
      # elsif !p_check
      else
        possible_moves << "break"
      end


      # unless  !n_check || next_piece_negative.color == self.color
      #   possible_moves << [@pos[0] - drow , @pos[1] - dcol]
      # else
      #   possible_moves << "break"
      # end


    possible_moves.uniq
  end
end
