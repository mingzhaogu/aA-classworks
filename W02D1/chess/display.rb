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

    switch_color = true
    board.board.each_with_index do |row, row_idx|
      switch_color ? counter = 0 : counter = 1

      row.each_with_index do |_col, col_idx|
        pos = [row_idx, col_idx]

        if counter.even?
          background_color = :white
        else
          background_color = :black
        end

        # def render_help(pos, background_color)
        if pos == cursor.cursor_pos
          print board[pos].symbol.colorize(background: :cyan)
        elsif board[pos].color == :black
          print board[pos].symbol.colorize(color: :blue,
            background: background_color)
        elsif board[pos].color == :white
          print board[pos].symbol.colorize(color: :red,
            background: background_color)
        else
          print board[pos].symbol.colorize(background:
            background_color)
          end
        # end


        # render_help(pos, background_color)

        counter += 1
      end

      switch_color ? switch_color = false : switch_color = true
      puts
    end
  end

  def render_help(pos, background_color)
    if pos == cursor.cursor_pos
      print board[pos].symbol.colorize(background: :cyan)
    elsif board[pos].color == :black
      print board[pos].symbol.colorize(color: :blue, background: background_color)
    elsif board[pos].color == :white
      print board[pos].symbol.colorize(color: :red, background: background_color)
    else
      print board[pos].symbol
    end
  end

  def loop_render
    loop do
      render
      cursor.get_input
    end
  end

end
