class King < Pieces
  include SteppingPiece
  def initialize(board, color, pos)
    super

    @symbol = :K
    @moves = [[0,1],
    [0,-1],
    [-1,1],
    [-1,-1],
    [1,0],
    [-1,0],
    [1,1],
    [1,-1]]
  end



  # protected

  def move_diffs
    super
  end


end
