def partition (arr, n)
    parts = [[],[]]

    arr.each do |ele|
        if ele < n
            parts[0] << ele
        else
            parts[1] << ele
        end
    end

    parts
end

def merge (hash_1, hash_2)
    final = Hash.new(0)
    all_keys = []
    all_keys << hash_1.keys + hash_2.keys
    all_keys = all_keys.flatten.sort

    all_keys.each do |key|
        if hash_1.has_key?(key) && !hash_2.has_key?(key)
            final[key] = hash_1[key]
        else
            final[key] = hash_2[key]
        end
    end

    final

end

def censor (sent, curses)
    words = sent.split(" ")
    vows = "aeiou"

    words.select do |wrd|
        if curses.include?(wrd.downcase)
            wrd.each_char.with_index do |char, idx|
                if vows.include?(char.downcase)
                    wrd[idx] = "*"
                end
            end
            wrd
        else
            wrd
        end
    end

    words.join(" ")
end

def power_of_two? (num)
    while num > 2
        if num % 2 == 0
            num = num / 2
        else
            return false
        end
    end
    return true
end