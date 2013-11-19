NUM_WORDS = {
  0=>"zero", 1=>"one", 2=>"two", 3=>"three", 4=>"four", 5=>"five", 6=>"six", 7=>"seven", 
  8=>"eight", 9=>"nine", 10=>"ten", 11=>"eleven", 12=>"twelve", 13=>"thirteen", 
  14=>"fourteen", 15=>"fifteen", 16=>"sixteen", 17=>"seventeen", 18=>"eighteen", 
  19=>"nineteen", 20=>"twenty", 30=>"thirty", 40=>"fourty", 50=>"fifty",
  60=>"sixty", 70=>"seventy", 80=>"eighty", 90=>"ninety", 100=>"hundred",
  1000=>"thousand", 1000000=>"million", 1000000000=>"billion", 1000000000000=>"trillion"
}

class Integer
  def length
    to_s.length
  end

  def powers_of_ten
    length - 1
  end

  def unit
    (10**self.powers_of_ten)
  end

  def first
    to_s[0].to_i
  end

  def something
    self.first * self.unit
  end

  def remainder
    modulo(self.something)
  end

  def to_a
    to_s.chars.map { |n| n.to_i }
  end

  def three_by_three
    output = []
    n_array = self.to_a
    remainder = n_array.length%3
    output << n_array.slice!(0,remainder) if remainder != 0
    output << n_array.slice!(0,3) while n_array.length > 0
    output
  end
end


# def in_words(n)
#   output = []
#   n_array = n.three_by_three
#   while n_array
#     current_chunk = n_array.slice!(0)
#     p current_chunk
#     case num = current_chunk.join.to_i
#       when 0..20
#         output << NUM_WORDS[num]
#       when 21...100
#         output << NUM_WORDS[num.something]
#         output << NUM_WORDS[num.remainder]
#       when 100...1_000_000_000_000_000
#         output << NUM_WORDS[num.first]
#         output << NUM_WORDS[num.something]
#         output << NUM_WORDS[num%num.something]
#     end
#   end

# return output.join(' ')
# end

# puts in_words(0) == "zero"
# puts in_words(1) == "one"
# puts in_words(10) == "ten"
# puts in_words(19) == "nineteen"
# puts in_words(20) == "twenty"
# puts in_words(21) == "twenty one"
# puts in_words(100) #== "one hundred"
# puts in_words(101) == "one hundred one"
# puts in_words(110) == "one hundred ten"
# puts in_words(1000) #== "one thousand"
# puts in_words(10000) #== "ten thousand"
# # puts in_words(11101) #== "eleven thousand one hundred one"
# # puts in_words(100000) #== "one hundred thousand"


__END__
##Test code:

## three_by_three method:
# puts 1.three_by_three == [[1]]
# puts 10.three_by_three == [[1,0]]
# puts 100.three_by_three == [[1,0,0]]
# puts 1000.three_by_three == [[1],[0,0,0]]
# puts 1000000.three_by_three == [[1],[0,0,0],[0,0,0]]