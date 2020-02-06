
def conjunct_select(arr, *proc_arr)
    arr.select do |ele|
        proc_arr.all? { |prc| prc.call(ele) }
    end
end

# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

def convert_pig_latin(str)
    vows = "aeiou"

    pig = str.split(" ").map do |wrd|
        cap = wrd == wrd.capitalize

        if wrd.length < 3
            pig_wrd = wrd
        elsif vows.include?(wrd[0].downcase)
            pig_wrd = wrd + "yay" 
        else
            frst = (0...wrd.length).find { |i| vows.include?(wrd[i]) }
            pig_wrd = wrd[frst..-1] + wrd[0...frst] + "ay"
        end

        if cap
            pig_wrd.capitalize
        else
            pig_wrd
        end
    end

    pig.join(" ")
end


# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

def reverberate(str)
    
    new_str = str.split(" ").map do |wrd|
        new_wrd = wrd.length > 3 ? reverberate_word(wrd) : wrd
        wrd.capitalize == wrd ? new_wrd.capitalize : new_wrd
    end

    new_str.join(" ")
end

def reverberate_word(wrd)
    vows = "aeiou"
    return wrd * 2 if vows.include?(wrd[-1].downcase)
    (1..wrd.length).each do |i|
        if vows.include?(wrd[-i]) 
            return wrd + wrd[-i..-1]
        end
    end
end

# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

def disjunct_select(arr, *proc_arr)
    arr.select { |ele| proc_arr.any? { |prc| prc.call(ele) } }
end

# longer_four = Proc.new { |s| s.length > 4 }
# contains_o = Proc.new { |s| s.include?('o') }
# starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) # ["ace", "dog", "apple", "teeming", "boot"]

def alternating_vowel(str)
    vows = "aeiou"

    new_str = str.split(" ").map.with_index do |wrd, idx|
        idx % 2 == 0 ? remove_first_vowel(wrd) : remove_first_vowel(wrd.reverse).reverse
    end

    new_str.join(" ")
end

def remove_first_vowel(wrd)
    vows = "aeiou"
    wrd.split("").each_with_index do |char, idx|  
        return wrd[0...idx] + wrd[idx+1..-1] if vows.include?(char)
    end
    wrd
end

# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"

def silly_talk(str)
    vows = "aeiou"

    new_talk = str.split(" ").map do |wrd|
        if vows.include?(wrd[-1].downcase)
            wrd + wrd[-1]
        else
            silly = wrd.split("").map do |char|
                if vows.include?(char)
                    char + "b" + char
                else
                    char
                end
            end
            silly.join("")
        end
    end

    new_talk.join(" ")
end

# p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
# p silly_talk('They can code') # "Thebey caban codee"
# p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"

def compress(wrd)
    new_wrd = ""
    char = wrd[0]
    count = 1
    (1..wrd.length).each do |i|
        if char != wrd[i]
            new_wrd += char
            new_wrd += count.to_s if count > 1
            count = 1
        else
            count += 1
        end    
        char = wrd[i]   
    end

    new_wrd
end

p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"