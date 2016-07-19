class Bishop < Pieces
  include SlidingPiece
  def initialize(board,color, pos)
    super

    @symbol = :B
  end

end
