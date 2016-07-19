require 'singleton'

class NullPiece
  include Singleton
  attr_reader :pos
  def initialize
    @symbol = :_
    @color = ""
    @pos = [4,4]
  end

  def symbol
    @symbol
  end

  def color
    @color
  end

end
