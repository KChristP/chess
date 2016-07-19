class Rook < Pieces
  include SlidingPiece
  def initialize(board, color, pos)
    super

    @symbol = :R
  end
end
