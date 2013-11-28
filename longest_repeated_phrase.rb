WORD_PATTERN = /[\w\-\']+/

def ngrams_by_index(words_array, n = 3)
  stop_index = words_array.length - n+1
  offset = n-1
  ngrams_with_index = {}

  words_array.each_index do |i|
    unless i >= stop_index
      ngram = words_array[i..i+offset].join(' ')
      if ngrams_with_index[ngram]
        ngrams_with_index[ngram] << i
      else
        ngrams_with_index[ngram] = [i]
      end

    end
  end

  ngrams_with_index
end

def extract_words(file)
  File.read(file).scan(WORD_PATTERN)
end

def longest_repeated_phrase(words_array)
  n_length = 3
  threes = ngrams_by_index(words_array, n_length)
  sequentials = [[]]
  threes.each_value do |v|
    if v.length == 1
     sequentials << [] unless sequentials.last == []
    else
      sequentials.last << v
    end
  end
  sequentials.pop if sequentials.last == []

  memo_length = 0
  memo_longest_sequences = []

  sequentials.each_index do |i|
    length = sequentials[i].length
    if length >= memo_length
      memo_length = length
      memo_longest_sequences << sequentials[i]
    end
  end

  longest = memo_longest_sequences.last
  length = longest.length
  start = []
  longest.first.each do |n|
    if longest.last.include?(n+length-1)
      start << n
    end
  end
  words_array[start[0]..start[0]+length-1+n_length-1].join(' ')
end

#Driver Code

file = ARGV[0] || 'input.txt'
words_array = extract_words(file)

p longest_repeated_phrase(words_array)