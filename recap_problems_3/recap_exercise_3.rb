

def no_dupes?(arr)
    vals = Hash.new (0)

    arr.each { |ele| vals[ele] += 1 }

    vals.select { |k, v| k if v == 1 }.keys
end


# Examples
# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []


def no_consecutive_repeats?(arr)

    (0...arr.length-1).all? { |idx| arr[idx] != arr[idx+1] }

end


# Examples
# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true


def char_indices(str)
    indices = Hash.new { |h, k| h[k] = [] }

    str.each_char.with_index { |char, idx| indices[char] << idx }

    indices
end

# # Examples
# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}


def longest_streak(str)
    longest = ""
    contestant = ""

    str.each_char.with_index do |char, idx|
        contestant = char

        str[idx+1..-1].each_char do |char2|
            if char == char2
                contestant += char2
            else
                break
            end
        end

        longest = contestant if contestant.length >= longest.length
    end

    
    longest
end


# Examples
# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'


def bi_prime?(num)
    (2...num).any? { |n| num % n == 0 && is_prime?(n) && is_prime?(num/n) }
end

def is_prime?(num)
    (2...num).each { |n| return false if num % n == 0 }
    true
end

# Examples
# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false


def vigenere_cipher(str, k)
    alpha = ("a".."z").to_a

    msg = (0...str.length).map do |i|
        old_pos = alpha.index(str[i])
        new_pos = (old_pos + k[i%k.length]) % alpha.length
        alpha[new_pos]
    end

    msg.join()
end

# Examples
# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"


def vowel_rotate(str)
    vowels = ["a", "e", "i", "o", "u"]

    vows = []
    ids = []
    str.chars.each_with_index do |char, idx| 
        if vowels.include?(char)
            vows << char
            ids << idx
        end
    end

    vows.unshift(vows.pop())
    (0...vows.length).each { |i| str[ids[i]] = vows[i]}

    str
end

# Examples
# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"

###################################################
#         PROC PROBLEMS
###################################################
class String

    def select (&prc)
        arr = self.chars
        prc ||= Proc.new { false }

        arr.map { |ele| ele if prc.call(ele) }.join("")
    end

    def map! (&prc)
        self.each_char.with_index { |ch, idx| self[idx] = prc.call(ch, idx) }
    end
end

# Examples
# p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# p "HELLOworld".select          # => ""


# Examples
# word_1 = "Lovelace"
# word_1.map! do |ch| 
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1        # => "Lov3l4c3"

# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2        # => "DiJkStRa"


###################################################
#              RECURSION PROBLEMS                 #
###################################################

def multiply (a, b)
    return 0 if b == 0
    
    if b < 0 
        -(a + multiply(a, (-b) - 1 ))
    else
        a + multiply(a, b - 1 )
    end
end

# Examples
# p multiply(3, 5)        # => 15
# p multiply(5, 3)        # => 15
# p multiply(2, 4)        # => 8
# p multiply(0, 10)       # => 0
# p multiply(-3, -6)      # => 18
# p multiply(3, -6)       # => -18
# p multiply(-3, 6)       # => -18

def lucas_sequence(len)
    return [] if len <= 0
    return [2] if len == 1
    return [2, 1] if len == 2

    return lucas_sequence(len-1) << lucas_sequence(len-1)[-2..-1].sum
end

# Examples
# p lucas_sequence(0)   # => []
# p lucas_sequence(1)   # => [2]    
# p lucas_sequence(2)   # => [2, 1]
# p lucas_sequence(3)   # => [2, 1, 3]
# p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

def prime_factorization(num)
    (2...num).each do |fact|
        if num % fact == 0 
            fact_2 = num / fact
            return [ *prime_factorization(fact), *prime_factorization(fact_2) ]
        end
    end

    [ num ]
end

# # Examples
# p prime_factorization(12)     # => [2, 2, 3]
# p prime_factorization(24)     # => [2, 2, 2, 3]
# p prime_factorization(25)     # => [5, 5]
# p prime_factorization(60)     # => [2, 2, 3, 5]
# p prime_factorization(7)      # => [7]
# p prime_factorization(11)     # => [11]
# p prime_factorization(2017)   # => [2017]