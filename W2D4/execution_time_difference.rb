#phase 1 time O(n^2) space O(n)
def my_min(list)
  list.each_with_index do |el, idx|
    if (list[0...idx] + list[idx + 1..-1]).all? { |list_el| list_el > el }
      return el
    end
  end
end


#phase 2 time O(n) space O(1)
def my_min(list)
  min = list.first
  list.each do |el|
    min = el if el < min
  end
  min
end

#phase 1 time O(n^3) space O(n^2)
def largest_contiguous_subsum(list)
  arr = []
  list.each_index do |i|
    list.each_index do |j|
      next if i > j
      arr << list[i..j]
    end
  end

  max = 0

  arr.each do |el|
    sum = el.reduce(:+)
    max = sum if max < sum
  end

  max
end


#phase 2 time O(n) space O(1)
def largest_contiguous_subsum(list)
  largest = list.first
  running_sum = 0

  list.each do |el|
    running_sum += el
    largest = running_sum if running_sum > largest
    running_sum = 0 if running_sum < 0
  end

  largest
end
