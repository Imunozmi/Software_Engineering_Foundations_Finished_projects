class ComputerPlayer

    attr_reader :mark_value

    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position(legal_pos_arr)
        pos = legal_pos_arr.sample
        p "Computer player " + @mark_value.to_s + " ha placed a mark at " + pos[0].to_s + "-" + pos[1].to_s
        return pos
    end

end