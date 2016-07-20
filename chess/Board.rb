require_relative "pieces/Pieces"
require_relative "pieces/bishop"
require_relative "pieces/king"
require_relative "pieces/knight"
require_relative "pieces/pawn"
require_relative "pieces/queen"
require_relative "pieces/rook"
require_relative "pieces/NullPiece"
require 'byebug'

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

    # (0..7).each do |i|
    #   @grid[1][i] = Pawn.new(self, "white", [1,i])
    #   @grid[6][i] = Pawn.new(self, "black", [6,i])
    # end
    #
    # #rooks
    # @grid[0][0], @grid[0][7] = Rook.new(self,"white", [0,0]), Rook.new(self,"white", [0,7])
    # @grid[7][0], @grid[7][7] = Rook.new(self,"black", [7,0]), Rook.new(self,"black", [7,7])
    #
    # #knight
    # @grid[0][1], @grid[0][6] = Knight.new(self,"white", [0,1]), Knight.new(self,"white", [0,6])
    # @grid[7][1], @grid[7][6] = Knight.new(self,"black", [7,1]), Knight.new(self,"black", [7,6])
    #
    # #bishops
    # @grid[0][2], @grid[0][5] = Bishop.new(self,"white", [0,2]), Bishop.new(self,"white",[0,5])
    # @grid[7][2], @grid[7][5] = Bishop.new(self,"black", [7,2]), Bishop.new(self,"black", [7,5])
    #
    # @grid[0][3] = Queen.new(self,"white", [0,3])
    # @grid[7][3] = Queen.new(self,"black", [7,3])
    #
    # @grid[0][4] = King.new(self,"white", [0,4])
    # @grid[7][4] = King.new(self,"black", [7,4])

    #hard-code checkmate
     @grid[0][1] = King.new(self,"black", [0,1])
     @grid[1][7], @grid[0][7] = Rook.new(self,"white", [1,7]), Rook.new(self,"white", [0,7])
     @grid[1][1] = Pawn.new(self, "white", [1,1])

  end

  def move(start_pos, end_pos)

    start_row, start_col = start_pos
    end_row, end_col = end_pos

    unless start_row.between?(0,7) && start_col.between?(0,7)
      raise ArgumentError.new "No piece in your starting position"
    end

    @grid[end_row][end_col] = @grid[start_row][start_col]
    @grid[end_row][end_col].update_pos([end_row, end_col])
    @grid[start_row][start_col] = NullPiece.instance

  end

  def copy_board
    new_board = Board.new
    @grid.each_with_index do |row, row_idx|
      row.each_with_index do |value, col_idx|
        new_board.grid[row_idx][col_idx] = @grid[row_idx][col_idx]
      end
    end
    new_board
  end


  def in_check?(color)
    my_king = filter_pieces(color).select {|obj| obj.class==King}
    color == "black" ? other_color = "white" : other_color = "black"
    other_moves = valid_moves(other_color)
    # return true if other_moves.include?(my_king.first.pos)
    # false
  end

  def checkmate?(color)
    color == "black" ? other_color = "white" : other_color = "black"
    if in_check?(color)
      # our_moves = valid_moves(color)
      # our_moves.each do |move|
      #   duped_board = copy_board
      #
      # end
      our_pieces = filter_pieces(color)
      our_pieces.each do |piece|
        piece.moves.each do |move|
          duped_board = copy_board
          duped_board.move(piece.pos, move)
          # byebug
          return false if !duped_board.in_check?(color)
        end
      end
      # other_pieces = filter_pieces(other_color)
      # other_moves = valid_moves(other_color)
      return true
    end
    false
  end

  def valid_moves(color)
    piece_moves = []
    filter_pieces(color).each do |obj|
      # byebug
      piece_moves.concat(obj.moves)
    end
    piece_moves
  end


  def move_piece(color, from_pos, to_pos)
    dup_board = copy_board
    dup_board.move(from_pos, to_pos)
    dup_board
    #what should this return?
  end

  def in_bounds?(pos)
    pos.all? {|row_or_col| row_or_col.between?(0, 7)}
  end

  def filter_pieces(color)
    pieces = []
    @grid.each do |row|
      pieces += row.select {|el| el if  el.color == color}
    end
    pieces
  end

end

board = Board.new
p board.grid[0][1].class
p board.grid[1][1].class
p board.in_check?("black")
# p board.checkmate?("black")
# my_king = board.filter_pieces("black").select {|obj| obj.class==King}
# duped = board.move_piece("white", [0,4], [5,5])
# p duped.grid[5][5].class
# p duped.filter_pieces("white").

# p my_king.first.class
# p board.filter_pieces("white").last.color
# p duped.in_check?("white")
