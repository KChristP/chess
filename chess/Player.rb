
require_relative "Display"

class Player
  def initialize()
    @display = Display.new()
  end

  def move
    result = nil
    until result
      @display.render
      result = @display.get_input
    end
    result
  end
end
