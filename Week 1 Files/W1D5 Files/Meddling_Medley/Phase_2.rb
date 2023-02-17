def conjunct_select(arr, *prcs)
    new_arr = []
    arr.each do |ele|
        value = true
        prcs.each do |prc|
            value = false if !prc.call(ele)
        end
        new_arr << ele if value == true
    end
    new_arr
end

# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

def convert_pig_latin(sentence)
    words = sentence.split(' ')
    new_words = words.map do |word|
        new_word = word.length > 2 ? convert_word(word) : word
        word == word.capitalize ? new_word.capitalize : new_word
    end
    new_words.join(' ')
end

def convert_word(word)
    vowels = 'AEIOUaeiou'
    return word + 'yay' if vowels.include?(word[0])
    word.each_char.with_index do |char, i|
        if vowels.include?(char)
            return word[i..-1] + word[0...i] + 'ay'
        end
    end
end



p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"
