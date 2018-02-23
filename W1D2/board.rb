require_relative 'card.rb'
require 'byebug'

class Board

  attr_reader :grid, :render

  def initialize(row = 4, column = 5)
    @grid = Array.new(row) { Array.new(column)}
    @num_of_cards = row * column
    self.populate
  end

  def [](pos)
    row, column = pos
    @grid[row][column]
  end

  def []=(pos, card)
    row, col = pos
    @grid[row][col] = card
  end

  def populate
    cards_arr = get_cards

    @grid.each_index do |row|
      @grid[row].each_index do |col|
        el = cards_arr.shift
        self[[row, col]] = el
      end
    end

    self
  end

  def get_cards
    @all_cards = []
    (1..@num_of_cards / 2).each do |value|
      @all_cards << Card.new(value)
      @all_cards << Card.new(value)
    end
    @all_cards.shuffle
  end

  def won?
    @grid.flatten.all? { |card| card.face_up? }
  end

  def render
    header = "|-column-|"

    grid_map = (@grid.map.with_index do |row, idx|
      new_row = row.map.with_index do |card, col_idx|
        header << "-#{'%02d' % col_idx}-|" if idx == 0
        card.to_s
      end

      "|-row #{'%02d' % idx}-| " + new_row.join(" | ") + " |"
    end.join("\n"))

    # header = "---------" + ("-----" * @grid[0].length)

    puts [header, grid_map].join("\n")
  end

end


# if __FILE__ == $PROGRAM_NAME
#   b = Board.new
# end
