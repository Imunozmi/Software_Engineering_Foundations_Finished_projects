

def average (n, m)
    (n + m) / 2.0
end

def average_array(arr)
    nums = arr.inject { |acc, el| acc += el }
    nums.to_f / arr.length
end

def repeat (str, n)
    str * n
end

def yell (str)
    str.upcase + "!"
end

def alternating_case (sen)
    arr = sen.split(" ")

    up = true
    arr = arr.map do |wrd|
        if up
            up = false
            wrd.upcase
        else
            up = true
            wrd.downcase
        end
    end

    arr.join " "
end