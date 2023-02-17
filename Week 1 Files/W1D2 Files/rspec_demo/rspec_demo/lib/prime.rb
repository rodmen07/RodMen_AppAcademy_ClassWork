def prime?(num)
    return false if num < 2
    (2...num).each { |divisor| return false if num % divisor == 0 }
    return true
end
