def average(num_1, num_2)
    return (num_1.to_f + num_2) / 2.0
end

def average_array(arr)
    sum = arr.inject { |acc, ele| acc += ele }
    return sum.to_f / arr.length
end

def repeat(str, num)
    return str * num
end

def yell(str)
    return str.upcase + "!"
end

def alternating_case(str)
    arr = str.split(" ")
    new_arr = arr.map.with_index { |word, i| i % 2 == 0 ? word.upcase : word.downcase }
    return new_arr.join(" ")
end
