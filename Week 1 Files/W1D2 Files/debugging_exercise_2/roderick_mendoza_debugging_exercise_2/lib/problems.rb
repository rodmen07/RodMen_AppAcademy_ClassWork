# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
    arr = []
        (2..num).each do |i|
            if is_prime(i) && num % i == 0
                arr << i
            end
        end
    return arr[-1]
end

def is_prime(num)
    if num < 2
        return false
    end

    (2...num).each do |i|
        if num % i == 0
            return false
        end
    end

    return true
end

def unique_chars?(str)
    counter = Hash.new(0)
    str.each_char { |char| counter[char] += 1 }
    counter.each_value { |v| return false if v >= 2 }
    return true
end

def dupe_indices(array)
    indices = Hash.new { |h, k| h[k] = [] }
    array.each_with_index { |ele, i| indices[ele] << i }
    indices.select { |ele, indices| indices.length > 1 }
end

def ana_array(arr_1, arr_2)
    return arr_count(arr_1) == arr_count(arr_2)
end

def arr_count(arr)
    count = Hash.new(0)
    arr.each{ |ele| count[ele] += 1 }
    return count
end
