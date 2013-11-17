# use default file unless user specifies something else
file_name = ARGV.first || 'input.txt'

# basic regex patterns
word_pattern = /\w+/
bigram_pattern = /\w+ \w+/

# read in text file
text = File.read(file_name).downcase

# offset text by one word
offset_text = text.match(word_pattern).post_match	

# find all pairs, sort alphabetically
even_pairs = text.scan(bigram_pattern)
odd_pairs = offset_text.scan(bigram_pattern)
all_pairs = (even_pairs + odd_pairs).sort

# find unique pairs
bigrams = all_pairs.uniq

# count frequency of pairs, sort by frequency descending
bigram_frequency_hash = {}

bigrams.each do |bigram|
	p bigram
	bigram_frequency_hash[bigram] = all_pairs.count(bigram)
end.sort_by {|k, v| v}.reverse

# return ten most frequent pairs
p bigram_frequency_hash.take(10)


# h = h.sort_by() {|k, v| v}
