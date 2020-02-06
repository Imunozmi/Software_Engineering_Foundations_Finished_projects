
require "byebug"

def reverser (str, &prc)
    prc.call(str.reverse)
end

def word_changer (str, &prc)
    wrds = str.split(" ")

    wrds = wrds.map { |wrd| prc.call(wrd) }

    wrds.join(" ")
end

def greater_proc_value (num, prc_1, prc_2)

    prc_1.call(num) > prc_2.call(num) ? prc_1.call(num) : prc_2.call(num) 

end

def and_selector (arr, prc_1, prc_2)
    narr = []

    arr.each { |ele| narr << ele if prc_1.call(ele) && prc_2.call(ele) }

    narr
end

def alternating_mapper (arr, prc_1, prc_2)
    arr.map.with_index do |ele, idx|
        if idx % 2 == 0
            prc_1.call(ele)
        else
            prc_2.call(ele)
        end
    end
end