class Item
    def self.valid_date?(date_string)
        new_arr = date_string.split("-")
        new_arr.map!(&:to_i)
        return false if new_arr[1] < 1 || new_arr[1] > 12
        return false if new_arr[2] < 1 || new_arr[2] > 31
        return true
    end

    def initialize(title, deadline, description)
        @title = title
        raise ArgumentError.new "invalid date for deadline" if !Item.valid_date?(deadline)
        @deadline = deadline
        @description = description
    end

    attr_accessor :title, :deadline, :description
end

# p Item.valid_date?('2019-10-25') # true
# p Item.valid_date?('1912-06-23') # true
# p Item.valid_date?('2018-13-20') # false
# p Item.valid_date?('2018-12-32') # false
# p Item.valid_date?('10-25-2019') # false
# Item.new('Fix login page', '2019-10-25', 'The page loads too slow.')

# Item.new(
#     'Buy Cheese',
#     '2019-10-21',
#     'We require American, Swiss, Feta, and Mozzarella cheese for the Happy hour!'
# )

# Item.new(
#     'Fix checkout page',
#     '10-25-2019',
#     'The font is too small.'
# ) # raises error due to invalid date

