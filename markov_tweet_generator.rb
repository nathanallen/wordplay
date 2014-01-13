require 'CSV'

tweets = CSV.parse(File.read('tweets.csv'))

word_freqs = {}

for i in 1..(tweets.length-1)
  words_in_tweet = tweets[i][5].split(' ')
  words_in_tweet.each_index do |word_index|
  current_word = words_in_tweet[word_index]
  next_word = words_in_tweet[word_index + 1]

    if word_freqs[current_word]
      if word_freqs[current_word][next_word]
        word_freqs[current_word][next_word] += 1
      else
        word_freqs[current_word][next_word] = 1
      end
    else
      word_freqs[current_word] = {next_word => 1} unless next_word.nil?
    end
  end
end

word_probabilities = word_freqs.each_value do |next_word_freqs|
    total = next_word_freqs.values.inject(:+)
    next_word_freqs.each_pair do |k,v|
      next_word_freqs[k] = v.fdiv(total).round(3)
    end
end

rand_key = rand(word_probabilities.keys.length)
seed_word = word_probabilities.keys[rand_key]

output = []
output << seed_word

until output[-1].nil?
  seed_word = output[-1]
  if word_probabilities[seed_word]
    roll = rand(1..100).fdiv(100).round(3)
    probability = 0
    word_probabilities[seed_word].each_pair do |k,v|
      probability += v
      if probability >= roll
        output << k
        break
      end
    end
  else
    output << nil
  end
end

p output.join(' ')