require "employee"

class Startup
    #Part 2
    
    attr_accessor :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(startup_2)
        self.funding > startup_2.funding
    end

    def hire(name, title)
        if self.valid_title?(title)
            @employees << Employee.new(name, title)
        else
            error
        end
    end

    def size
        self.employees.length
    end

    def pay_employee(employee)
        if @funding >= @salaries[employee.title]
            @funding -= @salaries[employee.title]
            employee.pay(@salaries[employee.title])
        else
            dfjskdfsl
        end
    end

    def payday
        @employees.each { |employee| self.pay_employee(employee) }
    end
    
    #Part 3

    def average_salary
        average = 0
        @employees.each do |employee|
            average += @salaries[employee.title]
        end
        return average / employees.length 
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(other_startup)
        self.funding += other_startup.funding

        other_startup.salaries.each do |title, salary|
            if !self.salaries.has_key?(title)
                self.salaries[title] = salary
            end
        end

        other_startup.employees.each do |employee|
            self.employees << employee
        end

        other_startup.close
    end
end
