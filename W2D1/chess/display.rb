require 'colorize'
require_relative 'cursor'


class Display
<<<<<<< HEAD
  attr_accessor :grid, :cursor

  def initialize(board)
    @grid = board
    @cursor = Cursor.new([0, 0], @grid)
  end

  def render
    grid.board.each { |row| p row }
    grid[cursor.cursor_pos].symbol.green
=======
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
>>>>>>> 095c6f375d18b017b8c848a9c9c2d4a575d1b0fd
  end

  def loop_render
    loop do
<<<<<<< HEAD
      cursor.get_input
      render

=======
      render
      cursor.get_input
>>>>>>> 095c6f375d18b017b8c848a9c9c2d4a575d1b0fd
    end
  end

end
