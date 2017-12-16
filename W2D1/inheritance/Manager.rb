require_relative "Employee"

class Manager < Employee
  attr_reader :employees

  def initialize(name, title, salary, boss, employees = [])
    super(name, title, salary, boss)
    @employees = employees
  end

  def bonus(multiplier)
    total_salary = 0
    employees.each { |employee| total_salary += employee.salary }
    total_salary * multiplier
  end

end
