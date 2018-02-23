#phase 1 time O(n^2) space O(1)
def bad_two_sum?(arr, target)
  i = 0

  while i < arr.length
    j = i + 1

    while j < arr.length
      return true if arr[i] + arr[j] == target

      j += 1
    end

    i += 1
  end

  false
end

#phase 2 time O(nlogn - n^2)
def okay_two_sum?(arr, target)
  merge_sort(arr) #==> time nlogn space nlogn


end

def merge_sort(arr)
  return arr if arr.length <= 1

  middle = arr.length / 2

  left = okay_two_sum?(arr.take(middle))
  right = okay_two_sum?(arr.drop(middle))

  merge(left, right)
end

def merge(left, right)
  arr = []

  until left.empty? || right.empty?
    case left.first <=> right.first
    when -1
      arr << left.shift
    when 0
      arr << left.shift
      arr << right.shift
    when 1
      arr << right.shift
    end
  end

  arr.concat(left).concat(right)
end

def binary_search(arr, target)
  return nil if arr.length == 0
  middle = arr.length / 2

  case arr[middle] <=> target
  when -1
    binary_search(arr[0...middle])
  when 0
    return target
  when 1
    check_nil = binary_search(arr[middle + 1..middle]
    return nil if check_nil.nil?
    middle + 1 + check_nil
  end
end
