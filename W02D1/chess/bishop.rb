require_relative 'piece'
require_relative 'slideable'

class Bishop < Piece

  include Slideable

  def symbol
    @symbol = "B"
  end

  protected

  def move_dirs
    Slideable::DIAGONAL_DIRS
  end

end
