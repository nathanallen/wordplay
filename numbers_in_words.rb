NUM_WORDS = {
  0=>"zero", 1=>"one", 2=>"two", 3=>"three", 4=>"four", 5=>"five", 6=>"six", 7=>"seven", 
  8=>"eight", 9=>"nine", 10=>"ten", 11=>"eleven", 12=>"twelve", 13=>"thirteen", 
  14=>"fourteen", 15=>"fifteen", 16=>"sixteen", 17=>"seventeen", 18=>"eighteen", 
  19=>"nineteen", 20=>"twenty", 30=>"thirty", 40=>"fourty", 50=>"fifty",
  60=>"sixty", 70=>"seventy", 80=>"eighty", 90=>"ninety", 100=>"hundred",
  1000=>"thousand", 1000000=>"million", 1000000000=>"billion", 1000000000000=>"trillion"
}

def in_words(number)
  a = number.to_delimited_array
  words = []

  while a.length > 0
    starting_words_length = words.length
    unit = (10**((a.length-1)*3) unless a.length == 1) || nil
    nums = a.slice!(0)
    hundreds_place = nums[-3] || 0
    tens_place = nums[-2] || 0
    ones_place = nums[-1]
    if hundreds_place != 0
      words << NUM_WORDS[hundreds_place]
      words << NUM_WORDS[100]
      if tens_place == 0 && ones_place != 0
        words << "and"
      end
    end
    if tens_place == 1
      teens = [tens_place, ones_place].join.to_i
      words << NUM_WORDS[teens]
    elsif tens_place != 0
      words << NUM_WORDS[tens_place*10]
      if ones_place != 0
        words[-1] += "-" + NUM_WORDS[ones_place]
      end
    elsif ones_place != 0
      words << NUM_WORDS[ones_place]
    end
    words << NUM_WORDS[unit] if unit && starting_words_length != words.length
  end

  return NUM_WORDS[number] if number == 0
  return words.join(' ')
end

class Integer
  def to_a
    to_s.chars.map { |n| n.to_i }
  end

  def to_delimited_array
    nums = self.to_a.reverse
    a = []
    a << nums.slice!(0,3).reverse while nums.length > 0
    a.reverse
  end
end

def calculate_unit(delimited_array)
 10**((delimited_array.length-1)*3) unless delimited_array.length == 1
end

puts in_words(ARGV.first.to_i)

__END__
#Test code:
puts in_words(0) == "zero"
puts in_words(1) == "one"
puts in_words(10) == "ten"
puts in_words(19) == "nineteen"
puts in_words(20) == "twenty"
puts in_words(21) == "twenty-one"
puts in_words(100) == "one hundred"
puts in_words(101) == "one hundred and one"
puts in_words(110) == "one hundred ten"
puts in_words(1000) == "one thousand"
puts in_words(10000) == "ten thousand"
puts in_words(11101) == "eleven thousand one hundred and one"
puts in_words(100000) == "one hundred thousand"
puts in_words(1000000) == "one million"
puts in_words(1_111_111_111) == "one billion one hundred eleven million one hundred eleven thousand one hundred eleven"

puts 1.to_delimited_array == [[1]]
puts 10.to_delimited_array == [[1,0]]
puts 100.to_delimited_array == [[1,0,0]]
puts 1000.to_delimited_array == [[1],[0,0,0]]
puts 1000000.to_delimited_array == [[1],[0,0,0],[0,0,0]]