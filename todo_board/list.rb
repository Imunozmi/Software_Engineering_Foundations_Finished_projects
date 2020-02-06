require './item.rb'

class List

    attr_reader :label

    def initialize(label)
        @label = label
        @items = []
    end

    def label=(new_label)
        @label = new_label
    end

    def add_item(ttl, ddln, des = "")
        Item.valid_date?(ddln) ? @items << Item.new(ttl, ddln, des) : false
    end

    def size
        @items.size
    end

    def valid_index?(idx)
        @items[idx] != nil
    end

    def swap(idx_1, idx_2)
        @items[idx_1], @items[idx_2] = @items[idx_2], @items[idx_1] if self.valid_index?(idx_1) && self.valid_index?(idx_2)
    end

    def [](idx)
        self.valid_index?(idx) ? @items[idx] : nil
    end

    def priority
        @items[0]
    end

    def print
        p "-".ljust(40, "-")
        b = (40 - @label.length) / 2
        a = b + @label.length
        p "".ljust(b, " ") + @label.upcase.ljust(a)
        p "-".ljust(40, "-")
        p "Index | Item ".ljust(20, " ") + "| Deadline   | " + "Done "
        p "-".ljust(40, "-")
        (0...@items.length).each do |i|
            p i.to_s.ljust(6, " ") + "| #{@items[i].title}".ljust(14, " ") + "| #{@items[i].deadline}".ljust(13, " ") + "| [#{@items[i].done? ? "X" : " " }]  "
        end
        p "-".ljust(40, "-")
    end

    def print_full_item(idx)
        raise "invalid index" if idx < 0 || idx > @items.length - 1
        p "-".ljust(40, "-")
        p @items[idx].title.ljust(40, " ")
        p "#{@items[idx].done? ? "done" : "not done" }".ljust(40, " ")
        p @items[idx].deadline.ljust(40, " ")
        p @items[idx].description.ljust(40, " ")
        p "-".ljust(40, "-")
    end

    def print_priority
        print_full_item(0)
    end

    def up(idx, amount=1)
        return false if !self.valid_index?(idx)

        item = @items[idx]
        while amount > 0
            return true if item == @items[0]

            self.swap(idx, idx - 1)
            amount -= 1
            idx -= 1
        end
        true
    end

    def down(idx, amount=1)
        return false if !self.valid_index?(idx)

        item = @items[idx]
        while amount > 0
            return true if item == @items[-1]

            self.swap(idx, idx + 1)
            amount -= 1
            idx += 1
        end
        true
    end

    def sort_by_date!
        @items.sort_by! { |itm| itm.deadline }
    end

    def toggle_item(idx)
        @items[idx].toggle
    end

    def remove_item(idx)
        if self.valid_index?(idx) 
            @items.delete_at(idx)
            true
        else
            false
        end
    end

    def purge
        @items.select! { |itm| !itm.done? }
    end
end