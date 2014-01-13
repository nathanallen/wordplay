###n-gram frequency counter
An n-gram is a sequence of words, such as a bigram (two words) or trigram (a sequence of three words). The n-gram counter accepts a file path and an optional integer as arguments. By default it will count trigrams and return the top ten. On the command line run:
```
ruby n_gram_counter.rb [filename.txt] [n]
```

###Markov Tweet Generator
Given a sample file of real tweets, calculates the probability of a word following another word. Then, outputs a probable (albeit gibberish) sequence of words. On the command line run:
```
ruby markov_tweet_generator.rb
```

###numbers in words
Given an integer between zero and the high trillions, returns the natural language equivalent. On the command line run:
```
ruby shakesperian_insults.rb [n]
```

###Shakesperian insults
Returns a randomly generated shakesperian insult. On the command line run:
```
ruby shakesperian_insults.rb
```

###palindrome detector
One of the first programs I wrote in Ruby. Accepts a string and returns a boolean if it is a palindrome (a word or phrase that reads the same backwards and forwards). On the command line run:
```
ruby palindrome_detector.rb "A man, a plan, a canal: Panama."
```
