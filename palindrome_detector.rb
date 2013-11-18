def palindrome?(input)
  cannonical_word = input.downcase.chomp.gsub(/\W/,"")
  cannonical_word == cannonical_word.reverse
end  

user_input = ARGV.first || gets
result = palindrome?(user_input)

p result