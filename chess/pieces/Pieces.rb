require_relative 'SlidingPiece'
require_relative 'SteppingPiece'


class Pieces
  attr_reader :color, :board, :pos

  def initialize(board, color, pos)
    @board = board
    @color = color
    @pos = pos
  end

  def to_s
  end

  def empty?
  end

  def symbol
    @symbol
  end

  def color
    @color
  end

  def valid_moves()
  end

  private
  def move_into_check?
  end

end
