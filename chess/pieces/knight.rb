class Knight < Pieces
  include SteppingPiece
  def initialize(board,color, pos)
    super

    @symbol = " N "
    @moves = [
      [-2, -1],
      [-2, 1],
      [-1, -2],
      [-1, 2],
      [1, -2],
      [1, 2],
      [2, -1],
      [2, 1]]
  end

  # protected

  # def move_diffs
  #   super
  # end

  def moves
    super
  end
end
