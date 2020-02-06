require_relative "code"

class Mastermind

    def initialize (len)
        @secret_code = Code.random(len)
    end

    def print_matches (guess)
        print "exact matches: #{@secret_code.num_exact_matches(guess)}"
        print "near matches: #{@secret_code.num_near_matches(guess)}"
    end

    def ask_user_for_guess
        print "Enter a code"
        guess = Code.from_string(gets.chomp)
        print_matches(guess)
        @secret_code == guess
    end

end
