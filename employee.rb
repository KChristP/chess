class Employee
  attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name, @title, @salary, @boss = name, title, salary, boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end

end

class Manager < Employee
  attr_reader :employees
  def initialize(name, title, salary, boss, *employees)
    # super
    @employees = employees
    super(name, title, salary, boss)
    # @employees = *employees
  end

  def bonus(multiplier)
    # bonus = @employees.inject {|accum, employee| accum += employee.salary }
    accum = 0
    @employees.each do |emp|
      accum+=emp.salary
    end

    accum *= multiplier
  end

end



shawna = Employee.new("Shawna", "TA", 12_000,"Shawna")
david = Employee.new("David", "TA", 10_000, "Darren")
darren = Manager.new("Darren", "TA Manager", 78_000, "Ned", shawna, david)
ned = Manager.new("Ned","Founder", 1_000_000, "nil", darren, shawna, david)
# ned = Manager.new(darren,david,shawna)
p ned

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
