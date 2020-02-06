
def my_reject (arr, &prc)
    arr.select { |ele| !(prc.call(ele)) }
end

def my_one? (arr, &prc)
    arr.select { |ele| prc.call(ele) }.length == 1
end

def hash_select (hsh, &prc)
    new_hsh = Hash.new
    hsh.map { |k, v| new_hsh[k] = v if prc.call(k, v) }
    new_hsh
end

def xor_select (arr, prc1, prc2)
    arr.select { |ele| [prc1.call(ele), prc2.call(ele)].one? }
end

def proc_count (val, arr)
    arr.count { |prc| prc.call(val) }
end