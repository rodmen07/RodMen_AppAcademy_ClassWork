def first_letter_vowel_count(sentence)
    count = 0
    vowels = "aeiou"
    words = sentence.split(" ")
    words.each { |word| count += 1 if vowels.include?(word[0].downcase) }
    count
end

def count_true(arr, prc)
    count = 0
    arr.each { |ele| count += 1 if prc.call(ele) }
    count
end

def procformation(arr, prc_1, prc_2, prc_3)
    new_arr = arr.map do |ele|
        condition = true
        condition = false if prc_1.call(ele) == false
        if condition == true
            prc_2.call(ele)
        else
            prc_3.call(ele)
        end
    end
    new_arr
end

def array_of_array_sum(arr)
    new_arr = arr.flatten
    sum = 0
    new_arr.each { |num| sum += num }
    sum
end

def selective_reverse(sentence)
    new_arr = []
    vowels = "aeiou"
    words = sentence.split(" ")
    words.each_with_index do |word, i|
        if !vowels.include?(word[0].downcase)
            new_arr << word.reverse
        else
            new_arr << word
        end
    end
    return new_arr.join(" ")
end

def hash_missing_keys(hash, *args)
    new_arr = args.select { |arg| !hash.has_key?(arg)}
end
