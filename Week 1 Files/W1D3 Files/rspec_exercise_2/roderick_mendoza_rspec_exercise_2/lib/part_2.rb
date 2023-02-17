def palindrome?(str)
    midpoint = str.length / 2
    (0...midpoint).each do |i|
        return false if str[i] != str[str.length - 1 - i]
    end
    return true
end

def substrings(str)
    arr = []
    str.each_char.with_index do |char_1, i|
        str.each_char.with_index do |char_2, j|
            arr << str[i..j] if i <= j
        end
    end
    arr
end

def palindrome_substrings(str)
    arr = []
    sub_strings = substrings(str)
    arr = sub_strings.select { |ele| palindrome?(ele) && ele.length > 1}
    arr
end
