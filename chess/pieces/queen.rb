class Queen < Pieces
  include SlidingPiece
  def initialize(board, color, pos)
    super

    @symbol = :Q
  end
end
