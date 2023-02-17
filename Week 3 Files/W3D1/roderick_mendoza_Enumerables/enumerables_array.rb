class Array
    def my_each(&prc)
        i = 0
        new_arr = []
        while i < self.length
            new_arr << prc.call(self[i])
            i += 1
        end
        self
    end

    def my_select(&prc)
        new_arr = []
        self.my_each do |ele|
            new_arr << ele if prc.call(ele)
        end
        new_arr
    end

    def my_reject(&prc)
        new_arr = []
        self.my_each do |ele|
            new_arr << ele if !prc.call(ele)
        end
        new_arr
    end

    def my_any?(&prc)
        self.my_each do |ele|
            return true if prc.call(ele)
        end
        false
    end

    def my_all?(&prc)
        self.my_each do |ele|
            return false if !prc.call(ele)
        end
        true
    end

    def my_flatten
        return [] if self == []

        new_arr = self.pop
        self.my_flatten
        new_arr
    end

    def my_zip
    end

    def my_rotate
    end

    def my_join
    end

    def my_reverse
    end

    def factors(num)
    end

    def bubble_sort!(&prc)
    end

    def bubble_sort(&prc)
    end

    def substrings(string)
    end

    def subwords(word, dictionary)
    end
end
