class Knight < Pieces
  include SteppingPiece
  def initialize(board,color, pos)
    super

    @symbol = :N
  end

end
