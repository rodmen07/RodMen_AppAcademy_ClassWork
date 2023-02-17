def proper_factors(num)
    new_arr = []
    (1...num).each { |divisor| new_arr << divisor if num % divisor == 0 }
    new_arr
end

def aliquot_sum(num)
    proper_factors(num).sum
end

def perfect_number?(num)
    aliquot_sum(num) == num
end

def ideal_numbers(n)
    i = 0
    j = 1
    new_arr = []
    while i < n
        if perfect_number?(j)
            new_arr << j
            i += 1
        end
        j += 1
    end
    return new_arr

end
