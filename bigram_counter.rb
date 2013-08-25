a = []	# array of text
b = []	# bigrams of array a

a = File.read("input.txt").scan(PATT= /\w+/)

#the bigram-loop pairs neighboring words
i1, i2 = 0, 1
while i2 < a.length - 1
	i2 = i1 + 1
	b.push("#{a[i1]} #{a[i2]}")
	i1 += 1
end
b.sort

c = b.uniq   # unique bigrams from array b
h = Hash.new

#counts occurrences of bigrams
c.each {|hash| 	key = b.count hash
		h[hash] = key		}

#sorts hash by bigram frequency # how high to low?
h = h.sort_by() {|k, v| v}

p h
