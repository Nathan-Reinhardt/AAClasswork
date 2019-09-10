require_relative "room"

class Hotel
    attr_accessor :rooms

    def initialize(name, hash)
        @name = name
        @rooms = { }
        hash.each do |k, v|
            @rooms[k] = Room.new(v)
        end
    end

    def name
        @name.split.map { |word| word.capitalize }.join(" ")
    end

    def room_exists?(room_name)
        @rooms.has_key?(room_name)
    end

    def check_in(person, room_name)
        if self.room_exists?(room_name)
            if !@rooms[room_name].full?
                @rooms[room_name].add_occupant(person)
                p "check in successful"
            else
                p "sorry, room is full"
            end
        else
            p "sorry, room does not exist"
        end
    end

    def has_vacancy?
        count = 0
        @rooms.each do |k, v|
            if @rooms[k].full?
                count += 1
            end
        end
        if count == @rooms.keys.length
            return false
        end
        true
    end

    def list_rooms
        @rooms.each do |k, v|
            puts "#{k} : #{v.available_space}"
        end
    end
end
