require 'singleton'

class NullPiece
  include Singleton
  def initialize
    @symbol = :_
  end

  def symbol
    @symbol
  end

end
