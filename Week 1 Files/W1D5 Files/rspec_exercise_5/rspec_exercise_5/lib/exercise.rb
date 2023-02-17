def zip(*arr)
    new_arr = []
    arr.transpose.each { |sub_arr| new_arr << sub_arr }
    new_arr
end

def prizz_proc(arr, prc_1, prc_2)
    new_arr = []
    arr.each { |ele| new_arr << ele if (prc_1.call(ele) && !prc_2.call(ele)) || (!prc_1.call(ele) && prc_2.call(ele)) }
    new_arr
end

def zany_zip(*arrays)
    length = arrays.map(&:length).max
    (0...length).map do |i|
        arrays.map { |array| array[i] }
    end
end

def maximum(arr , &prc)
    max = 0
    max = arr.inject { |acc, ele| prc.call(acc).abs <= prc.call(ele).abs ?  ele : acc }
    max
end

def my_group_by(arr, &prc)
    hash = Hash.new { |k, v| k[v] = []}
    arr.each { |ele| hash[prc.call(ele)] << ele }
    hash
end

def max_tie_breaker(arr, prc_1, &prc_2)
    arr.inject do |acc, ele|
        if prc_2.call(ele) > prc_2.call(acc)
            ele
        else
            acc
        end
    end
end

def silly_syllables(sent)
    words = sent.split(" ")
    new_words = []
    words.each { |word| new_words << letter_remover(word) }
    new_sent = new_words.join(" ")
    new_sent
end

def letter_remover(word)
    vowels = 'aeiou'
    count = 0
    new_word = ""
    first_idx = nil
    last_idx = nil
    word.each_char{ |char| count += 1 if vowels.include?(char) }
    if count < 2
        new_word = word
    else
        word.each_char.with_index do |char, i|
            if vowels.include?(char)
                first_idx = i
                break
            end
        end
        word.each_char.with_index do |char, i|
            last_idx = i if vowels.include?(char)
        end
        new_word = word[first_idx..last_idx]
    end
    new_word
end
