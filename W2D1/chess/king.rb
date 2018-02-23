class King < Piece

  include SteppingPiece

  POSSIBLE_MOVES = [[0, -1], [-1, 0], [0, -1], [1, 0],
                    [-1, -1], [-1, 1], [1, 1], [1, -1]]

  def moves
    #king moves one in any direction


  end



end
