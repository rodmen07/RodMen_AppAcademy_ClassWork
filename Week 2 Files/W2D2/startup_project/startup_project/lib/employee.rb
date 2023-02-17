class Employee
    def initialize(name, title)
        @name = name
        @title = title
        @earnings = 0
    end

    attr_reader :name, :title

    def pay(num)
        @earnings += num
    end
end
