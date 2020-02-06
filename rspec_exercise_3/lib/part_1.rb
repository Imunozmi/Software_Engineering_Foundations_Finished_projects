
def is_prime? (num)
    return false if num < 2
    (2...num).all? { |fact| !(num % fact == 0) }
end

def nth_prime (nth)
    n = 1
    primes_found = 0

    while primes_found < nth
        n += 1
        primes_found += 1 if is_prime?(n)
    end

    n
end

def prime_range (min, max)

    (min..max).select { |num| num if is_prime?(num) }

end