require_relative 'piece'
require_relative 'slideable'

class Bishop < Piece

  include Slideable

  def symbol
    @symbol = " ♝ "
    # color == :black ? @symbol = " ♝ " : @symbol = " ♗ "
  end

  protected

  def move_dirs
    Slideable::DIAGONAL_DIRS
  end

end
