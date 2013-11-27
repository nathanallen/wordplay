###n-gram frequency counter
An n-gram is a sequence of words, such as a bigram (two words) or trigram (a sequence of three words). The n-gram counter accepts a file path and an optional integer as arguments. By default it will count trigrams and return the top ten. On the command line run:
```
ruby n_gram_counter.rb [filename.txt] [n]
```
Known bugs:  
- does not handle utf-8 encoded characters

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
Accepts a string and returns a boolean if it is a palindrome (a word or phrase that reads the same backwards and forwards). On the command line run:
```
ruby palindrome_detector.rb "A man, a plan, a canal: Panama."
```
