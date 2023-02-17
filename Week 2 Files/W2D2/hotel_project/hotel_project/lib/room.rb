class Room
    def initialize(capacity)
        @capacity = capacity
        @occupants = []
    end

    attr_reader :capacity, :occupants

    def full?
        if @occupants.length < @capacity
            false
        elsif @occupants.length == @capacity
            true
        end
    end

    def available_space
        @capacity - @occupants.length
    end

    def add_occupant(name)
        return false if full?
        @occupants << name
        true
    end
end
