class Knight < Pieces
  include SteppingPiece
  def initialize(board,color)
    super

    @symbol = :N
  end

end
