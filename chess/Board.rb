require_relative "Pieces"

class Board
  attr_reader :grid

  def initialize()
    @grid = Array.new(8) {Array.new(8) {0} } #{Piece.new()}}

  end

  def move(start_pos, end_pos)
    while @grid[start_pos].nil?
      raise ArgumentError.new "No piece in your starting position"
    end
    until valid?(end_pos)
      raise ArgumentError.new "Not a valid move"
    end
    @grid[start_pos], @grid[end_pos] = @grid[end_pos], @grid[start_pos]
  end

  def mark(pos)
    x,y = pos
    @grid[x][y] = "X"
  end



  def in_bounds?(pos)
    pos.all? {|row_or_col| row_or_col.between?(0, 7)}
  end

  def checkmate?
    return false
  end

end

# def []
#
# end
#
#
# def []=
#
# end

#def move
  #if @grid[start].nil?
    #raise ???Error "you selected an empty position"
  #end
  #unless valid_move?(start_pos, end_pos)
    # raise ???Error "your piece cannot move to that position"
  #end
  #@grid[start_pos], @grid[end_pos] = @grid[end_pos], @grid[start_pos]
# end
