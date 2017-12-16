# require_relative "Manager"
require 'byebug'

class Employee
  attr_reader :name, :salary, :title

  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    # debugger
    unless boss.nil?
      self.boss=(boss)
    else
      @boss = boss
    end
  end

  def bonus(multiplier)
    salary * multiplier
  end

  def boss=(boss)
    @boss = boss
    boss.employees.push(self)
  end


end

class Manager < Employee
  attr_reader :employees

  def initialize(name, title, salary, boss, employees = [])
    # debugger
    super(name, title, salary, boss)
    @employees = employees
  end

  def bonus(multiplier)
    total_salary = 0
    emp_arr = employees
    emp_arr.each do |employee|
      if employee.is_a? Manager
        emp_arr.concat(employee.employees)
      end
    end
      emp_arr.each do |emp|
        total_salary += emp.salary
      end
    total_salary * multiplier
  end

end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new('Darren', "TA Manager", 78000, ned)
shawna = Employee.new('Shawna', "TA", 12000, darren)
david = Employee.new('David', "TA", 10000, darren)
