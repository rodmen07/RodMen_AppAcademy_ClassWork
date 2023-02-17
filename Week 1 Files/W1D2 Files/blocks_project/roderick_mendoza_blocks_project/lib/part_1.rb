def select_even_nums (arr)
    arr.select(&:even?)
end

def reject_puppies(arr)
    arr.reject { |puppy| puppy["age"] <= 2 }
end

def count_positive_subarrays(arr_2d)
    arr_2d.count { |arr| arr.sum > 0}
end

def aba_translate(sent)
    translated_sent = ""
    words = sent.split
    new_words = []
    words.each do |word|
        if word == word.capitalize
            word = word.downcase
            new_words << word_translator(word).capitalize
        else
            new_words << word_translator(word)
        end
    end
    translated_sent = new_words.join(" ")
    return translated_sent
end

def word_translator(word)
    translated_word = ""
    vowels = 'aeiou'
    word.each_char.with_index { |char, i| vowels.include?(char) ? translated_word << char + "b" + char : translated_word << char }
    return translated_word
end

def aba_array(arr)
    arr.map { |word| aba_translate(word) }
end
