require 'colorize'
require_relative 'cursor'


class Display
  attr_accessor :board, :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], @board)
  end

  def render
    system('clear')
    board.board.each_with_index do |row, row_idx|
      row.each_with_index do |_col, col_idx|
        pos = [row_idx, col_idx]

        if pos == cursor.cursor_pos
          print board[pos].symbol.colorize(background: :cyan)
        else
          print board[pos].symbol
        end
      end
      puts
    end
  end

  def loop_render
    loop do
      render
      cursor.get_input
    end
  end

end
