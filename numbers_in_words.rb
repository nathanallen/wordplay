NUM_WORDS = {
  1=>"one", 2=>"two", 3=>"three", 4=>"four", 5=>"five", 6=>"six", 7=>"seven", 
  8=>"eight", 9=>"nine", 10=>"ten", 11=>"eleven", 12=>"twelve", 13=>"thirteen", 
  14=>"fourteen", 15=>"fifteen", 16=>"sixteen", 17=>"seventeen", 18=>"eighteen", 
  19=>"nineteen", 20=>"twenty", 30=>"thirty", 40=>"fourty", 50=>"fifty",
  60=>"sixty", 70=>"seventy", 80=>"eighty", 90=>"ninety", 100=>"hundred",
  1000=>"thousand", 1000000=>"million", 1000000000=>"billion", 1000000000000=>"trillion"
}

def in_words(n)
  decimals = n.to_s.length-1
  decimals < 3 ? ten_to_the_n = 10**decimals : ten_to_the_n = 10**(3*(decimals/3))
  remainder = n/ten_to_the_n

  case n
    when 100...1_000_000_000_000_000
    return "#{in_words(remainder)} #{NUM_WORDS[ten_to_the_n]} #{in_words(n%ten_to_the_n)}"
    when 20...100
    return "#{NUM_WORDS[remainder*10]} #{in_words(n%ten_to_the_n)}"
    when 1...20
    return "#{NUM_WORDS[n]}"
    when n == 0
    return
  end
end
 
puts in_words(ARGV.first.to_i)