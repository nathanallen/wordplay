NUM_WORDS = {
  0=>"zero", 1=>"one", 2=>"two", 3=>"three", 4=>"four", 5=>"five", 6=>"six", 7=>"seven", 
  8=>"eight", 9=>"nine", 10=>"ten", 11=>"eleven", 12=>"twelve", 13=>"thirteen", 
  14=>"fourteen", 15=>"fifteen", 16=>"sixteen", 17=>"seventeen", 18=>"eighteen", 
  19=>"nineteen", 20=>"twenty", 30=>"thirty", 40=>"fourty", 50=>"fifty",
  60=>"sixty", 70=>"seventy", 80=>"eighty", 90=>"ninety", 100=>"hundred",
  1000=>"thousand", 1000000=>"million", 1000000000=>"billion", 1000000000000=>"trillion"
}

class Integer
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


def in_words(n)
  output = []
  n_array = n.three_by_three
  while n_array.length > 0
    unit = nil
    unit = NUM_WORDS[10**(n_array.length+1)] unless n_array.length == 1
    current_chunk = n_array.slice!(0)
    if current_chunk[-3] != nil && current_chunk[-3] != 0
# p "1st"
      output << NUM_WORDS[current_chunk[-3]]
      output << NUM_WORDS[100]
    end
    if current_chunk[-2] == (1 || 2) 
# p "2nd"
      output << NUM_WORDS[current_chunk[-2..-1].join.to_i]
    elsif current_chunk[-2] != nil && current_chunk[-2] >= 2 
# p "3rd"
      output << NUM_WORDS[current_chunk[-2]*10]
      output << NUM_WORDS[current_chunk[-1]] unless current_chunk[-1] == 0
    elsif current_chunk[-1] != nil
# p "4th"
      output << NUM_WORDS[current_chunk[-1]] unless current_chunk[-1] == 0
    end
      output << unit if unit
  end
#p output
return output.join(' ')
end

puts in_words(0) == "zero"
puts in_words(1) == "one"
puts in_words(10) == "ten"
puts in_words(19) == "nineteen"
puts in_words(20) == "twenty"
puts in_words(21) == "twenty one"
puts in_words(100) == "one hundred"
puts in_words(101) == "one hundred one"
puts in_words(110) == "one hundred ten"
puts in_words(1000) == "one thousand"
puts in_words(10000) == "ten thousand"
puts in_words(11101) == "eleven thousand one hundred one"
puts in_words(100000) == "one hundred thousand"


__END__
##Test code:

## three_by_three method:
# puts 1.three_by_three == [[1]]
# puts 10.three_by_three == [[1,0]]
# puts 100.three_by_three == [[1,0,0]]
# puts 1000.three_by_three == [[1],[0,0,0]]
# puts 1000000.three_by_three == [[1],[0,0,0],[0,0,0]]