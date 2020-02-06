# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array

    def span
        return nil if self.length < 1
        return self.max - self.min
    end

    def average
        return nil if self.length < 1
        self.sum / self.length.to_f
    end
  
    def median
        return nil if self.length < 1
        sorted = self.sort
        half = self.length / 2
        if self.length % 2 == 0
            sorted[half-1..half].average
        else
            sorted[half]
        end
    end

    def counts
        count = Hash.new {0}
        self.each { |ele| count[ele] += 1 }
        count
    end

    def my_count (val)
        self.counts[val]
    end

    def my_index (val)
        self.each_with_index { |ele, idx| return idx if ele == val }
        return nil
    end

    def my_uniq
        narr = []
        self.each { |ele| narr << ele if !narr.include?ele }
        narr
    end

    def my_transpose
        transposed = []
        loops = self.length

        loops.times do |i|
            transposed[i] = []
            loops.times do |j|
                transposed[i] << self[j][i]
            end
        end

        transposed
    end
end
