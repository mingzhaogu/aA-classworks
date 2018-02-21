require 'colorize'
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

end
