class HumanPlayer

    attr_reader :mark_value

    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position(legal_pos_arr)
        nums = "0123456789"

        p "Player " + mark_value.to_s + " enter two numbers representing a position in the format 'row col': "
        inp = gets.chomp
        pos = inp.split(" ").map { |ele| ele.to_i }

        while !legal_pos_arr.include?(pos)
            p "ivalid possition, please try again"
            pos = gets.chomp.split(" ").map { |ele| ele.to_i }
        end

        pos
    end
end