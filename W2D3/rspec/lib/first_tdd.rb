require 'byebug'
class Array
  def my_uniq
    uniq_elements = []

    self.each do |el|
      uniq_elements << el unless uniq_elements.include?(el)
    end

    uniq_elements
  end

  def two_sum
    two_sums = []

    self.each_with_index do |el, index|
      i = 1

      while index + i < self.length
        if self[index + i] + el == 0
          two_sums << [index, index + i]
        end

        i += 1
      end
    end

    two_sums
  end
end

def my_transpose(arr)
  transposed = Array.new(arr.first.length) { Array.new(arr.length) }

  arr.each_with_index do |row, row_idx|
    row.each_with_index do |el, col_idx|
      transposed[col_idx][row_idx] = el
    end
  end

  transposed
end

def stock_picker(arr)
  best_profit = []
  difference = 0

  arr.each_with_index do |price, day|
    arr.each_with_index do |price2, day2|
      next if day >= day2

      compare = price2 - price
      if compare > difference
        best_profit = [day, day2]
        difference = compare
      end
    end
  end

  best_profit
end

class TowersOfHanoi
  attr_accessor :stack

  def initialize
    @stack = [[3, 2, 1], [], []]
  end

  def valid_move?(from, to)
    raise "Only enter 0 to 2." unless from.between?(0, 2) && to.between?(0, 2)
    raise "No disc exists" if stack[from].empty?

    return true if stack[to].empty?

    if stack[from].last > stack[to].last
      raise "Disc too big!"
    end

    true
  end

  def move(from, to)
    valid_move?(from, to)
    disc = stack[from].pop
    stack[to].push(disc)

    stack
  end

  def won?
    winning_stack = [3,2,1]

    stack[1] == winning_stack || stack[2] == winning_stack
  end
end
