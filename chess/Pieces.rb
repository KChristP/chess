

class Pieces
  attr_reader :color, :board, :pos

  def initialize(board)

  end

  def to_s
  end

  def empty?
  end

  def symbol
  end

  def valid_moves()
  end

  private
  def move_into_check?
  end

end



class Pawn < Pieces
  def symbol
  end

  def moves
  end

  protected

  def at_start_row?
  end

  def forward_dir
  end

  def forward_steps
  end

  def side_attacks
  end

end

class Rook < Pieces
  include SlidingPiece
end

class Knight < Pieces
  include SteppingPiece
end

class Bishop < Pieces
  include SlidingPiece
  
end

class Queen < Pieces
  include SlidingPiece
end

class King < Pieces
  include SteppingPiece
end
