require_relative "pieces/Pieces"
require_relative "pieces/bishop"
require_relative "pieces/king"
require_relative "pieces/knight"
require_relative "pieces/pawn"
require_relative "pieces/queen"
require_relative "pieces/rook"
require_relative "pieces/NullPiece"


class Board
  attr_reader :grid

  def initialize()
    @grid = Array.new(8) {Array.new(8) {"   "} } #{Piece.new()}}
    populate
  end

  def populate
    (0..7).each do |i|
      (0..7).each do |j|
        @grid[i][j] = NullPiece.instance
      end
    end



    (0..7).each do |i|
      @grid[1][i] = Pawn.new(self, "white")
      @grid[6][i] = Pawn.new(self, "black")
    end

    #rooks
    @grid[0][0], @grid[0][7] = Rook.new(self,"white"), Rook.new(self,"white")
    @grid[7][0], @grid[7][7] = Rook.new(self,"black"), Rook.new(self,"black")

    #knight
    @grid[0][1], @grid[0][6] = Knight.new(self,"white"), Knight.new(self,"white")
    @grid[7][1], @grid[7][6] = Knight.new(self,"black"), Knight.new(self,"black")

    #bishops
    @grid[0][2], @grid[0][5] = Bishop.new(self,"white"), Bishop.new(self,"white")
    @grid[7][2], @grid[7][5] = Bishop.new(self,"black"), Bishop.new(self,"black")

    @grid[0][3], @grid[0][3] = Queen.new(self,"white"), Queen.new(self,"white")
    @grid[7][3], @grid[7][3] = Queen.new(self,"black"), Queen.new(self,"black")

    @grid[0][4], @grid[0][4] = King.new(self,"white"), King.new(self,"white")
    @grid[7][4], @grid[7][4] = King.new(self,"black"), King.new(self,"black")

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

# board = Board.new
# board.populate
# p board.grid

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
