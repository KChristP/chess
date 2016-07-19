class Queen < Pieces
  include SlidingPiece
  def initialize(board, color)
    super

    @symbol = :Q
  end
end
