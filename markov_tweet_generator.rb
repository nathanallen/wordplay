class TweetRegurgitator
  require 'CSV'

  attr_reader :word_probs, :word_freqs

  def initialize(tweets_csv)
    calculate_frequencies_from_file(tweets_csv)
    @word_probs = calculate_probabilities
  end

  def generate_tweet
    generate_tweets
  end

  def generate_tweets(n=1)
    n.times.map do
      words = generate_word_branch(random_seed_word)
      format(words)
    end
  end

  private

  def calculate_frequencies_from_file(tweets_csv)
    csv_rows = CSV.parse(File.read(tweets_csv))
    parse_tweets(csv_rows)
  end

  def parse_tweets(csv_rows)
    for row in 1..(csv_rows.length-1)
      words_in_tweet = csv_rows[row][5].split(' ')
      find_word_pairs_and_update_freqs(words_in_tweet)
    end
  end

  def find_word_pairs_and_update_freqs(words_in_tweet)
    words_in_tweet.each_index do |word_index|
      current_word = words_in_tweet[word_index]
      next_word = words_in_tweet[word_index + 1]
      update_frequency(current_word, next_word) unless next_word.nil?
    end
  end

  def frequency_of
    @word_freqs ||= {}
  end

  def update_frequency(current_word, next_word)
    nested_hash = frequency_of[current_word]
    if nested_hash && nested_hash[next_word]
      frequency_of[current_word][next_word] += 1
    else
      frequency_of[current_word] = {next_word => 1}
    end
  end

  def calculate_probabilities
    word_freqs.each_value do |next_word_freqs|
        total = next_word_freqs.values.inject(:+)
        next_word_freqs.each_pair do |k,v|
          next_word_freqs[k] = v.fdiv(total)
        end
     end
  end

  def random_seed_word
    word_probs.keys.sample
  end

  def random_percent
    rand(0..1.0)
  end
 
  def generate_word_branch(*words)
    until words[-1].nil? || words.length == 23 # sanity check against infinite loop
      seed_word = words[-1]
      seed_hash = word_probs[seed_word]
      words << next_word_or_nil(seed_hash, random_percent)
    end
    words[0..-2]
  end

  def next_word_or_nil(seed_hash, random_percent)
    seed_hash ? next_word_by_probability(seed_hash, random_percent) : nil
  end

  def next_word_by_probability(seed_hash, goal_v, current_v=0)
    seed_hash.take_while do |word_prob|
      current_v += word_prob.last
      current_v >= goal_v
    end.first.first
  end

  def format(words)
    tweet = words.join(' ').slice(0,140)
  end

end

#Driver Code
n = ARGV[0] ? ARGV[0].to_i : 5
tweets = TweetRegurgitator.new('tweets.csv').generate_tweets(n)
tweets.each{|t| p t}
