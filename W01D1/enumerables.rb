require 'byebug'

def factors(num)
  result = []
  (1..num).each do |el|
    result << el if num % el == 0
  end
  result
end

class Array
  def my_each(&blk)
    i = 0
    while i < self.length
      blk.call(self[i])

      i += 1
    end

    self
  end

  def my_select(&blk)
    result = []
    self.my_each do |el|
      result << el if blk.call(el)
    end

    result
  end

  def my_reject(&blk)
    # result = []
    # self.my_each do |el|
    #   result << el unless blk.call(el)
    # end
    #
    # result

    self - self.my_select(&blk)
  end

  def my_any?(&blk)
    self.my_each do |el|
      return true if blk.call(el)
    end
    false
  end

  def my_all?(&blk)
    self.my_each do |el|
      return false unless blk.call(el)
    end
    true
  end

  def my_flatten
    result = []
    self.each do |el|
      puts el.class
      puts result
      if el.is_a? Array
        # result << el.my_flatten
        result += el.my_flatten
      else
        # el.my_flatten
        result << el
      end
    end
    result
  end

  def my_zip(*arg)
    transposed = my_transpose(*arg)
    duplicate = self.dup
    transposed.each_with_index do |el, idx|
      el.unshift(duplicate[idx])
    end
  end

  def my_transpose(*arg)
    init_arr = arg
    result = Array.new(self.length) { Array.new(init_arr.length) }

    init_arr.each_with_index do |el, row|
      el.each_with_index do |el2, col|
        break if col >= self.length
        result[col][row] = el2
      end
    end
    result
  end

  def my_rotate(shift=1)
    arr_length = self.length

    self.map.with_index do |el, idx|
      new_index = (idx + shift) % arr_length
      self[new_index]
    end
  end

  def my_join(separator = "")
    result = ""
    self.each_with_index do |ch, idx|
      if idx == self.length - 1
        result += ch
      else
        result += (ch + separator)
      end
    end

    result
  end

  def my_reverse
    result = []
    duplicate = self.dup
    while result.length < self.length
      result << duplicate.pop
    end
    result
  end

  def bubble_sort!
    self.each_index do |i|
      self.each_index do |j|
        next if i >= j
        if self[i] > self[j]
          self[i], self[j] = self[j], self[i]
        end
      end
    end
  end

  def bubble_sort(&prc)
    duplicate = self.dup
    duplicate.each_index do |i|
      duplicate.each_index do |j|
        case prc.call(duplicate[i], duplicate[j])
        when -1
          duplicate[i], duplicate[j] = duplicate[j], duplicate[i]
        when 0
          next
        when 1
          next
        end
      end
    end
    duplicate
  end
end

p [7,6,9,4,5,8,10].bubble_sort { |num1, num2| num1 <=> num2 }
