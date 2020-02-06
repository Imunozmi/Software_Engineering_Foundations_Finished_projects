require "employee"

class Startup

    attr_reader :name, :funding, :salaries, :employees

    def initialize (name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title? (title)
        @salaries.has_key? title
    end

    def > (strtp) 
        self.funding > strtp.funding
    end

    def hire (employee_name, title)
        if valid_title? title
            @employees << Employee.new(employee_name, title)
        else
            raise error
        end
    end

    def size
        @employees.length
    end

    def pay_employee (emp)
        payment = salaries[emp.title]
        if payment <= funding
            emp.pay(payment)
            @funding -= payment
        else
            raise "not enough funding"
        end
    end

    def payday 
        employees.each { |emp| pay_employee(emp) }
    end

    def average_salary
        sum = 0
        employees.each { |emp| sum += salaries[emp.title] }
        sum / employees.length.to_f
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire (strtp)
        @funding += strtp.funding
        strtp.salaries.each { |title, salary| self.salaries[title] = salary if !self.salaries.has_key?(title) }
        strtp.employees.each { |emp| self.employees << emp }
        strtp.close
    end
end
