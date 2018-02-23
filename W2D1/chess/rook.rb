class Rook < Piece

  include SlidingPiece

  def initialize(board)
    @symbol = "R"
    @board = board
  end

  def move_dirs
    @move_dirs =

end
