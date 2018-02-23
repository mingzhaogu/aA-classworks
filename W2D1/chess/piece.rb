require 'colorize'

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
end
