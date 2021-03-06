class Room

    def initialize (cap)
        @capacity = cap
        @occupants = []
    end

    #getters
    def capacity
        @capacity
    end

    def occupants
        @occupants
    end

    def full?
        @occupants.length >= @capacity
    end

    def available_space
        @capacity - @occupants.length
    end

    def add_occupant (name)
        return false if full?
        @occupants << name
        true
    end

end
