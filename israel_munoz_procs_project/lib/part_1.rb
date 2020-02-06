
require "byebug"

def my_map (arr, &prc)
    narr = []

    arr.each { |ele| narr << prc.call(ele) }

    narr
end

def my_select (arr, &prc)
    narr = []

    arr.each { |ele| narr << ele if prc.call(ele) }

    narr
end

def my_count (arr, &prc)
    count = 0

    arr.each { |ele| count += 1 if prc.call(ele) }

    count
end

def my_any? (arr, &prc)
    arr.each { |ele| return true if prc.call(ele) }

    false
end

def my_all? (arr, &prc)
    arr.each { |ele| return false if !prc.call(ele) }

    true
end

def my_none? (arr, &prc)
    arr.each { |ele| return false if prc.call(ele) }

    true
end