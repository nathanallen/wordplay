# read in text file
file_name = ARGV.first || 'input.txt'
text = File.read(file_name).downcase

# basic regex patterns (these need to be more precise)
word_pattern = /[a-z]+/
bigram_pattern = /[a-z]+ [a-z]+/

# find even pairs
even_pairs = text.scan(bigram_pattern)

# find odd pairs
offset_text = text.match(word_pattern).post_match	
odd_pairs = offset_text.scan(bigram_pattern)

# find unique pairs
all_pairs = even_pairs + odd_pairs
bigrams = all_pairs.sort.uniq

# count frequency of pairs and sort by frequency descending
bigram_frequency_hash = {}
bigrams.each do |bigram|
  bigram_frequency_hash[bigram] = all_pairs.count(bigram)
end.sort_by {|k, v| v}.reverse

# return ten most frequent pairs
p bigram_frequency_hash.take(10)