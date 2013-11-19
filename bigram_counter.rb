# basic regex pattern
word_pattern = /[\w\-\']+/

# read in text file and make array of individual words
file_name = ARGV.first || 'input.txt'
words = File.read(file_name).scan(word_pattern)

all_pairs = {}
stop_index = words.length-1

words.each_index do |i|
  unless i == stop_index
  	bigram = [words[i], words[i+1]].join(' ')
  	if all_pairs[bigram]
  	  all_pairs[bigram] += 1
  	else
  	  all_pairs[bigram] = 1
  	end
  end
end

bigram_frequencies = all_pairs.sort_by {|k, v| v}.reverse

# return ten most frequent pairs
p bigram_frequencies.take(10)