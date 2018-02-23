  require_relative 'piece'
  require_relative 'cursor'
  require_relative 'display'

class Board
  attr_accessor :board

  def initialize
    @board = Array.new(8) { Array.new(8) { NullPiece.new } }
  end

  def setup
  end

  def move_piece(start_pos, end_pos)
    piece = self[start_pos]
    raise BlankSpace if piece.is_a?(NullPiece)

    self[end_pos] = piece
    self[start_pos] = NullPiece.new
    #raise exeption if start pos == NullPiece or end_pos == not valid

  end

  def [](pos)
    row, col = pos
    # row = pos[0]
    # col = pos[1]
    @board[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @board[row][col] = val
  end


  def valid_pos?(pos)
    pos.all? { |coordinate| coordinate.between?(0...8) }
  end
end
