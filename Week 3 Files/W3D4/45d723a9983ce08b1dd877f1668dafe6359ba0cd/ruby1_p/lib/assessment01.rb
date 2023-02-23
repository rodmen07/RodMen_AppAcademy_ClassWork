class Array
  # Write an `Array#my_inject` method. If my_inject receives no argument, then
  # use the first element of the array as the default accumulator.
  # **Do NOT use the built-in `Array#inject` or `Array#reduce` methods in your
  # implementation.**

  def my_inject (accumulator = nil, &block)
    if accumulator == nil
      accumulator = self.first
      self[1..-1].each { |item| accumulator = block.call(accumulator, item) }
    else
      self.each { |item| accumulator = block.call(accumulator, item) }
    end
    accumulator
  end
end



# Define a method `primes(num)` that returns an array of the first "num" primes.
# You may wish to use an `is_prime?` helper method.

def is_prime?(num)
  return false if num < 2
  (2...num).each { |divisor| return false if num % divisor == 0 }
  true
end

def primes(num)
  arr = []
  i = 2
  until arr.length == num
    arr << i if is_prime?(i)
    i += 1
  end
  arr
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num == 1
  return [1,1] if num == 2
  arr = factorials_rec(num - 1)
  (3..num).each { |ele|  arr += factorial(ele) }
end

def factorial(n)
  return 1 if n == 1
  (1...n).inject { |acc, multiple| acc *= multiple }
end

class Array
  # Write an `Array#dups` method that will return a hash containing the indices
  # of all duplicate elements. The keys are the duplicate elements; the values
  # are arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    hash = Hash.new { |h, k| h[k] = [] }
    self.each.with_index do |ele, i|
      hash[ele] << i
    end
    hash.select { |k, v| v.length > 1 }
  end
end

class String
  # Write a `String#symmetric_substrings` method that returns an array of
  # substrings that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    sub_strings = []
    palindromes = []
    self.each_char.with_index do |char_1, i|
      self.each_char.with_index do |char_2, j|
        sub_strings << self[i..j] if i < j
        end
      end
      sub_strings.each do |ele|
          mid_idx = ele.length / 2
          palindromes = sub_strings.select { |ele| is_palindrome?(ele) }
      end
      palindromes
  end
end

def is_palindrome?(str)
  mid_idx = str.length / 2
  return str[0..mid_idx] == str[mid_idx..-1].reverse
end

class Array
  # Write an `Array#merge_sort` method; it should not modify the original array.
  # **Do NOT use the built in `Array#sort` or `Array#sort_by` methods in your
  # implementation.**

  def merge_sort(&prc)
    Array.merge(0,0) {}
    return self
  end

  private
  def self.merge(left, right, &prc)
  end
end
