require_relative 'piece'
require_relative 'slideable'

class Queen < Piece

  include Slideable

  def symbol
    @symbol = " ♛ "
    # color == :black ? @symbol = " ♛ " : @symbol = " ♕ "
  end

  protected

  def move_dirs
    Slideable::HORIZONTAL_DIRS + Slideable::DIAGONAL_DIRS
  end

end
