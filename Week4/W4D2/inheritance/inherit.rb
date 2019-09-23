class Employee
  attr_reader :salary, :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end
  
  private
  def bonus(multi)
    bonus = @salary * multi
  end
end

class Manager < Employee

  def initialize(name, title, salary, boss, employees)
    super(name, title, salary, boss)
    @employees = employees
  end

  def bonus(multi)
    sum = 0
    @employees.each do |employee| 
      sum += employee.salary
    end

    bonus = sum * multi 
  end
end

e1 = Employee.new('bob', 'TA', 500, 'elliot')
e2 = Employee.new('patrick', 'TA', 500, 'elliot')
e3 = Employee.new('cinna', 'TA', 500, 'elliot')
e4 = Employee.new('toast', 'TA', 500, 'elliot')

array = [e1, e2, e3, e4]

m1 = Manager.new('bob', 'TA', 500, 'darren', array)
p m1.bonus(4)
