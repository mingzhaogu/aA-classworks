  require_relative 'piece'
  require_relative 'cursor'
  require_relative 'display'

  require_relative 'rook'
  require_relative 'knight'
  require_relative 'bishop'
  require_relative 'queen'
  require_relative 'king'
  require_relative 'pawn'
  require_relative 'null_piece'

class Board
  attr_accessor :board

  def initialize
    @board = Array.new(8) { Array.new(8) { NullPiece.instance } }
    setup
  end

  def setup
    self[[0,0]] = Rook.new(:black, self, [0,0])
    self[[0,1]] = Knight.new(:black, self, [0,1])
    self[[0,2]] = Bishop.new(:black, self, [0,2])
    self[[0,3]] = Queen.new(:black, self, [0,3])
    self[[0,4]] = King.new(:black, self, [0,4])
    self[[0,5]] = Bishop.new(:black, self, [0,5])
    self[[0,6]] = Knight.new(:black, self, [0,6])
    self[[0,7]] = Rook.new(:black, self, [0,7])

    @board[1].each_index do |col|
      self[[1,col]] = Pawn.new(:black, self, [1,col])
    end

    @board[6].each_index do |col|
      self[[6,col]] = Pawn.new(:white, self, [6,col])
    end

    self[[7,0]] = Rook.new(:white, self, [7,0])
    self[[7,1]] = Knight.new(:white, self, [7,1])
    self[[7,2]] = Bishop.new(:white, self, [7,2])
    self[[7,3]] = Queen.new(:white, self, [7,3])
    self[[7,4]] = King.new(:white, self, [7,4])
    self[[7,5]] = Bishop.new(:white, self, [7,5])
    self[[7,6]] = Knight.new(:white, self, [7,6])
    self[[7,7]] = Rook.new(:white, self, [7,7])
  end

  def move_piece(start_pos, end_pos)
    piece = self[start_pos]
    raise BlankSpace if piece.is_a?(NullPiece)

    self[end_pos] = piece
    self[start_pos] = NullPiece.instance
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
    pos.all? { |coordinate| coordinate.between?(0, 7) }
  end
end
