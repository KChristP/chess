require_relative "Board"
require_relative "Player"

class Game
  def initialize
    @board = Board.new
    @player = Player.new()
    @display = Display.new()
  end



  def run
    puts "Running"
    until @board.checkmate?
      pos = @player.move
      # @board.mark(pos)
      @display.render
      p @board.grid[0][0].pos
    end
    puts "Board filled"
  end
end

if __FILE__ == $PROGRAM_NAME
  Game.new.run
end
