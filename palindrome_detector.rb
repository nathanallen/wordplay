class Palindrome

	def initialize ( input )
		$input = input.chomp
		@input = input.downcase.chomp.gsub(/\W/, "") 
		#makes string lowercase, removes line break and nonword chars
	end

	def palindrome?
		if @input == @input.reverse
			puts "Success!\"#{$input.chomp}\" is a palindrome!"
			true
		else
			puts "Sorry, that's not a palindrome."
			puts "Try again!"
			false
		end
	end	

end

while true
	puts "Insert some text and I'll tell you if it's a palindrome"
	text = Palindrome.new ( gets )

	if
		text.palindrome?
		break
	end
end
