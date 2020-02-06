require_relative "room"

class Hotel
  
    def initialize (name, rooms)
        @name = name
        @rooms = Hash.new 
        rooms.each { |k, v| @rooms[k] = Room.new(v) }
    end

    #getters
    def name
        @name.split(" ").map(&:capitalize).join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists? (room)
        @rooms.include? (room)
    end

    def check_in (person, room)
        if room_exists? (room)
            if @rooms[room].add_occupant(person)
                print "check in successful"
            else
                print "sorry, room is full"
            end
        else
            print "sorry, room does not exist"
            false
        end
    end

    def has_vacancy?
        @rooms.any? { |k, v| !v.full? }
    end

    def list_rooms
        @rooms.each do |k, v|
            print k + v.available_space.to_s + "\n"
        end
    end

end

