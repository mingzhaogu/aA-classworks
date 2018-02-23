require 'colorize'
<<<<<<< HEAD

class Piece
  attr_reader :symbol

  def initialize(board, position)
    @board = board
    @position = position
    @symbol = "p"
  end

  def inspect
    @symbol
  end

  def moves
  end

end

class NullPiece < Piece
  def initialize
    @symbol = "X"
  end
# .colorize(:background => :red).chomp
end

class NotNullPiece < Piece
  def initialize
    @symbol = "nn"
  end
=======
# require_relative 'slideable'
# require_relative 'stepable'
#
# require_relative 'rook'
# require_relative 'knight'
# require_relative 'bishop'
# require_relative 'queen'
# require_relative 'king'
# require_relative 'pawn'
# require_relative 'null_piece'

class Piece
  attr_reader :color, :symbol

  def initialize(color, board, position)
    @board = board
    @position = position
    @color = color
  end

  def to_s
    " #{symbol} "
  end

  def empty?
  end

  def valid_moves?(pos)
  end

  def pos=(val)
    self[pos] = val
  end

  def symbol
    @symbol
  end

  private

  def move_into_check?(end_pos)
  end

>>>>>>> 095c6f375d18b017b8c848a9c9c2d4a575d1b0fd
end
