require 'colorize'
require_relative 'cursor'


class Display
  attr_accessor :grid, :cursor

  def initialize(board)
    @grid = board
    @cursor = Cursor.new([0, 0], @grid)
  end

  def render
    grid.board.each { |row| p row }
    grid[cursor.cursor_pos].symbol.green
  end

  def loop_render
    loop do
      cursor.get_input
      render

    end
  end

end
