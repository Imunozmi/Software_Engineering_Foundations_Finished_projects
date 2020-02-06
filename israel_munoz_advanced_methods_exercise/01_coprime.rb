# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.

def coprime?(num1, num2)
    divs1 = get_divs(num1)
    divs2 = get_divs(num2)

    divs1.each do |el|
        if divs2.include? el
            return false
        end
    end

    return true

end

def get_divs(num)

    return (2..num).select do |el| 
        if num % el == 0
            el
        end
    end
end

p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false
