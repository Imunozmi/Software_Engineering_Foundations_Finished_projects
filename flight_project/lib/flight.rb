
class Flight

    attr_reader :passengers

    def initialize(fl_num, cap)
        @flight_number = fl_num
        @capacity = cap
        @passengers = []
    end

    def full?
        @passengers.length >= @capacity
    end

    def board_passenger(pas)
        @passengers << pas if pas.has_flight?(@flight_number) && !self.full?
    end

    def list_passengers
        @passengers.map { |pas| pas.name }
    end

    def [](idx)
        @passengers[idx]
    end

    def <<(pas)
        self.board_passenger(pas)
    end
end