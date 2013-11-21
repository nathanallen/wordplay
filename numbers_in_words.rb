NUM_WORDS = {
  0=>"zero", 1=>"one", 2=>"two", 3=>"three", 4=>"four", 5=>"five", 6=>"six", 7=>"seven", 
  8=>"eight", 9=>"nine", 10=>"ten", 11=>"eleven", 12=>"twelve", 13=>"thirteen", 
  14=>"fourteen", 15=>"fifteen", 16=>"sixteen", 17=>"seventeen", 18=>"eighteen", 
  19=>"nineteen", 20=>"twenty", 30=>"thirty", 40=>"fourty", 50=>"fifty",
  60=>"sixty", 70=>"seventy", 80=>"eighty", 90=>"ninety", 100=>"hundred",
  1000=>"thousand", 1000000=>"million", 1000000000=>"billion", 1000000000000=>"trillion"
}

def in_words(n)
  n_array = n.to_s.chars.map { |n| n.to_i }.reverse
  stop_index = n_array.length - 1
  output = []
  i = 0

  while i <= stop_index
    remainder = (i+1)%3
    n_current = n_array[i]
    unit = (10**((i/3)*3) unless i<3) || nil

    if remainder == 1 && unit && n_array[i..i+2].inject(:+) != 0
      output << NUM_WORDS[unit]
    end 

    if n_current != 0
      if remainder == 0
        output << NUM_WORDS[100]
        output << NUM_WORDS[n_current]
      end
      if remainder == 2
        tens = n_current*10
        tens += n_array[i-1] if n_current == 1
        output << NUM_WORDS[tens]
      end
      if remainder == 1
        next_num = n_array[i+1]
        if (2..9).include?(next_num)
          output << NUM_WORDS[next_num*10] + "-" + NUM_WORDS[n_current]
          i+=1
        elsif next_num != 1
          output << NUM_WORDS[n_current]
          output << "and" if next_num == 0
        end
      end
    end

    i += 1
  end

  return NUM_WORDS[n] if n == 0
  return output.reverse.join(' ')
end

puts in_words(ARGV.first.to_i)

__END__
Test code:
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