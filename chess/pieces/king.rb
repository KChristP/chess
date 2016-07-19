class King < Pieces
  include SteppingPiece
  def initialize(board, color)
    super

    @symbol = :K
  end
end
