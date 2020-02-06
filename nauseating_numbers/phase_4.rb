
def mersenne_prime(nth)

    mers_found = 0
    pow = 2
    while mers_found < nth
        mers_found += 1 if is_prime?(pow-1)   
        return pow-1 if mers_found == nth
        pow = pow * 2
    end
end

def is_prime? (num)
    return false if num < 2
    (2...num).all? { |fact| !(num % fact == 0) }
end

# p mersenne_prime(1) # 3
# p mersenne_prime(2) # 7
# p mersenne_prime(3) # 31
# p mersenne_prime(4) # 127
# p mersenne_prime(6) # 131071

def triangular_word?(str)
    alpha = ("a".."z").to_a

    val = str.split("").sum { |char| alpha.find_index(char) + 1 }
    
    (0...val).any? { |i| (i * (i + 1)) / 2 == val }
end

# p triangular_word?('abc')       # true
# p triangular_word?('ba')        # true
# p triangular_word?('lovely')    # true
# p triangular_word?('question')  # true
# p triangular_word?('aa')        # false
# p triangular_word?('cd')        # false
# p triangular_word?('cat')       # false
# p triangular_word?('sink')      # false

def consecutive_collapse(arr)

    n = (0...arr.length-1).to_a.index do |i|
        a = arr[i]
        b = arr[i+1]

        a == b + 1 || b == a + 1
    end   
    return arr if n == nil
    
    narr = arr[0...n] + arr[n+2..-1]
    if narr == consecutive_collapse(narr)
        return narr
    else
        return consecutive_collapse(narr)
    end
end

# p consecutive_collapse([3, 4, 1])                     # [1]
# p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
# p consecutive_collapse([9, 8, 2])                     # [2]
# p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
# p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
# p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
# p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
# p consecutive_collapse([13, 11, 12, 12])              # []

def pretentious_primes(arr, nth)

    arr.map do |ele|
        primes = 0
        i = ele

        if nth > 0
            while primes < nth
                i += 1
                primes += 1 if is_prime?(i)
            end
            i
        else 
            while i > 0 && primes < -(nth)
                i -= 1
                primes += 1 if is_prime?(i)
            end
            i == 0 ? nil : i
        end
    end

end

# p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
# p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
# p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
# p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
# p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
# p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
# p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
# p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
# p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
# p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]