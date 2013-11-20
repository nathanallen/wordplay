WORD_PATTERN = /[\w\-\']+/

def count_ngrams(file, n = 3)
  words = File.read(file).scan(WORD_PATTERN)
  stop_index = words.length - n+1
  offset = n-1
  hash = {}

  words.each_index do |i|
    unless i >= stop_index
      ngram = words[i..i+offset].join(' ')
      if hash[ngram]
        hash[ngram] += 1
      else
        hash[ngram] = 1
      end
    end
  end

  hash
end

# Driver Code
file_name = ARGV[0] || 'input.txt'
number_of_sequential_words = ARGV[1].to_i
ngram_frequencies = count_ngrams(file_name, number_of_sequential_words)
top_ten_ngrams = ngram_frequencies.sort_by {|k, v| v}.reverse.take(10)

p top_ten_ngrams

