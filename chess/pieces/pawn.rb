class Pawn < Pieces
  def initialize(board, color, pos)
    super
    @symbol = " p "

    @moves = []
  end
  def symbol
    @symbol
  end

  def moves
    possible_moves = []
    possible_moves.concat(forward_dir)
    possible_moves.concat(side_attacks)
    possible_moves
  end

  protected

  def at_start_row?
  end

  def forward_dir
    if self.color == "black"
      forward_steps(-1)
    elsif self.color == "white"
      forward_steps(1)
    end
  end

  def forward_steps(i)
    possible_moves = []
    current_r, current_c = @pos

    if @board.grid[current_r+i][current_c].color == ""
      possible_moves << [current_r+i, current_c]
    end

    if @board.grid[current_r+2*i][current_c].color == "" #and current pos == starting pos
      if (self.color == "white" && current_r == 1) || (self.color == "black" && current_r == 6)
        possible_moves << [current_r+2*i, current_c]
      end
    end
    possible_moves
  end

  def side_attacks
    attacks = []
    current_r, current_c = @pos
    if self.color == "black"
      up_right = @board.grid[current_r - 1][current_c + 1]
      up_left = @board.grid[current_r - 1][current_c - 1]
      attacks << [current_r - 1, current_c + 1] if  !up_right.nil? && up_right.color == "white"
      attacks << [current_r - 1, current_c - 1] if !up_left.nil? && up_left.color == "white"
    elsif self.color == "white"
      down_right = @board.grid[current_r + 1][current_c + 1]
      down_left = @board.grid[current_r + 1][current_c - 1]
      attacks << [current_r + 1, current_c + 1] if !down_right.nil? && down_right.color == "black"
      attacks << [current_r + 1, current_c - 1] if !down_left.nil? && down_left.color == "black"
    end
    attacks
  end

end
