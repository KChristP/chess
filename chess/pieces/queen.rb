class Queen < Pieces
  include SlidingPiece
  def initialize(board, color, pos)
    super

    @symbol = " Q "
  end

  # def move_dirs
  #   moves = []
  #   moves.concat(horizontal_dirs)
  #   moves.concat(diagonal_dirs)
  #   moves
  # end
  def moves
    moves = []
    moves.concat(horizontal_dirs)
    moves.concat(diagonal_dirs)
    moves
  end
end
