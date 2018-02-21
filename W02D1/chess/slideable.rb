module Slideable

  HORIZONTAL_DIRS = [[-1, 0], [0, 1], [1, 0], [0, -1]].freeze

  DIAGONAL_DIRS = [[-1, -1], [-1, 1], [1, 1], [1, -1]].freeze

  def moves
    possible_moves = []

    move_dirs.each do |delta|
      possible_moves << grow_unblocked_moves_in_dir(delta[0], delta[1])
    end
    
    possible_moves
  end


  private

  def move_dirs
    HORIZONTAL_DIRS + DIAGONAL_DIRS
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    pos_moves = []
    (1..7).each do |multiple|
      new_pos = [multiple * dx, multiple * dy]

      if @board[new_pos].color != self.color &&
        @board[new_pos] != NullPiece.instance
        pos_moves << new_pos
        break
      elsif @board[new_pos].color == self.color
        break
      elsif @board.valid_pos?(new_pos)
        pos_moves << new_pos
      end
    end
    pos_moves
  end
end
