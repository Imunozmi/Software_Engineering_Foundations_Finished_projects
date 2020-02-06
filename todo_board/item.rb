
class Item

    attr_reader :title, :deadline, :description

    def initialize(ttl, ddln, des)
        raise "invalid date" if !(Item.valid_date?(ddln))

        @title = ttl
        @deadline = ddln
        @description = des
        @done = false
    end

    def self.valid_date?(dt)
        dt = dt.split("-")
        !(dt.size != 3 || dt[0].length != 4 || dt[0].to_i < 1000 || dt[1].to_i < 1 || dt[1].to_i > 12 || dt[2].to_i < 1 || dt[2].to_i > 31)
    end

    def title=(new_title)
        @title = new_title 
    end

    def deadline=(new_deadline)
        raise "invalid date" if !(Item.valid_date?(new_deadline))
        @deadline = new_deadline
    end

    def description=(new_description)
        @description = new_description
    end

    def toggle
        @done = @done ? false : true
    end

    def done?
        @done ==  true
    end
end