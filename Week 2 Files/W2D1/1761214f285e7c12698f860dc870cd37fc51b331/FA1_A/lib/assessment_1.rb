def my_map!(arr, &prc)
    arr.each.with_index { |ele, i| arr[i] = prc.call(ele) }
end

def two?(arr, &prc)
    count = 0
    arr.each { |ele| count += 1 if prc.call(ele)}
    count == 2 ? true : false
end

def nor_select(arr, prc_1, prc_2)
    arr.select { |ele| ( !prc_1.call(ele) && !prc_2.call(ele) ) }
end

def array_of_hash_sum(arr)
    sum = 0
    arr.each do |hash|
        hash.each_value do |v|
            sum += v
        end
    end
    sum
end

# def slangify(sentence)
#     words = sentence.split(" ")
#     new_words = words.map { |word| first_vowel_remove(word) }
#     new_words.join(" ")
# end

# def first_vowel_remove(word)
#     vowels = "aeiou"
#     new_word = ""
#     word.each_char.with_index do |char, i|
#         if vowels.include?(char)
#             new_word = word[0...i] + word[i + 1..-1]
#         end
#     end
# end

# def char_counter(str, *chars)
#     counts = Hash.new(0)
#     if chars.length < 1
#         str.each_char do |char|
#             counts[char] += 1
#         end
#     elsif chars.length >= 1
#         chars.each do |char_1|
#             str.each_char do |char_2|
#                 if char_1 == char_2
#                     counts[char_1] += 1
#                 else
#                     counts[char_1]
#                 end
#             end
#         end
#     end
#     counts
# end

def slangify(sentence)
    words = sentence.split(" ")
    new_words = words.map { |word| first_vowel_remove(word) }
    new_words.join(" ")
end

def first_vowel_remove(word)
    vowels = 'aeiou'
    new_word = ""
    word.each_char.with_index do |char, i|
        if vowels.include?(char)
            if word.length == 2 && i == 0
                return word[1]
            elsif word.length == 2 && i == 1
                return word[0]
            end
            new_word = word[0...i] + word[i + 1..-1]
            break
        end
        new_word = word if !word.include?(vowels)
    end
    new_word
end

def char_counter(str, *args)
    counts = Hash.new(0)
    if args.length < 1
        str.each_char do |char|
            counts[char] += 1
        end
    else
        args.each do |arg|
            str.each_char do |char|
                if char == arg
                    counts[arg] += 1
                end
            end
            if !str.include?(arg)
                counts[arg] = 0
            end
        end
    end
    counts
end
