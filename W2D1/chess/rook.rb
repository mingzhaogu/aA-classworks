<<<<<<< HEAD
class Rook < Piece

  include SlidingPiece

  def initialize(board)
    @symbol = "R"
    @board = board
  end

  def move_dirs
    @move_dirs =
=======
require_relative 'piece'
require_relative 'slideable'

class Rook < Piece

  include Slideable

  def symbol
    @symbol = " ♜ "
    # color == :black ? @symbol = " ♜ " : @symbol = " ♖ "
  end

  protected

  def move_dirs
    Slideable::HORIZONTAL_DIRS
  end
>>>>>>> 095c6f375d18b017b8c848a9c9c2d4a575d1b0fd

end
