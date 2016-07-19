class Bishop < Pieces
  include SlidingPiece
  def initialize(board,color)
    super

    @symbol = :B
  end

end
