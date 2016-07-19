require_relative 'Board'
require 'colorize'
require_relative 'Chess'
require_relative 'cursorable'
require "io/console"

class Display
  attr_reader :cursor, :selected
  include Cursorable

  def initialize
    @board = Board.new
    @cursor = []
    @selected = false
    @cursor_pos = [3,2]
  end

  def build_grid
    @board.grid.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    row.map.with_index do |piece, j|
      color_options = colors_for(i, j)
      piece.symbol.to_s.colorize(color_options)
    end
  end

  def colors_for(i, j)
    # @board.grid.each do |row|
    #   row.each do |element|
    #     element.color == "white" ? piece = :white : piece = :purple
    #   end
    # end
    @board.grid[i][j].color == "white" ? piece = :white : piece = :light_blue

    if [i, j] == @cursor_pos
      bg = :light_red
    elsif (i + j).odd?
      bg = :blue
    else
      bg = :green
    end
    {background: bg, color: piece}
  end

  def render
    system("clear")
    puts "Select a square"
    puts "Arrow keys"

    build_grid.each { |row| puts row.join}
    # p @board.grid[-1][0]
    p @board.grid[5][5].class
    p @board.grid[5][5].color
    p @board.grid[5][5].moves
  end

  # def mini_play
  #   renders
  #   p @board
  # end

end

# display = Display.new()

# display.mini_play


# if __FILE__ == $PROGRAM_NAME
#   Display.new.get_input
# end
