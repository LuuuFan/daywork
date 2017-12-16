require_relative "Manager"

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new('Darren', "TA Manager", 78000, ned)
shawna = Employee.new('Shawna', "TA", 12000, darren)
david = Employee.new('David', "TA", 10000, darren)
