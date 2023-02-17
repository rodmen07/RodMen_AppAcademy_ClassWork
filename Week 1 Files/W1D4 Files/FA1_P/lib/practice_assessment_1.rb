def first_letter_vowel_count(sentence)
    count = 0
    vowels = "aeiou"
    words = sentence.split(" ")
    words.each { |word| count += 1 if vowels.include?(word[0].downcase)}
    count
end

def count_true(arr, prc)
    arr.count { |ele| prc.call(ele) }
end


def procformation(arr, prc_1, prc_2, prc_3)
    arr.map do |ele|
        if prc_1.call(ele)
            prc_2.call(ele)
        else
            prc_3.call(ele)
        end
    end
end

def array_of_array_sum(arr)
    arr.flatten.sum
end

def selective_reverse(sentence)
    words = sentence.split(" ")
    vowels = "aeiou"
    new_words = []
    words.each_with_index do |word, i|
        if vowels.include?(word[0].downcase) || vowels.include?(word[-1].downcase)
            new_words << word
        else
            new_words << word.reverse
        end
    end
    new_words.join(" ")
end

def hash_missing_keys(hash, *args)
    args.select { |ele| !hash.has_key?(ele) }
end
