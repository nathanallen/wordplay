class NgramFinder

  attr_reader :ngram_freqs

  def initialize(file)
    @word_pattern = /[\w\-\']+/
    @words_array = extract_words(file)
    @ngram_freqs = Hash.new(0)
  end

  def find_ngrams(n=3)
    limits = set_bounds(n)
    count_ngrams(*limits)
    ngram_freqs
  end

  def find_and_sort_ngrams_by_frequency(n=3)
    find_ngrams(n).sort_by {|k, v| v}.reverse
  end

  private

  def extract_words(file)
    File.read(file).scan(@word_pattern)
  end

  def set_bounds(n)
    stop_index = @words_array.length - n+1
    offset = n-1
    [stop_index, offset]
  end

  def count_ngrams(stop_index, offset)
    stop_index.times do |i|
      ngram = @words_array[i..i+offset].join(' ')
      ngram_freqs[ngram] += 1
    end
  end

end


#Driver Code
file = ARGV[0] || 'sample/input.txt'
ngram_finder = NgramFinder.new(file)

p top_ten = if ARGV[1]
              ngram_length = ARGV[1].to_i
              ngram_finder.find_and_sort_ngrams_by_frequency(ngram_length)
            else
              ngram_finder.find_and_sort_ngrams_by_frequency
            end.take(10)