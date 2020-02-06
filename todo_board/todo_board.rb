require './item.rb'
require './list.rb'

class TodoBoard

    def initialize
        @lists = Hash.new
    end

    def get_command
        print "\nEnter a command:"
        cmd, *args = gets.chomp.split(" ")

        case cmd
        when "mklist"
            @lists[*args] = List.new(*args)
        when "ls"
            @lists.each { |k, v| p k }
        when "showall"
            @lists.each { |k, v| v.print }
        when "mktodo"
            @lists[args[0]].add_item(*args[1..-1])
        when "up"
            list = @lists[args[0]]
            args = args.map { |ele| ele.to_i }
            list.up(*args[1..-1])
        when "down"
            list = @lists[args[0]]
            args = args.map { |ele| ele.to_i }
            list.down(*args[1..-1])
        when "swap"
            list = @lists[args[0]]
            args = args.map { |ele| ele.to_i }
            list.swap(*args[1..-1])
        when "sort"
            @lists[args[0]].sort_by_date!
        when "priority"
            @lists[args[0]].print_priority
        when "print"
            list = @lists[args[0]]
            args = args.map { |ele| ele.to_i }
            args[1..-1] == [] ? list.print : list.print_full_item(*args[1..-1])
        when "toggle"
            list = @lists[args[0]]
            args = args.map { |ele| ele.to_i }
            list.toggle_item(*args[1..-1])
        when "rm"
            list = @lists[args[0]]
            args = args.map { |ele| ele.to_i }
            list.remove_item(*args[1..-1])
        when "purge"
            @lists[args[0]].purge
        when "quit"
            return false
        else
            print "Sorry, command is not recognized"
        end
        true
    end

    def run
        com = true

        while com
            com = self.get_command
        end
    end
end

to_do = TodoBoard.new
to_do.run