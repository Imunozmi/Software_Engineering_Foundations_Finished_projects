def hipsterfy (str)
    vows = "aeiou"
    str = str.split("")

    (0...str.length).each do |idx|
        if vows.include? str[-idx]
            str.delete_at(-idx)
            return str.join("")
        end
    end

    str.join("")
end

def vowel_counts (str)
    vows = "aeiou"
    counter = Hash.new(0)
    str = str.downcase

    str.each_char do |char|  
        if vows.include?(char)
            counter[char] += 1
        end
    end

    counter
end

def caesar_cipher (msg, n)
    alpha = ("a".."z").to_a

    msg = msg.downcase.chars.map do |char|
        if alpha.include?(char)
            shifted_idx = (alpha.index(char) + n) % alpha.length
            alpha[shifted_idx]
        else
            char
        end
    end

    msg.join("")
end