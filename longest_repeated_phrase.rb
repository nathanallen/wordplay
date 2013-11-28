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
  threes = ngrams_by_index(words_array, 3)
  whitelist = threes.reject {|k, v| v.length == 1}
  #whitelist.inject(){|memo,hash| hash.value }
end

def reject_singles(ngrams)
  ngrams.reject {|k, v| v.length == 1}
end

#Driver Code

file = ARGV[0] || 'input.txt'
words_array = extract_words(file)

p longest_repeated_phrase(words_array)
