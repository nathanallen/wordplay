class TweetRegurgitator
  require 'CSV'

  attr_reader :word_p

  def initialize(tweets_csv)
    calculate_frequencies_from_file(tweets_csv)
    @word_p = calculate_probabilities
  end

  def calculate_frequencies_from_file(tweets_csv)
    tweet_rows = CSV.parse(File.read('tweets.csv'))
    parse_tweets(tweet_rows)
  end

  def word_freqs
    @word_freqs ||= {}
  end

  def parse_tweets(tweet_rows)
    for row in 1..(tweet_rows.length-1)
      words_in_tweet = tweet_rows[row][5].split(' ')
      words_in_tweet.each_index do |word_index|
        current_word = words_in_tweet[word_index]
        next_word = words_in_tweet[word_index + 1]
        update_word_frequency(current_word, next_word) unless next_word.nil?
      end
    end
  end

  def update_word_frequency(current_word, next_word)
    nest_hash = word_freqs[current_word]
    if nest_hash && nest_hash[next_word]
      word_freqs[current_word][next_word] += 1
    else
      word_freqs[current_word] = {next_word => 1}
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

  def random_word
    @word_p.keys.sample
  end

  def random_percent
    rand(0..1.0)
  end

  def next_word(seed_word, goal_v, current_v=0)
    word_p[seed_word].take_while do |word_prob|
      current_v += word_prob.last
      current_v >= goal_v
    end.first.first
  end

  def generate_tweets(n=1)
    n.times.map do
      words = chain_together_words(random_seed_word)
      format(words)
    end
  end
 
  def chain_together_words(*words)
    until words[-1].nil?
      seed_word = words[-1]
      words << ( word_p[seed_word] ? next_word(seed_word, random_percent) : nil )
    end
    words[0..-2]
  end

  def format(words)
    tweet = words.join(' ').slice(0,140)
  end

end

#Driver Code
n = ARGV[0] ? ARGV[0].to_i : 5
tweets = TweetRegurgitator.new('tweets.csv').generate_tweets(n)
tweets.each{|t| p t}
