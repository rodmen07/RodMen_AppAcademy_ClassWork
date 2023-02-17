def is_prime?(num)
    return false if num < 2
    (2...num).each { |divisor| return false if num % divisor == 0 }
    return true
end

def nth_prime(num)
    arr_of_primes = []
    i = 0
    j = 2
    while i < num
        if is_prime?(j)
            arr_of_primes << j
            i += 1
        end
        j += 1
    end
    return arr_of_primes[-1]
end

def prime_range(num_1, num_2)
    new_arr = []
    (num_1..num_2).each do |ele|
        new_arr << ele if is_prime?(ele)
    end
    return new_arr
end
