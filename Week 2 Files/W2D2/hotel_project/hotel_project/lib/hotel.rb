require_relative "room"

class Hotel
    def initialize(name, hash_rooms)
        @name = name
        @rooms = Hash.new
        hash_rooms.each { |k, v| @rooms[k] = Room.new(v) }
    end

    def name
        words = @name.split(" ")
        new_words = words.map { |word| word.capitalize }
        new_words.join(" ")
    end

    attr_reader :rooms

    def room_exists?(room_name)
        @rooms.has_key?(room_name) ? true : false
    end

    def check_in(person, room_name)
        if room_exists?(room_name)
            if @rooms[room_name].add_occupant(person)
                p "check in successful"
            else
                p "sorry, room is full"
            end
        else
            p "sorry, room does not exist"
        end
    end

    def has_vacancy?
        @rooms.values.any? { |room| room.available_space > 0 }
    end

    def list_rooms
        @rooms.each do |room_name, room|
            puts "#{room_name} : #{room.available_space}"
        end
    end
end
