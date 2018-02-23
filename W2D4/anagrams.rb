#phase 1 time O(n!)
def first_anagram?(str1, str2)
  str1_permutations = str1.chars.permutation.to_a
  str1_permutations.each do |el|
    p el
    return true if el.join("") == (str2)
  end

  false
end

#phase 2 time O(n^2) space O(n)
def second_anagram?(str1, str2)
  first = str1.chars
  second = str2.chars

  first_dup = first.dup
  second_dup = second.dup

  first.each_with_index do |char, idx|
    second.each_with_index do |char2, idx2|
      if char == char2
        first_dup[idx] = ""
        second_dup[idx2] = ""
      end
    end
  end

  first_dup == second_dup
end

#phase 3 time O(nlogn) space O(n)
def third_anagram?(str1, str2)
  str1.chars.sort == str2.chars.sort
end

#phase 4 time O(n) space O(n)
def fourth_anagram?(str1, str2)
  result = Hash.new(0)

  str1.chars.each do |letter|
    result[letter] += 1
  end

  str2.chars.each do |letter|
    result[letter] -= 1
  end

  result.values.all? { |v| v == 0 }
end
