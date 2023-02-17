# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array

    def span
        self.length > 0 ? self.max - self.min : nil
    end

    def average
        self.length > 0 ? self.sum.to_f / self.length : nil
    end

    def median
        if self.length.odd?
            self.sort[(self.length - 1) / 2]
        elsif self.length.even? && self.length > 1
            (self.sort[self.length / 2] + self.sort[(self.length - 1) / 2]) / 2.0
        else
            nil
        end
    end

    def counts
        hash = Hash.new(0)
        self.each { |ele|hash[ele] += 1 }
        hash
    end

    def my_count(value)
        count = 0
        self.each { |ele| count += 1 if ele == value }
        count
    end

    def my_index(value)
        self.each.with_index { |ele, i| return i if ele == value}
        nil
    end

    def my_uniq
        hash = Hash.new(0)
        self.each { |ele| hash[ele] += 1}
        hash.keys
    end

    def my_transpose
        new_arr = Array.new(self.length) { Array.new(self[0].length) }
        self.each.with_index do |subarray, i|
            subarray.each.with_index do |ele, j|
                new_arr[j][i] = subarray[j]
            end
        end
        new_arr
    end

end
