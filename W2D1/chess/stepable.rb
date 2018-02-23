module Stepable

  def moves
    possible_moves = []

    move_diffs.each do |delta|
      new_pos = [delta[0], delta[1]]

      if @board[new_pos].color != self.color &&
        @board[new_pos] != NullPiece.instance
        possible_moves << new_pos
      elsif @board[new_pos].color == self.color
        next
      elsif @board.valid_pos?(new_pos)
        possible_moves << new_pos
      end
    end

    possible_moves
  end

  private

  def move_diffs
  end

end
