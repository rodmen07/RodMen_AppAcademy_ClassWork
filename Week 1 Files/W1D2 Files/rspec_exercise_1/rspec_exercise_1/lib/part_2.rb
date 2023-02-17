def hipsterfy(word)
    vowels = "aeiou"
    index = 0
    word.each_char.with_index do |char, i|
        index = i if vowels.include?(char)
    end
    if index != 0
        return word[0...index] + word[index + 1..-1]
    elsiif index == 0 && vowels.include?(word[0])
        return word[0...index] + word[index + 1..-1]
    else
        return word
    end
end

def vowel_counts(str)
    vowels = 'aeiou'
  	hash = Hash.new(0)
  	str.downcase.each_char do |char|
        	if vowels.include?(char)
              	hash[char] += 1
            end
        end
    end
  	return hash
end

def caesar_cipher(str, n)
	alphabet = "abcdefghijklmnopqrstuvwxyz"
  	new_str = ''
  	str.each_char { |char| alphabet.include?(char) ? new_str += alphabet[(alphabet.index(char) + n) % 26] : new_str += char }
  	return new_str
end
