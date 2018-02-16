def iter_range(start, ending)
  results = []

  (start..ending).each do |num|
    results << num
  end

  results
end

def rec_range(start, ending)
  return [start] if ending == start
  range(start, ending - 1) << ending
end

def rec_exp1(base, exp)
  return 1 if exp == 0
  base * rec_exp1(base, exp - 1)
end

def rec_exp2(base, exp)
  return 1 if exp == 0
  previous_pow = rec_exp2(base, (exp - 1) / 2)

  if exp.odd?
    base * previous_pow * previous_pow
  else
    previous_pow * previous_pow
  end
end

class Array
  def deep_dupe
    new_arr = []

    self.each do |el|
      unless el.is_a? Array
        new_arr << el
      else
        new_arr << el.deep_dupe
      end
    end

    new_arr
  end
end

def iter_fibonacci(n)
  new_arr = [1]

  (n - 1).times do |num|
    new_arr << new_arr[-1] + (new_arr[-2] || 0)
  end

  new_arr
end

def iter_fibonacci(n)
  new_arr = []

  n.times do |num|
    new_arr << (new_arr[-1] || 1) + (new_arr[-2] || 0)
  end

  new_arr
end

def rec_fibonacci(n)
  return [1] if n == 1
  return [1, 1] if n == 2
  previous_fib = rec_fibonacci(n - 1)
  previous_fib + [previous_fib[-1] + previous_fib[-2]]
end

def subsets(arr)
  return [[], [arr[0]]] if arr.length == 1

  current = []
  (arr.length - 1).downto(0) do |idx|
    current << arr[idx..-1]
  end

  subsets(arr[0...-1]) + current
end

subsets([1, 2, 3])

# def permutations(arr)
#   return arr if arr.length == 1
#   results = []
#   arr.each_with_index do |el, idx|
#     remaining_el = arr[0...idx] + arr[idx + 1..-1]
#
#     prev_perm = permutations(remaining_el)
#     results << ([el] + prev_perm)
#   end
#
#   results
# end

# def permutations(arr)
#   return [arr] if arr.length == 1
#   results = []
#
#   arr.each_with_index do |el, idx|
#     remaining_el = arr[0...idx] + arr[idx + 1..-1]
#
#     prev_perm = permutations(remaining_el)
#     prev_perm.each do |sub_arr|
#       results << [el] + sub_arr
#     end
#   end
#
#   results
# end

# permutations([1, 2, 3])

# def permutations(arr)
#   return [arr] if arr.length == 1
#   answer = []
#   prev_perm = permutations(arr[0...-1])
#
#   prev_perm.each do |el|
#     arr.each_index do |index|
#       answer << el[0...index] + [arr.last] + el[index..-1]
#     end
#
#   end
#
#   answer
# end

def bsearch(arr, target)
  middle_idx = arr.length / 2
  return middle_idx if arr[middle_idx] == target
  return nil if arr.length <= 1

  if target > arr[middle_idx]
    check_nil = bsearch(arr[middle_idx..-1], target)
    return nil if check_nil == nil
    middle_idx + check_nil
  elsif target < arr[middle_idx]
    bsearch(arr[0...middle_idx], target)
  end
end

def merge_sort(arr)
  return arr if arr.length == 1
  middle_idx = arr.length / 2
  left_arr = arr[0...middle_idx]
  right_arr = arr[middle_idx..-1]

  merge(merge_sort(left_arr), merge_sort(right_arr))
end

def merge(left, right)
  answer = []

  until left.empty? && right.empty?
    compare = (left[0] || right[0] + 1) <=> (right[0] || left[0] + 1)

    case compare
    when (-1..0)
      answer << left.shift
    when 1
      answer << right.shift
    end
  end
  answer
end

# merge_sort([10, 5, 3, 5, 1, 0, 8, 3, 4, 2, 1, 7])

def greedy_make_change(num, coins = [25, 10, 5, 1])
  return [] if num == 0
  working_coin = coins.first
  num_work_coins = num / working_coin
  leftover = num % working_coin

  change = [working_coin] * num_work_coins
  change + greedy_make_change(leftover, coins[1..-1])
end

greedy_make_change(264)










# asdfgh
