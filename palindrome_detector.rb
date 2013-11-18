class String
  def palindrome?
    cannonical_word = self.downcase.chomp.gsub(/\W/,"")
    cannonical_word == cannonical_word.reverse
  end  
end

user_input = ARGV.first || gets
result = user_input.palindrome?

p result