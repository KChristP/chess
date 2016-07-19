class King < Pieces
  include SteppingPiece
  def initialize(board, color, pos)
    super

    @symbol = :K
  end
end
