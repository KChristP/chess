require 'singleton'

class NullPiece
  include Singleton
  attr_reader :pos
  def initialize
    @symbol = "   "
    @color = ""
    @pos = [4,4]
  end

  def update_pos(pos)
  end

  def symbol
    @symbol
  end

  def color
    @color
  end

end
