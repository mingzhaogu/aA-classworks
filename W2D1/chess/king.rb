<<<<<<< HEAD
class King < Piece

  include SteppingPiece

  POSSIBLE_MOVES = [[0, -1], [-1, 0], [0, -1], [1, 0],
                    [-1, -1], [-1, 1], [1, 1], [1, -1]]

  def moves
    #king moves one in any direction


  end



=======
require_relative 'piece'
require_relative 'stepable'

class King < Piece

  include Stepable

  def symbol
    @symbol = " ♚ "
    # color == :black ? @symbol = " ♚ " : @symbol = " ♔ "
  end

  protected

  def move_diffs
    [[0, -1], [-1, 0], [0, -1], [1, 0],
     [-1, -1], [-1, 1], [1, 1], [1, -1]]
  end


>>>>>>> 095c6f375d18b017b8c848a9c9c2d4a575d1b0fd
end
