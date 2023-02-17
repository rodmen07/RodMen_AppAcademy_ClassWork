def hipsterfy(word)
    vowels = "aeiou"
    i = word.length - 1
    while i >= 0
        return word[0...i] + word [i+1..-1] if vowels.include?(word[i])
        i -= 1
    end

    word

end

def vowel_counts(str)
    vowels = 'aeiou'
  	counts = Hash.new(0)
  	str.each_char { |char| counts[char.downcase] += 1 if vowels.include?(char.downcase) }
  	return counts
end

def caesar_cipher(str, n)
	alphabet = ("a".."z").to_a
  	new_str = ''
  	str.each_char { |char| alphabet.include?(char) ? new_str += alphabet[(alphabet.index(char) + n) % 26] : new_str += char }
  	return new_str
end
