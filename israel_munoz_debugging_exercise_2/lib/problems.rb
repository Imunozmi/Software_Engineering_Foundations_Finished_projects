# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

require "byebug"

def largest_prime_factor (num)
    
    i = num
    while i > 2
        return i if num % i == 0 && is_prime?(i)
        i -= 1
    end

   return i
end

def is_prime? (num)

    (2...num).each do |i|
        if num % i == 0
            return false
        end
    end

    true
end

def unique_chars? (str)
    chars = []

    str.each_char do |char|
        return false if chars.include?(char)
        chars << char
    end

    true
end

def dupe_indices (arr)
    dupes = Hash.new{|hash, key| hash[key] = Array.new}

    # debugger
    arr.each_with_index do |ele, idx| 
        dupes[ele] << idx if arr.count(ele) > 1
    end

    dupes
end

def ana_array (arr1, arr2)
    return false if arr1.length != arr2.length

    (0...arr1.length).each do |idx|
        return false if !arr2.include?(arr1[idx]) || !arr1.include?(arr2[idx])
    end

    true
end