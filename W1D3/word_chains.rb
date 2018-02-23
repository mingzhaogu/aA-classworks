class WordChainer

  def initialize(dictionary_file_name)
    array_of_words = File.readlines(dictionary_file_name)
    @dictionary = Set.new(array_of_words)
  end

  def adjacent_words(source)
    words_same_length = same_length(source)

    @dictionary.keep_if do |word|
      source.chars.each_with_index do |char, idx|

  end

  def same_length(source)
    @dictionary.keep_if { |word| word.length == source.length }
  end


end
