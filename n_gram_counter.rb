WORD_PATTERN = /[\w\-\']+/

def count_ngrams(file, n = 3)
  words = File.read(file).scan(WORD_PATTERN)
  stop_index = words.length - n+1
  offset = n-1
  ngram_freqs = Hash.new(0)

  words.each_index do |i|
    unless i >= stop_index
      ngram = words[i..i+offset].join(' ')
      if ngram_freqs[ngram]
        ngram_freqs[ngram] += 1
      end
    end
  end

  ngram_freqs
end

#Driver Code
if ARGV[1]
  number_of_sequential_words = ARGV[1].to_i
  file_name = ARGV[0]
  ngram_frequencies = count_ngrams(file_name, number_of_sequential_words)
else
  file_name = ARGV[0] || 'input.txt'
  ngram_frequencies = count_ngrams(file_name)
end

top_ten_ngrams = ngram_frequencies.sort_by {|k, v| v}.reverse.take(10)

p top_ten_ngrams