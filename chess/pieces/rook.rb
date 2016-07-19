class Rook < Pieces
  include SlidingPiece
  def initialize(board, color)
    super

    @symbol = :R
  end
end
