
def element_count (arr)
    count = Hash.new { |h, k| h[k] = 0  }
    arr.each { |ele| count[ele] += 1 }
    count
end

def char_replace! (str, hsh)
    (0...str.length).each { |id| (str[id] = hsh[str[id]]) if hsh.has_key?(str[id]) }
    str
end

def product_inject (arr)
    arr.inject { |acc, ele| acc = acc * ele }
end