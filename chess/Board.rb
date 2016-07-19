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
      @grid[1][i] = Pawn.new(self, "white", [1,i])
      @grid[6][i] = Pawn.new(self, "black", [6,i])
    end

    #rooks
    @grid[0][0], @grid[0][7] = Rook.new(self,"white", [0,0]), Rook.new(self,"white", [0,7])
    @grid[7][0], @grid[7][7] = Rook.new(self,"black", [7,0]), Rook.new(self,"black", [7,7])

    #knight
    @grid[0][1], @grid[0][6] = Knight.new(self,"white", [0,1]), Knight.new(self,"white", [0,6])
    @grid[7][1], @grid[7][6] = Knight.new(self,"black", [7,1]), Knight.new(self,"black", [7,6])

    #bishops
    @grid[0][2], @grid[0][5] = Bishop.new(self,"white", [0,2]), Bishop.new(self,"white",[0,5])
    @grid[7][2], @grid[7][5] = Bishop.new(self,"black", [7,2]), Bishop.new(self,"black", [7,5])

    @grid[0][3] = Queen.new(self,"white", [0,3])
    @grid[7][3] = Queen.new(self,"black", [7,3])

    @grid[0][4] = King.new(self,"white", [0,4])
    @grid[7][4] = King.new(self,"black", [7,4])

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

  def self.copy_board(board)
    new_board = Board.new
    board.grid.each_with_index do |row, row_idx|
      row.each_with_index do |value, col_idx|
        new_board.grid[row_idx][col_idx] = board[row_idx][col_idx].dup
      end
    end

  end

  def deep_dup
    dd_board = []
    @board.each do |row|
      dd_row = []
      row.each do |element|
        dd_row << element.dup
      end
      dd_board << dd_row
    end
    dd_board
  end

  def move_piece(color, from_pos, to_pos)
    dup_board = deep_dup
    dup_board.grid
  end

  def in_bounds?(pos)
    pos.all? {|row_or_col| row_or_col.between?(0, 7)}
  end

  def checkmate?
    return false
  end

end

board = Board.new
# board.populate
p board.grid[0][0].pos
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
