class Pawn < Pieces
  def initialize(board, color)
    super
    @symbol = :p
  end
  def symbol
    @symbol
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
