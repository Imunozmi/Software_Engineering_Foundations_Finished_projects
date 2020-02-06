
def zip (*arrs)
    
    (0...arrs[0].length).map do |i|
        (0...arrs.length).map do |j|
            arrs[j][i]
        end
    end    
end

def prizz_proc (arr, proc_1, proc_2)
    arr.select { |ele| [proc_1.call(ele), proc_2.call(ele)].one? }
end

def zany_zip (*arrs)
    len = arrs.max_by(&:length).length

    (0...len).map do |i|
        (0...arrs.length).map do |j|
            arrs[j][i]
        end
    end
end

def maximum (arr, &prc)
    arr.sort_by { |ele| prc.call(ele) }[-1]
end

def my_group_by (arr, &prc)
    hsh =  Hash.new { |h, k| h[k] = [] }

    arr.each do |ele|
        hsh[prc.call(ele)] << ele
    end

    hsh
end

def max_tie_breaker (arr, prc, &blc)
    hsh = my_group_by(arr, &blc)
    top_key = hsh.keys.max

    return hsh[top_key][0] if hsh[top_key].length == 1
        
    tie_arr = hsh[top_key]
    tie_hash = my_group_by(tie_arr, &prc)
    tie_key = tie_hash.keys.max

    return tie_hash[tie_key][0]
end

def silly_syllables (snt)
    wrds_arr = snt.split(" ")

    wrds_arr.map { |wrd| vowel_shorten(wrd) }.join(" ")
end

def vowel_shorten (wrd)
    vows = "aeiou"

    return wrd if wrd.split("").count { |char| vows.include? char } < 2

    (0...wrd.length).each do |i|
        if vows.include? wrd[i]
            (1..wrd.length).each do |j|
                return wrd[i..-j] if vows.include?(wrd[-j])
            end
        end
    end
end