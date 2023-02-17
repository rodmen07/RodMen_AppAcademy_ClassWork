require_relative 'item.rb'

class List
    def initialize(label)
        @label = label
        @items = []
    end

    attr_accessor :label

    def add_item(title, deadline, description = "")
        begin
            @items << Item.new(title, deadline, description)
            return true
        rescue ArgumentError => e
            puts "#{e.message} #{deadline}"
            return false
        end
    end

    def list_size
        @items.length
    end

    def valid_index?(index)
        false if index < 0 || index >= @items.length
        true
    end

    def swap(index_1, index_2)
        if valid_index?(index_1) && valid_index?(index_2)
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
            true
        else 
            false
        end
    end
end
