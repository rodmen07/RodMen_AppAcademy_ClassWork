# Write a method, union, that accepts any number of arrays as arguments.
# The method should return an array containing all elements of the given arrays.
def union(arr, *add_arr)
    add_arr.inject(arr) { |acc, ele| acc += [*ele] }
end

# p union(["a", "b"], [1, 2, 3]) # => ["a", "b", 1, 2, 3]
# p union(["x", "y"], [true, false], [20, 21, 23]) # => ["x", "y", true, false, 20, 21, 23]
