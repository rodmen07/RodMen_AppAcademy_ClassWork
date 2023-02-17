def partition(arr, num)
    new_arr = Array.new(2) {Array.new}
    arr.each { |ele| ele < num ? new_arr[0] << ele : new_arr[1] << ele }
    new_arr
end

def merge(hash_1, hash_2)
    new_hash = Hash.new(0)
    hash_1.each { |key_1, value_1| new_hash[key_1] = value_1 }
    hash_2.each { |key_2, value_2| new_hash[key_2] = value_2 }
    new_hash
end

def censor(str, arr)
    new_words = []
    words =  str.split (" ")
    words.each { |word| arr.include?(word.downcase) ? new_words << censor_word(word) : new_words << word }
    new_words.join(" ")
end

def censor_word(word)
    vowels = 'aeiou'
    word.each_char.with_index { |char, i| word[i] = "*" if vowels.include?(char.downcase) }
    word
end

def power_of_two?(num)
    return true if num == 1
    return false if num.odd?
    i = 2
    while i < num / 2
        if (num / i).odd?
            return false
        end
        i *= 2
    end
    return true
end
