class Bishop < Pieces
  include SlidingPiece
  def initialize(board, color, pos)
    super

    @symbol = " B "
  end

  # def move_dirs
  #   diagonal_dirs
  # end

  def moves
    diagonal_dirs
  end

end
