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
    moves = []
    (1..7).each do |i|
      moves.concat(grow_unblocked_moves_in_dir(0,i)) #horizontal
      moves.concat(grow_unblocked_moves_in_dir(i,0)) #vertical
    end

    moves
  end

  def diagonal_dirs()
    moves = []
    (1..7).each do |i|
      moves.concat(grow_unblocked_moves_in_dir(i,i))
      moves.concat(grow_unblocked_moves_in_dir(i,-i))
    end
    moves
  end

  def grow_unblocked_moves_in_dir(drow,dcol)#return array of moves in just this direction
    possible_moves = []#horizontal
      # p @pos[0] + drow if @board.grid[@pos[0] + drow].nil?
      pRow, pCol = [@pos[0] + drow , @pos[1] + dcol]
      nRow, nCol = @pos[0] - drow , @pos[1] - dcol
      n_check = [nRow, nCol].all? {|n| n.between?(0,7)}
      p_check = [pRow, pCol].all? {|n| n.between?(0,7)}


      next_piece_positive = @board.grid[@pos[0] + drow][@pos[1] + dcol] if p_check
      next_piece_negative = @board.grid[@pos[0] - drow][@pos[1] - dcol] if n_check


      # p "#{pRow} #{pCol} #{nRow} #{nCol}" if next_piece_positive.nil? || next_piece_negative.nil?
      unless !p_check || next_piece_positive.color == self.color
        possible_moves << [@pos[0] + drow , @pos[1] + dcol]
      end

      unless  !n_check || next_piece_negative.color == self.color
        possible_moves << [@pos[0] - drow , @pos[1] - dcol]
      end


    possible_moves.uniq
  end
end
