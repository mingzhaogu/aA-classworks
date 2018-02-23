# Back in the good old days, you used to be able to write a darn near
# uncrackable code by simply taking each letter of a message and incrementing it
# by a fixed number, so "abc" by 2 would look like "cde", wrapping around back
# to "a" when you pass "z".  Write a function, `caesar_cipher(str, shift)` which
# will take a message and an increment amount and outputs the encoded message.
# Assume lowercase and no punctuation. Preserve spaces.
#
# To get an array of letters "a" to "z", you may use `("a".."z").to_a`. To find
# the position of a letter in the array, you may use `Array#find_index`.

def caesar_cipher(str, shift)
  ("a".."z").to_a
  coded_message = []

  str.chars.each do |letter|
    if letter == " "
      coded_message << " "
    else
      coded_message << letter_to_coded_letter(letter, shift)
    end
  end

  coded_message.join("")
end

def letter_to_coded_letter(letter, shift=0)
  arr = ("a".."z").to_a

  new_letter_index = (arr.find_index(letter) + shift) % 26

  arr[new_letter_index]
end

# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result, called the
# "digital root". **Do not use string conversion within your method.**
#
# You may wish to use a helper function, `digital_root_step(num)` which performs
# one step of the process.

# Example:
# digital_root(4322) => digital_root(11) => (2)

def digital_root(num)
  if num < 10
    return num
  else
    num = (num / 10) + (num % 10)
    digital_root(num)
  end
end

# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

def jumble_sort(str, alphabet = nil)
  splited = str.chars

  if alphabet.is_a?(Array)
    splited = splited.sort_by { |letter| alphabet.find_index(letter) }
  else
    splited.sort!
  end

  splited.join("")
end

class Array
  # Write a method, `Array#two_sum`, that finds all pairs of positions where the
  # elements at those positions sum to zero.

  # NB: ordering matters. I want each of the pairs to be sorted smaller index
  # before bigger index. I want the array of pairs to be sorted
  # "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def two_sum
    result = []
    self.each_index do |i|
      self.each_index do |j|
        next if i >= j
        result << [i, j] if self[i] + self[j] == 0
      end
    end

    result
  end
end

class String
  # Returns an array of all the subwords of the string that appear in the
  # dictionary argument. The method does NOT return any duplicates.

  def real_words_in_string(dictionary)
    result = []
    stringed = self.chars
    stringed.each_index do |i|
      stringed.each_index do |j|
        next if i > j

        word = stringed[i..j].join("")
        if dictionary.include?(word) && !result.include?(word)
          result << word
        end
      end
    end

    result
  end
end

# Write a method that returns the factors of a number in ascending order.

def factors(num)
  all_nums = (1..num).to_a
  all_nums.select! { |potential_factor| num % potential_factor == 0 }
end
