# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    start = num_1 > num_2 ? num_1 : num_2

    while start <= num_1 * num_2
        break if start % num_1 == 0 && start % num_2 == 0
        start += 1
    end

    start
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    bigrams = Hash.new (0)

    (0...str.length-1).each do |idx|
        bigrams[str[idx]+str[idx+1]] += 1
    end

    most = bigrams.max_by { |k, v| v}
    most[0]
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        self.map { |k, v| k, v = v, k }.to_h
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        count = 0
        self.each_with_index do |ele, idx| 
            count += (idx+1...self.length).count { |idx| ele + self[idx] == num }
        end   
        count
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
        not_sorted = true
        prc ||= Proc.new { |val1, val2| val1 <=> val2 }

        while not_sorted
            not_sorted = false

            (0...self.length-1).each do |idx|

                if prc.call(self[idx], self[idx+1]) == 1
                    self[idx], self[idx+1] = self[idx+1], self[idx]
                    not_sorted = true
                end
            end
        end
        
        self
    end
end
