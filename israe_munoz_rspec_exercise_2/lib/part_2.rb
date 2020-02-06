
def palindrome? (str)
    nstr = ""

    i = str.length - 1
    while i >= 0
        nstr += str[i]
        i -= 1
    end

    str == nstr
end

def substrings (str)
    subs = []

    (0...str.length).each do |i|
        (i...str.length).each do |j|
            subs << str[i..j]
        end
    end

    subs
end

def palindrome_substrings (str)
    substrings(str).select { |sub| sub.length > 1 && palindrome?(sub) }
end
