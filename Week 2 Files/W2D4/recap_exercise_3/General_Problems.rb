def no_dupes?(arr)
    new_arr = []
    counts = Hash.new(0)
    arr.each do |ele|
        counts[ele] += 1
    end
    counts.each { |k, v| new_arr << k if v == 1}
    new_arr
end

# Examples
# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(arr)
    (0...arr.length - 1).each do |i|
        if arr[i] == arr[i+1]
            return false
        end
    end
    true
end

# Examples
# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
    hash = Hash.new([])
    str.each_char.with_index do |char, i|
        hash[char] += [i]
    end
    hash
end

# Examples
# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}


def longest_streak(str) #aaabbb
    longest_count = 1
    longest_str = str[0]
    count = 1
    (0...str.length).each do |i|
        if str[i] == str[i +1]
            count += 1
        elsif (i == str.length - 1) || (str[i] !=str[i+1])
            if count >= longest_count
                longest_count = count
                longest_str = str[i] * count
                count = 1
            end
        end
    end
    longest_str
end

# Examples
# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'
