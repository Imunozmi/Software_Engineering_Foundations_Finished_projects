
require "byebug"

def select_even_nums (nums)
    
    nums.select { |num| num % 2 == 0}

end

def reject_puppies (doges)

    doges.reject { |dog| dog["age"] < 3 }

end

def count_positive_subarrays (ars)

    ars.count { |sub| sub.sum > 0 }

end

def aba_translate (str)
    vowels = "aeiou"

    i = 0
    while i < str.length
        char = str[i]

        if vowels.include?(char)
            str.insert(i + 1, "b" + char)
            i += 2
        end

        i += 1
    end

    str
end

def aba_array (arr)

    arr.map { |wrd| aba_translate(wrd) }

end