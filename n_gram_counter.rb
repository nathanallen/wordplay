WORD_PATTERN = /[\w\-\']+/

def count_ngrams(words_array, n = 3)
  stop_index = words_array.length - n+1
  offset = n-1
  ngram_freqs = Hash.new(0)

  words_array.each_index do |i|
    unless i >= stop_index
      ngram = words_array[i..i+offset].join(' ')
      if ngram_freqs[ngram]
        ngram_freqs[ngram] += 1
      end
    end
  end

  ngram_freqs
end

def extract_words(file)
  File.read(file).scan(WORD_PATTERN)
end

#Driver Code

file = ARGV[0] || 'input.txt'
words_array = extract_words(file)

if ARGV[1]
  number_of_sequential_words = ARGV[1].to_i
  ngram_frequencies = count_ngrams(words_array, number_of_sequential_words)
else
  ngram_frequencies = count_ngrams(words_array)
end

top_ten_ngrams = ngram_frequencies.sort_by {|k, v| v}.reverse.take(10)

p top_ten_ngrams