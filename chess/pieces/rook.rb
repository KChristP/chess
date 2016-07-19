class Rook < Pieces
  include SlidingPiece
  def initialize(board, color, pos)
    super

    @symbol = " R "
  end

  def move_dirs
    horizontal_dirs
  end

end
