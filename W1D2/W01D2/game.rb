require_relative 'card.rb'
require_relative 'board.rb'
require 'byebug'

class Game
  attr_reader :board

  def initialize(board = Board.new, player="Player 1")
    @board = board
    @player = player
  end

  def play
    self.board.render

    until self.board.won?
      pos = get_guesses
      reveal(pos)
      system ('clear')
      self.board.render
      match?(pos)
      hide(pos)
    end

    won
  end

  def get_guesses
    begin
      card1_pos = prompt
      card2_pos = prompt
      cards = [card1_pos, card2_pos]
      raise Error unless self.valid_move?(cards)
    rescue
      puts "Try again."
      retry
    end
    cards
  end

  def prompt
    puts "Please name a card you want to reveal: row, col:"
    guess_pos
  end

  def guess_pos
    input = gets.chomp
    row, col = input.split(",").map(&:to_i)
  end

  def match?(pos_arr)
    return true if self.board[pos_arr[0]].value == self.board[pos_arr[-1]].value
  end

  def reveal(pos_arr)
    pos_arr.each { |card_pos| self.board[card_pos].reveal }
  end

  def hide(pos_arr)
    unless match?(pos_arr)
      pos_arr.each { |card_pos| self.board[card_pos].hide }
    end
  end

  def valid_move?(pos_arr)
    return false if pos_arr.any? do |pos|
      self.board[pos].nil? || self.board[pos].face_up?
    end

    true
  end

  def won
    puts "winna winna chicken dinna"
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.play
end
