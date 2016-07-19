

module SteppingPiece

  def moves()

  end

  private

  def move_diffs()
    possible_moves = []
    @moves.each do |pair|
      rPos, cPos = @pos
      row, col = pair
      r_idx = rPos+row
      c_idx = cPos+col
      if r_idx.between?(0,7) && c_idx.between?(0,7)
        piece = @board.grid[r_idx][c_idx]
        possible_moves <<  [r_idx, c_idx] unless piece.color == self.color
      end
    end
    possible_moves

  end

end
