require 'singleton'
require_relative 'piece'

class NullPiece < Piece

  include Singleton

  attr_reader :symbol

  def initialize
  end

  def moves
  end

  def symbol
    @symbol = "   "
  end

end
