class HumanPlayer

    attr_reader :mark_value

    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position
        nums = "0123456789"

        p "Player " + mark_value.to_s + " enter two numbers representing a position in the format 'row col': "
        inp = gets.chomp
        pos = inp.split(" ").map { |ele| ele.to_i }

        if pos.length != 2
            raise "wrong number of coordinates"
        else
            inp.each_char do |char|
                if !nums.include?(char) && char != " "
                    raise "only numbers as coordinates"
                end
            end
        end

        pos
    end
end