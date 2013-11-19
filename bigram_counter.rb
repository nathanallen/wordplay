# read in text file and filter it for non-word characters
file_name = ARGV.first || 'input.txt'
text = File.read(file_name).gsub(/[^\w\-\']/i, " ")

# basic regex patterns
word_pattern = /[\w\-\']+/
bigram_pattern = /[\w\-\']+\s+[\w\-\']+/

# find even pairs
even_pairs = text.scan(bigram_pattern)

# find odd pairs
offset_text = text.match(word_pattern).post_match	
odd_pairs = offset_text.scan(bigram_pattern)

# find unique pairs
all_pairs = even_pairs + odd_pairs
bigrams = all_pairs.sort.uniq

# count frequency of pairs and sort by frequency descending
bigram_frequencies = bigrams.map do |bigram|
  [bigram, all_pairs.count(bigram)]
end.sort_by {|k, v| v}.reverse

# return ten most frequent pairs
p bigram_frequencies.take(10)