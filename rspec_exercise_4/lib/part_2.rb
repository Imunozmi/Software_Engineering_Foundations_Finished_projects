
def proper_factors (num)
    (1...num).select { |fact| fact if num % fact == 0 }
end

def aliquot_sum (num)
    proper_factors(num).sum
end

def perfect_number? (num)
    num == aliquot_sum(num)
end

def ideal_numbers (n)
    ideals = []
    candidate = 1
    
    while ideals.length < n
        ideals << candidate if perfect_number?(candidate)
        candidate += 1
    end

    ideals
end