WORD_PATTERN = /[\w\-\']+/

def count_bigrams(file)
  words = File.read(file).scan(WORD_PATTERN)
  hash = {}
  stop_index = words.length-1

  words.each_index do |i|
    unless i == stop_index
      bigram = [words[i], words[i+1]].join(' ')
      if hash[bigram]
        hash[bigram] += 1
      else
        hash[bigram] = 1
      end
    end
  end

  hash
end

# Driver Code
file_name = ARGV.first || 'input.txt'
bigram_frequencies = count_bigrams(file_name)
top_ten_bigrams = bigram_frequencies.sort_by {|k, v| v}.reverse.take(10)

p top_ten_bigrams

